#!/usr/bin/env python2.7

from __future__ import division, print_function

import rospy

import time

import numpy as np
import cv2

from tf import transformations as tft
from dougsm_helpers.timeit import TimeIt

from dougsm_helpers.gridshow import gridshow

from ggcnn.srv import GraspPrediction, GraspPredictionResponse
from sensor_msgs.msg import Image, CameraInfo
from ggcnn.ggcnn import predict, process_depth_image
#import ggcnn_torch
#import predict, process_depth_image

import cv_bridge
bridge = cv_bridge.CvBridge()

TimeIt.print_output = False


class GGCNNService:
    def __init__(self):

        # Get the camera parameters
        print('Begin GGCNNService() Init...')
        cam_info_topic = rospy.get_param('~camera/info_topic')
        print('cam_info_topic: ' + cam_info_topic)
        camera_info_msg = rospy.wait_for_message(cam_info_topic, CameraInfo)
        print('camera_info_msg: ' + str(camera_info_msg))
        self.cam_K = np.array(camera_info_msg.K).reshape((3, 3))
        self.img_pub = rospy.Publisher('~visualisation', Image, queue_size=1)
        rospy.Service('~predict', GraspPrediction,
                      self.compute_service_handler)
        self.base_frame = rospy.get_param('~camera/robot_base_frame')
        print('robot_base_frame: ' + self.base_frame)
        self.camera_frame = rospy.get_param('~camera/camera_frame')
        self.img_crop_size = rospy.get_param('~camera/crop_size')
        self.img_crop_y_offset = rospy.get_param('~camera/crop_y_offset')
        self.cam_fov = rospy.get_param('~camera/fov')

        self.counter = 0
        self.curr_depth_img = None
        self.curr_img_time = 0
        self.last_image_pose = None
        rospy.Subscriber(rospy.get_param('~camera/depth_topic'),
                         Image, self._depth_img_callback, queue_size=1)

        self.waiting = False
        self.received = False
        print('GGCNNService() Init complete...')

    def _depth_img_callback(self, msg):
        # Doing a rospy.wait_for_message is super slow, compared to just subscribing and keeping the newest one.
        if not self.waiting:
            print('Waiting inside img callback...')
            rospy.sleep(1)
            return

        self.curr_img_time = time.time()
        self.last_image_pose = tfh.current_robot_pose(
            self.base_frame, self.camera_frame)
        self.curr_depth_img = bridge.imgmsg_to_cv2(msg)
        self.received = True
        print('Img callback complete...')

    def compute_service_handler(self, req):
        
        print('Inside compute_service_handler')

        # keep commented as realsense node is too unreliable
#        if self.curr_depth_img is None:
#            rospy.logerr('No depth image received yet.')
#            rospy.sleep(0.5)

#        if time.time() - self.curr_img_time > 0.5:
#            rospy.logerr('The Realsense node has died')
#            return GraspPredictionResponse()

        self.waiting = True
        while not self.received:
	    print('Waiting inside service handler...');
            rospy.sleep(0.01)

        self.waiting = False
        self.received = False

        with TimeIt('Total'):
            depth = self.curr_depth_img.copy()

            camera_pose = self.last_image_pose
            cam_p = camera_pose.position
            camera_rot = tft.quaternion_matrix(
                tfh.quaternion_to_list(camera_pose.orientation))[0:3, 0:3]

            # Do grasp prediction
            depth_crop, depth_nan_mask = process_depth_image(
                depth, self.img_crop_size, 300, return_mask=True, crop_y_offset=self.img_crop_y_offset)

            #cv2.imshow('image',depth)
            #cv2.waitKey(0)
            
            points, angle, width_img, _ = predict(
                depth_crop, process_depth=False, depth_nan_mask=depth_nan_mask, filters=(2.0, 2.0, 2.0))

            # Mask Points Here

            # Correct for the rotation of the camera
            angle -= np.arcsin(camera_rot[0, 1])
            angle = (angle + np.pi/2) % np.pi - np.pi / \
                2  # Wrap [-np.pi/2, np.pi/2]

            # Convert to 3D positions.
            imh, imw = depth.shape
            x = ((np.vstack((np.linspace((imw - self.img_crop_size) // 2, (imw - self.img_crop_size) // 2 + self.img_crop_size,
                 depth_crop.shape[1], np.float), )*depth_crop.shape[0]) - self.cam_K[0, 2])/self.cam_K[0, 0] * depth_crop).flatten()
            y = ((np.vstack((np.linspace((imh - self.img_crop_size) // 2 - self.img_crop_y_offset, (imh - self.img_crop_size) // 2 + self.img_crop_size -
                 self.img_crop_y_offset, depth_crop.shape[0], np.float), )*depth_crop.shape[1]).T - self.cam_K[1, 2])/self.cam_K[1, 1] * depth_crop).flatten()
            pos = np.dot(camera_rot, np.stack((x, y, depth_crop.flatten()))
                         ).T + np.array([[cam_p.x, cam_p.y, cam_p.z]])

            width_m = width_img / 300.0 * 2.0 * depth_crop * \
                np.tan(self.cam_fov * self.img_crop_size /
                       depth.shape[0] / 2.0 / 180.0 * np.pi)

            best_g = np.argmax(points)
            best_g_unr = np.unravel_index(best_g, points.shape)

            ret = GraspPredictionResponse()
            ret.success = True
            g = ret.best_grasp
            g.pose.position.x = pos[best_g, 0]
            g.pose.position.y = pos[best_g, 1]
            g.pose.position.z = pos[best_g, 2]
            g.pose.orientation = tfh.list_to_quaternion(tft.quaternion_from_euler(
                np.pi, 0, ((angle[best_g_unr] % np.pi) - np.pi/2)))
            g.width = width_m[best_g_unr]
            g.quality = points[best_g_unr]

            show = gridshow('Display', [depth_crop, points],
                            [(0.30, 0.55), None, (-np.pi/2, np.pi/2)],
                            [cv2.COLORMAP_BONE, cv2.COLORMAP_JET, cv2.COLORMAP_BONE],
                            3, False)

            self.img_pub.publish(bridge.cv2_to_imgmsg(show))
            return ret


if __name__ == '__main__':
    rospy.init_node('ggcnn_service')
    import dougsm_helpers.tf_helpers as tfh
    GGCNN = GGCNNService()
    print(GGCNN)
    rospy.spin()
