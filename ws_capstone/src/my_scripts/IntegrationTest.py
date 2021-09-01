#!/usr/bin/env python
import sys
from unicodedata import name
from moveit_commander import move_group
from moveit_commander.move_group import MoveGroupCommander
from rosgraph.names import anonymous_name
from rosgraph.xmlrpc import ThreadingXMLRPCServer
import rospy
import moveit_commander
import moveit_msgs.msg
import geometry_msgs.msg
from math import pi
from std_msgs.msg import String
from moveit_commander.conversions import pose_to_list
from std_msgs.msg import Int16
from geometry_msgs.msg import Twist


timeout =3

#Defines groups
moveit_commander.roscpp_initialize(sys.argv)
rospy.init_node('move_group', anonymous = True)
robot =moveit_commander.RobotCommander()
scene =moveit_commander.PlanningSceneInterface()
gripper_move_group = moveit_commander.MoveGroupCommander("gripper")
arm_group = moveit_commander.MoveGroupCommander("ur5e_arm")


#Gets Basic Information
# We can get the name of the reference frame for this robot:
planning_frame = move_group.get_planning_frame()
print ("============ Planning frame: %s" % planning_frame)

# We can also print the name of the end-effector link for this group:
eef_link = move_group.get_end_effector_link()
print ("============ End effector link: %s" % eef_link)

# We can get a list of all the groups in the robot:
group_names = robot.get_group_names()
print ("============ Available Planning Groups:", robot.get_group_names())

# Sometimes for debugging it is useful to print the entire state of the
# robot:
print ("============ Printing robot state")
print (robot.get_current_state())
print ("")

#Stores the location
class Graspinglocation:
    #needs statments to store the positions

#Sets the robot arm to start postion (gripper not included)

def StartingPoint(self):
    arm_group.set_named_target("home")
    plan1 = arm_group.go()

#Grabs location of item of GCNN(needs location)
def findposition(self):
    Graspinglocation = geometry_msgs.msg
    return  Graspinglocation

#heads to the position given by GCNN



#Opens grippper(Writing Directly to the REV26)
def OpenGripper():
    pose_goal = gripper_move_group.get_current_link_values()
    #should be REV26
    pose_goal[0]= 0
    gripper_move_group.go(pose_goal, wait= True)
    gripper_move_group.stop()

#Determines which object is in the gripper
def chosenobject(self):
    selectedname = geometry_msgs.msg.PoseStamped()
    return selectedname

#Adding Object(box) into the Plannning Scene
#   box_pose = geometry_msgs.msg.PoseStamped()
 #   box_pose.header.frame_if = "Rev26"
  #  box_pose.pose.orientation.w = 1
   # box_pose.pose.position.z= 0.07
    #box_name = "box"
    #Dimensions needed of item we want to add into planning scene
    #scene.add_box(box_name,box_pose, size=(1,1,1))

def Attachitem(self):
    grasping_group = 'gripper'
    touch_links = robot.get_link_names(group=grasping_group)
    scene.attach_box(eef_link, name, touch_links=touch_links)
   
def Removeitem(self):
    scene.remove_attached_object(eef_link, name= chosenobject())


def CollisionUpdating():
        #Collision Updates
    start = rospy.get_time()
    seconds = rospy.get_time()
    while (seconds - start < timeout) and not rospy.is_shutdown():
    # Test if the box is in attached objects
        attached_objects = scene.get_attached_objects([chosenobject()])
        is_attached = len(attached_objects.keys()) > 0

    # Test if the box is in the scene.
    # Note that attaching the box will remove it from known_objects
        is_known = chosenobject() in scene.get_known_object_names()

    # Test if we are in the expected state
    if (chosenobject_is_attached == is_attached) and (chosenobject_is_known == is_known):
        return True
    else return False



def Rospysleep ():
  # Sleep so that we give other threads time on the processor
    rospy.sleep(0.1)
    seconds = rospy.get_time()


def shutdown():
    #Shuts down the commannder
    rospy.sleep(5)
    moveit_commander.roscpp_shutdown()