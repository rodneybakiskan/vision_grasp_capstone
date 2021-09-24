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


class OpenLoopGraspController(object):

    def __init__(self):
        # GGCNN stuff
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

        # Moveit stuff
        self.timeout = 50
        # Defines groups
        moveit_commander.roscpp_initialize(sys.argv)
        #rospy.init_node('Motion_planner', anonymous=True)
        self.robot = moveit_commander.RobotCommander()
        self.scene = moveit_commander.PlanningSceneInterface()
        self.gripper_move_group = moveit_commander.MoveGroupCommander(
            "gripper")
        self.arm_group = moveit_commander.MoveGroupCommander("ur5e_arm")

        self.display_trajectory_publisher = rospy.Publisher(
            "/move_group/display_planned_path",
            moveit_msgs.msg.DisplayTrajectory,
            queue_size=20,
        )

        # Gets Basic Information
        # We can get the name of the reference frame for this robot:
        self.gripper_planning_frame = self.gripper_move_group.get_planning_frame()
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

    # Sets the robot arm to start postion (gripper not included)
    def StartingPoint(self):
        self.arm_group.set_named_target("home")
        plan1 = self.arm_group.go()

    # Grabs location of item of GCNN(needs location)

    def findposition(self):
        Graspinglocation = geometry_msgs.msg
        return Graspinglocation

    # heads to the position given by GCNN

    def Movetopose(self):
        # pose_target = geometry_msgs.msg.Pose()
        # pose_target.position.x = -0.0271481189619
        # pose_target.position.y = -0.0247678443653
        # pose_target.position.z = 0.0164586391632

        # pose_target.orientation.x = 0.996936374366
        # pose_target.orientation.y = 0.078216785069
        # pose_target.orientation.z = 0
        # pose_target.orientation.w = 0
        # self.best_grasp.pose=pose_target
        print(self.best_grasp.pose)
        self.arm_group.set_pose_target(self.best_grasp.pose)
        plan1 = self.arm_group.go()

    # Opens grippper(Writing Directly to the REV26)

    def OpenGripper(self):
        # pose_goal = gripper_move_group.get_current_link_values()
        # #should be REV26
        # pose_goal[0]= 0
        # gripper_move_group.go(pose_goal, wait= True)
        # gripper_move_group.stop()
        self.gripper_move_group.set_named_target("open")
        plan1 = self.gripper_move_group.go()

    def CloseGripper(self):
        self.gripper_move_group.set_named_target("close")
        plan1 = self.gripper_move_group.go()

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
        initial_offset = 0.10
        LINK_EE_OFFSET = 0.138

        # Add some limits, plus a starting offset.
    #        best_grasp.pose.position.z = max(best_grasp.pose.posit
    # ion.z - 0.01, 0.026)  # 0.021 = collision with ground
        best_grasp.pose.position.z += initial_offset + LINK_EE_OFFSET  # Offset from end efector position to
        self.Movetopose()
        tfh.publish_pose_as_transform(best_grasp.pose, 'base_link', 'G', 2)
        raw_input('Care to grasp again?')
    #        self.pc.set_gripper(best_grasp.width, wait=False)
    #        rospy.sleep(0.1)
    #        self.pc.goto_pose(best_grasp.pose, velocity=0.1)

        # Reset the position
    #        best_grasp.pose.position.z -= initial_offset + LINK_EE_OFFSET

        return True

    def stop(self):
        self.pc.stop()

    def go(self):
        # self.StartingPoint()
        raw_input('Press Enter to Start.')
        while not rospy.is_shutdown():
            self.get_grasp()


if __name__ == '__main__':
    rospy.init_node('panda_open_loop_grasp')
    pg = OpenLoopGraspController()
    pg.go()
