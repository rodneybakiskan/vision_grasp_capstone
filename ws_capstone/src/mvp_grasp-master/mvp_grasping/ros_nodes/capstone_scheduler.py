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

from gazebo_msgs.srv import SpawnModel, SpawnModelRequest, SpawnModelResponse, DeleteModel
from spawn_models import create_cube_request

class OpenLoopGraspController(object):

    def __init__(self):
        ##
        # 
        #  GGCNN stuff


        ggcnn_service_name = '/ggcnn_service'
        rospy.wait_for_service(ggcnn_service_name + '/predict')
        self.ggcnn_srv = rospy.ServiceProxy(
            ggcnn_service_name + '/predict', GraspPrediction)

        self.best_grasp = Grasp()

        ##
        # 
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

    # Grabs location of item of GGCNN(needs location)

    def findposition(self):
        Graspinglocation = geometry_msgs.msg
        return Graspinglocation

    def moveToPose(self):
        pose_target = geometry_msgs.msg.Pose()
        pose_target.position.x = -0.0271481189619
        pose_target.position.y = -0.0247678443653
        pose_target.position.z = 0.0164586391632

        pose_target.orientation.x = 0.996936374366
        pose_target.orientation.y = 0.078216785069
        pose_target.orientation.z = 0
        pose_target.orientation.w = 0

        print(pose_target)
        self.arm_group.set_pose_target(pose_target)

        plan1 = self.arm_group.go()

    def lowerGripper(self):
        self.best_grasp.pose.position.z -= 0.1
        self.moveToGrasp()

    def raiseGripper(self):
        self.best_grasp.pose.position.z += 0.1
        self.moveToGrasp()

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

    # Determines which object is in the gripper

    def chosenobject():
        selectedname = geometry_msgs.msg.PoseStamped()
        return selectedname

    # Adding Object(box) into the Plannning Scene
    #   box_pose = geometry_msgs.msg.PoseStamped()
    #   box_pose.header.frame_if = "Rev26"
    #  box_pose.pose.orientation.w = 1
    # box_pose.pose.position.z= 0.07
        #box_name = "box"
        # Dimensions needed of item we want to add into planning scene
        #scene.add_box(box_name,box_pose, size=(1,1,1))

    def Attachitem(self):
        grasping_group = 'gripper'
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
        Z_offset = 0.2
        tfh.publish_pose_as_transform(best_grasp.pose, 'base_link', 'Grasp', 0.5)
        # Add some limits, plus a starting offset.
        # best_grasp.pose.position.z = max(best_grasp.pose.position.z - 0.01, 0.026)  # 0.021 = collision with ground
        best_grasp.pose.position.z += EE_offset + \
            Z_offset  # Offset from end efector position to
        print(self.best_grasp.pose)
        return True

    # heads to the position given by GGCNN

    def moveToGrasp(self):

        print("moving to grasp pose")
        self.arm_group.set_pose_target(self.best_grasp.pose)

        plan1 = self.arm_group.go()

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
    def deleteObject(self):
        delete_model = rospy.ServiceProxy('/gazebo/delete_model', DeleteModel)
        resp_delete = delete_model("cube1")

    #main
    def go(self):
        # self.moveToHome()
        raw_input('Press Enter to Start.')
        while not rospy.is_shutdown():
            self.deleteObject()
            self.OpenGripper()
            self.moveToOverlook()
            
            self.spawningObject()

            raw_input('Press Enter to attempt to grasp object')
            self.get_grasp()
            self.moveToGrasp()
            self.lowerGripper()
            self.CloseGripper()
            self.raiseGripper()
            raw_input('Press Enter to move back to overlook position')
    


if __name__ == '__main__':
    rospy.init_node('panda_open_loop_grasp')
    pg = OpenLoopGraspController()
    pg.go()
