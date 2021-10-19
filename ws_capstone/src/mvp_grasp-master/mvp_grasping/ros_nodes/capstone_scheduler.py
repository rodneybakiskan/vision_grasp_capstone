#! /usr/bin/env python2.7

from __future__ import division, print_function
import rospy
from std_msgs.msg import Int16
from geometry_msgs.msg import Twist
import dougsm_helpers.tf_helpers as tfh
from ggcnn.msg import Grasp
from ggcnn.srv import GraspPrediction


import sys
from unicodedata import name
# from moveit_commander import move_group
# from moveit_commander.move_group import MoveGroupCommander
from rosgraph.names import anonymous_name
from rosgraph.xmlrpc import ThreadingXMLRPCServer
import rospy
import moveit_commander
import moveit_msgs.msg
import geometry_msgs
from math import pi
from std_msgs.msg import String
from moveit_commander.conversions import pose_to_list
from tf.transformations import quaternion_from_euler

from gazebo_msgs.srv import SpawnModel, SpawnModelRequest, SpawnModelResponse, DeleteModel
from spawn_models import create_cube_request
from delete_models import delete_object

from yolov3_pytorch_ros.msg import BoundingBoxes, BoundingBox


class OpenLoopGraspController(object):

    def __init__(self):
        # Initialises the OpenLoopGraspController object

        ##
        #  GGCNN stuff

        ggcnn_service_name = '/ggcnn_service'
        rospy.wait_for_service(ggcnn_service_name + '/predict')
        self.ggcnn_srv = rospy.ServiceProxy(
            ggcnn_service_name + '/predict', GraspPrediction)

        self.best_grasp = Grasp()

        ##
        # YOLO

        yolo_service_name = '/detected_objects_in_image'
        self.yolo_srv = rospy.Subscriber(
            yolo_service_name, BoundingBoxes, self.getObjectsFromYOLO)

        self.latest_scanned_objects = []
        self.latest_scene = []
        self.scanning = False
        self.target = geometry_msgs.msg.Pose()
        self.moving = False
        self.targetx = 0
        self.targety = 0
        self.conf = 0.7
        self.targetname=''
        ##
        # Moveit stuff

        self.timeout = 50
        # Defines groups
        moveit_commander.roscpp_initialize(sys.argv)
        #rospy.init_node('Motion_planner', anonymous=True)
        self.robot = moveit_commander.RobotCommander()
        self.scene = moveit_commander.PlanningSceneInterface()
        self.gripper_group = moveit_commander.MoveGroupCommander("gripper2")
        self.arm_group = moveit_commander.MoveGroupCommander("ur5e_arm")

        self.display_trajectory_publisher = rospy.Publisher(
            "/move_group/display_planned_path",
            moveit_msgs.msg.DisplayTrajectory,
            queue_size=20,
        )

        # Gets Basic Information
        # We can get the name of the reference frame for this robot:
        self.gripper_planning_frame = self.gripper_group.get_planning_frame()
        print("============ Gripper planning frame: %s" %
              self.gripper_planning_frame)

        self.arm_planning_frame = self.arm_group.get_planning_frame()
        print("============ Arm planning frame: %s" % self.arm_planning_frame)

        # We can also print the name of the end-effector link for this group:
        self.eef_link = self.arm_group.get_end_effector_link()
        print("============ End effector link: %s" % self.eef_link)

        # We can get a list of all the groups in the robot:
        self.group_names = self.robot.get_group_names()
        print("============ Available Planning Groups:",
              self.robot.get_group_names())

        # Sometimes for debugging it is useful to print the entire state of the
        # robot:
        print("============ Printing robot state")
        print(self.robot.get_current_state())
        print("")

    ##
    #
    # Member functions

    def moveToHome(self):
        self.arm_group.set_named_target("home")
        plan1 = self.arm_group.go()

    # Sets the robot arm to overlook postion

    def moveToOverlook(self):
        self.arm_group.set_named_target("overlook")
        plan1 = self.arm_group.go()

    # Opens gripper

    def OpenGripper(self):
        # pose_goal = gripper_group.get_current_link_values()
        # #should be REV26
        # pose_goal[0]= 0
        # gripper_group.go(pose_goal, wait= True)
        # gripper_group.stop()
        self.gripper_group.set_named_target("open")
        plan1 = self.gripper_group.go()

    def CloseGripper(self):
        self.gripper_group.set_named_target("close")
        plan1 = self.gripper_group.go()

    # Adding Object(box) into the Plannning Scene
    #   box_pose = geometry_msgs.msg.PoseStamped()
    #   box_pose.header.frame_if = "Rev26"
    #  box_pose.pose.orientation.w = 1
    # box_pose.pose.position.z= 0.07
        #box_name = "box"
        # Dimensions needed of item we want to add into planning scene
        #scene.add_box(box_name,box_pose, size=(1,1,1))

    def Attachitem(self):
        grasping_group = 'gripper2'
        touch_links = self.robot.get_link_names(group=grasping_group)
        self.scene.attach_box(self.eef_link, name, touch_links=touch_links)

    def Removeitem(self):
        self.scene.remove_attached_object(
            self.eef_link, name=self.chosenobject())

    def CollisionUpdating(self):
        # Collision Updates
        start = rospy.get_time()
        seconds = rospy.get_time()
        while (seconds - start < self.timeout) and not rospy.is_shutdown():
            # Test if the box is in attached objects
            attached_objects = self.scene.get_attached_objects(
                [self.chosenobject()])
            is_attached = len(attached_objects.keys()) > 0

        # Test if the box is in the scene.
        # Note that attaching the box will remove it from known_objects
            is_known = self.chosenobject() in self.scene.get_known_object_names()

        # Test if we are in the expected state
        if (self.chosenobject_is_attached == is_attached) and (self.chosenobject_is_known == is_known):
            return True
        else:
            return False

    def Rospysleep():
        # Sleep so that we give other threads time on the processor
        rospy.sleep(0.1)
        seconds = rospy.get_time()

    def shutdown():
        # Shuts down the commannder
        rospy.sleep(5)
        moveit_commander.roscpp_shutdown()

    # invoke GGCNN

    def get_grasp(self):
        ret = self.ggcnn_srv.call()
        if not ret.success:
            print("Failed grasp")
            return False

        best_grasp = ret.best_grasp
        self.best_grasp = best_grasp
        rospy.sleep(1)

        # Offset for initial pose.
        EE_offset = 0.10
        Z_offset = 0.20
        tfh.publish_pose_as_transform(
            best_grasp.pose, 'base_link', 'Grasp', 0.5)
        # Add some limits, plus a starting offset.
        # best_grasp.pose.position.z = max(best_grasp.pose.position.z - 0.01, 0.026)  # 0.021 = collision with ground
        best_grasp.pose.position.z += EE_offset + \
            Z_offset  # Offset from end efector position
        print(self.best_grasp.pose)
        return True

    # invoke YOLO
    def getObjectsFromYOLO(self, bb):#change to append current yolo output to [0]----------------------------------------------------------
        if self.scanning:
            length = len(bb.bounding_boxes)
            if (length > 0):
                if length > 1:
                    for i in range(0, length-1):
                        self.latest_scene.append(bb.bounding_boxes[i])
                else:
                    self.latest_scene.append(bb.bounding_boxes)

        if self.moving:
            pass

    def getNames(self):
        names = []
        for object in self.latest_scene:
            if object.Class not in names: 
                names.append(object.Class)
        return names

    def getTargetLoc(self, selection):

    # 1 - Cube
    # 2 - Coke can 
    # 3 - plastic cup 
    # 4 - cricket ball
    # 5 - door handle
    # 6 - wooden peg
    # 7 - hammer
    # 8 - bowl

        if selection == 1:
            self.targetname = "cube\r"
        elif selection ==  2:
            self.targetname = "coke\r"
        elif selection == 3:
            self.targetname = "cup\r"
        elif selection == 4:
            self.targetname = "ball\r"
        elif selection == 5:
            self.targetname = "handle\r"
        elif selection == 6:
            self.targetname = "peg\r"
        elif selection == 7:
            self.targetname = "hammer\r"
        elif selection == 8:
            self.targetname = "bowl\r"
        else:
            self.targetname=False

        if self.targetname:
            highest_prob = 0
            for object in self.latest_scene:
                if (object.Class == self.targetname) & (object.probability > highest_prob):
                    highest_prob = object.probability
                    mid = self.getMidPoint(object)
            return mid
        else:
            return False


    def getMidPoint(self, obj):
        return (obj.xmin + obj.xmax)/2, (obj.ymin + obj.ymax)/2

    def scanObjects(self):
        self.latest_scene = []
        # Move to scan positions 
        self.moveToPosition(-0.3, 0, 0.5, pi/2, 0, 0)
        self.scanning = True
        self.displaceToPosition(0.1, 0, 0)
        self.displaceToPosition(0.1, 0, 0)
        self.displaceToPosition(0.1, 0, 0)
        self.displaceToPosition(0.1, 0, 0)
        self.displaceToPosition(0.1, 0, 0)
        self.displaceToPosition(0.1, 0, 0)
        self.scanning = False
        self.moveToPosition(0, 0, 0.5, pi/2, 0, 0)


    def goToObj(self, midpoint):
        yoffset=0.06
        xoffset=0.03
        x = midpoint[0]
        y = midpoint[1]
        rospy.loginfo(x)
        rospy.loginfo(y)
        self.moveToPosition(x + xoffset, y + yoffset, 0.45, pi/2, 0, 0)   

        # x=1
        # y=1
        # # i=0
        # self.moving = True
        # while abs(x)>0.03 and abs(y)>0.03:
        #     x, y = self.getMidPoint(self.latest_scene[0])
        #     y = y * -1 
        #     # i+=1
        #     print(x,y)
        #     if x > 0:
        #         self.displaceToPosition(-0.005,0,0,False)
                
        #     if x < 0:
        #         self.displaceToPosition(-0.005,0,0,False)
        #     if y > 0:
        #         self.displaceToPosition(0,-0.005,0,False)
        #     if y < 0:
        #         self.displaceToPosition(0,-0.005,0,False)
        # self.moving = False


    def moveToGrasp(self):
        print("moving to grasp pose")
        self.arm_group.set_pose_target(self.best_grasp.pose)
        plan1 = self.arm_group.go()

    def moveToPosition(self, x, y, z, xt, yt, zt, waitArg = True):
        pose_target = geometry_msgs.msg.Pose()
        pose_target.position.x = x
        pose_target.position.y = y
        pose_target.position.z = z

        quaternion = quaternion_from_euler(xt, yt, zt)

        pose_target.orientation.x = quaternion[0]
        pose_target.orientation.y = quaternion[1]
        pose_target.orientation.z = quaternion[2]
        pose_target.orientation.w = quaternion[3]

        # print(pose_target)
        self.arm_group.set_pose_target(pose_target)
        plan1 = self.arm_group.go(wait = waitArg)

    def displaceToPosition(self, x, y, z, waitArg = True):
        waypoints = []
        waypoints.append(self.arm_group.get_current_pose().pose)
        pose_target = geometry_msgs.msg.Pose()
        pose_target.position.x = waypoints[0].position.x + x
        pose_target.position.y = waypoints[0].position.y + y
        pose_target.position.z = waypoints[0].position.z + z
        pose_target.orientation.x = waypoints[0].orientation.x
        pose_target.orientation.y = waypoints[0].orientation.y
        pose_target.orientation.z = waypoints[0].orientation.z
        pose_target.orientation.w = waypoints[0].orientation.w

        # print(pose_target)
        self.arm_group.set_pose_target(pose_target)
        plan1 = self.arm_group.go(wait = waitArg)

    def stop(self):
        self.pc.stop()

    def spawningObject(self):
        spawn_srv = rospy.ServiceProxy('/gazebo/spawn_sdf_model', SpawnModel)
        rospy.loginfo("Waiting for /gazebo/spawn_sdf_model service...")
        spawn_srv.wait_for_service()
        rospy.loginfo("Connected to service!")
        # Spawn object 1
        rospy.loginfo("Spawning cube1")
        req1 = create_cube_request("cube1",
                                   0.0, 0.0, 0.12,  # position
                                   0.0, 0.0, 0.0,  # rotation
                                   0.05, 0.05, 0.05)  # size
        spawn_srv.call(req1)
        rospy.sleep(1.0)

    # main
    def go(self):
        
        raw_input('Press Enter to go to start.')
        self.moveToPosition(-0.3, 0, 0.5, pi/2, 0, 0)
        while not rospy.is_shutdown():
            self.OpenGripper()
            # self.spawningObject()
            raw_input('Press Enter to scan table')

            # scan table for objects from yolo, storing them in a list self.latest_scene
            self.scanObjects()
            print('Objects found:')
            print(self.getNames())
            # print(type(self.latest_scene[0].Class))
            selected_object = int(input('Which object would you like to grasp?\nFrom the easiest to the most difficult\n\t1 - Cube\n\t2 - Coke can \n\t3 - plastic cup \n\t4 - cricket ball\n\t5 - door handle\n\t6 - wooden peg\n\t7 - hammer\n\t8 - bowl\n\t'))
            self.goToObj(self.getTargetLoc(selected_object))

            raw_input('Press Enter to attempt to grasp object')
            self.get_grasp()
            self.moveToGrasp()

            # self.moveToPosition(0,0,0.36,1.57079632679,0,0) #fake grasp

            self.displaceToPosition(0, 0, -0.1)  # lower by 0.1
            self.CloseGripper()
            self.displaceToPosition(0, 0, 0.1)  # raise by 0.1


            print(self.targetname)
            
            if self.targetname == 'cup\r':
                self.moveToPosition(0, 0.5, 0.36, pi/2,
                                    0, 0)  # drop off location
                self.displaceToPosition(0, 0, -0.1)  # lower by 0.1
                self.OpenGripper()
                delete_object("plastic_cup1")
            elif self.targetname == 'coke\r':
                self.moveToPosition(-0.2, 0.5, 0.36, pi/2,
                                    0, 0)  # drop off location
                self.displaceToPosition(0, 0, -0.1)  # lower by 0.1
                self.OpenGripper()
                delete_object("coke_can1")
            else:
                rospy.loginfo("Nothing found!")


            self.displaceToPosition(0, 0, 0.1)  # raise by 0.1

            raw_input('Press Enter to move back to overlook position')


if __name__ == '__main__':
    rospy.init_node('panda_open_loop_grasp')
    pg = OpenLoopGraspController()
    pg.go()
