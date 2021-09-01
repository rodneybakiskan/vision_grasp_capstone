#! /usr/bin/env python

from __future__ import division, print_function

import rospy

import os
import time
import datetime


from std_msgs.msg import Int16
from geometry_msgs.msg import Twist
# from franka_msgs.msg import FrankaState, Errors as FrankaErrors

#import dougsm_helpers.tf_helpers as tfh
# from dougsm_helpers.ros_control import ControlSwitcher

from ggcnn.msg import Grasp
from ggcnn.srv import GraspPrediction


class OpenLoopGraspController(object):

    def __init__(self):
        ggcnn_service_name = '/ggcnn_service'
        rospy.wait_for_service(ggcnn_service_name + '/predict')
        self.ggcnn_srv = rospy.ServiceProxy(
            ggcnn_service_name + '/predict', GraspPrediction)

        self.best_grasp = Grasp()

        # self.pregrasp_pose = [(rospy.get_param('/grasp_entropy_node/histogram/bounds/x2') + rospy.get_param('/grasp_entropy_node/histogram/bounds/x1'))/2 - 0.03,
        #                      (rospy.get_param('/grasp_entropy_node/histogram/bounds/y2') + rospy.get_param('/grasp_entropy_node/histogram/bounds/y1'))/2 + 0.10,
        #                      rospy.get_param('/grasp_entropy_node/height/z1') + 0.05,
        #                      2**0.5/2, -2**0.5/2, 0, 0]

        # self.last_weight = 0
        # self.__weight_increase_check()

    # def __recover_robot_from_error(self):
    #    rospy.logerr('Recovering')
    #    self.pc.recover()
    #    rospy.logerr('Done')
    #    self.ROBOT_ERROR_DETECTED = False


    def get_grasp(self):

        ret = self.ggcnn_srv.call()
        if not ret.success:
            print("failed grasp")
            return False

        best_grasp = ret.best_grasp
        self.best_grasp = best_grasp
        print(best_grasp)
        rospy.sleep(1)
        
        #tfh.publish_pose_as_transform(best_grasp.pose, 'camera_link', 'G', 0.5)

        if input('Continue?') == '0':
            return False

        # Offset for initial pose.
    #        initial_offset = 0.10
    #        LINK_EE_OFFSET = 0.138

        # Add some limits, plus a starting offset.
    #        best_grasp.pose.position.z = max(best_grasp.pose.posit
    # ion.z - 0.01, 0.026)  # 0.021 = collision with ground
    #        best_grasp.pose.position.z += initial_offset + LINK_EE_OFFSET  # Offset from end efector position to

    #        self.pc.set_gripper(best_grasp.width, wait=False)
    #        rospy.sleep(0.1)
    #        self.pc.goto_pose(best_grasp.pose, velocity=0.1)

        # Reset the position
    #        best_grasp.pose.position.z -= initial_offset + LINK_EE_OFFSET

        return True

    def stop(self):
        self.pc.stop()

    def go(self):
        input('Press Enter to Start.')
        while not rospy.is_shutdown():
            grasp_ret = self.get_grasp()



if __name__ == '__main__':
    rospy.init_node('panda_open_loop_grasp')
    pg = OpenLoopGraspController()
    pg.go()
