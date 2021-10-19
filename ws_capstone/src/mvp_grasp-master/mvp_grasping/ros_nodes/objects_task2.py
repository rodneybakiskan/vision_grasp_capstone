#!/usr/bin/env python2.7

import rospy
from gazebo_msgs.srv import SpawnModel, SpawnModelRequest, SpawnModelResponse
from copy import deepcopy
from tf.transformations import quaternion_from_euler

import random
from spawn_models import create_coke_can_request, create_cube_request, create_plastic_cup_request, create_cricket_ball_request, create_wooden_peg_request, create_bowl_request, create_hammer_request, create_door_handle_request

rospy.init_node('spawn_models')
spawn_srv = rospy.ServiceProxy('/gazebo/spawn_sdf_model', SpawnModel)
rospy.loginfo("Waiting for /gazebo/spawn_sdf_model service...")
spawn_srv.wait_for_service()
rospy.loginfo("Connected to service!")

x_min = -0.35
x_max = 0.5

y_min = -0.32
y_max = 0.1
x1= random.uniform(x_min,x_max)
y1= random.uniform(y_min,y_max)

x2= random.uniform(x_min,x_max)
y2= random.uniform(y_min,y_max)

if abs(x1-x2) and abs(y1-y2) <0.05:
    condition_met=0
    while not condition_met:
        rospy.loginfo('position of 2 is changed')
        x2= random.uniform(x_min,x_max)
        y2= random.uniform(y_min,y_max)
        if abs(x1-x2) and abs(y1-y2) >0.05:
            condition_met = 1

x3= random.uniform(x_min,x_max)
y3= random.uniform(y_min,y_max)

if (abs(x3-x2) and abs(y3-y2) <0.05) or (abs(x1-x3) and abs(y1-y3) <0.05):
    condition_met =0
    while not condition_met:
        rospy.loginfo('position of 3 is changed')
        x3= random.uniform(x_min,x_max)
        y3= random.uniform(y_min,y_max)
        if (abs(x3-x2) and abs(y3-y2) >0.05) or (abs(x1-x3) and abs(y1-y3) >0.05):
            condition_met = 1

x4= random.uniform(x_min,x_max)
y4= random.uniform(y_min,y_max)

if (abs(x4-x2) and abs(y4-y2) <0.05) or (abs(x1-x4) and abs(y1-y4) <0.05) or (abs(x4-x3) and abs(y4-y3) <0.05):
    condition_met = 0
    counter = 0
    while not condition_met:
        rospy.loginfo('position of 4 is changed')
        x4= random.uniform(x_min,x_max)
        y4= random.uniform(y_min,y_max)
        counter+=1
        if not((abs(x4-x2) and abs(y4-y2) <0.05) or (abs(x1-x4) and abs(y1-y4) <0.05) or (abs(x4-x3) and abs(y4-y3) <0.05)):
            condition_met = 1
        if counter > 7:
            condition_met = 1


x5= random.uniform(x_min,x_max)
y5= random.uniform(y_min,y_max)

if (abs(x5-x1) and abs(y5-y1) <0.1) or (abs(x5-x2) and abs(y5-y2) <0.1) or (abs(x5-x3) and abs(y5-y3) <0.1)or (abs(x5-x4) and abs(y5-y4) <0.1):
    condition_met = 0
    counter = 0
    while not condition_met:
        rospy.loginfo('position of 5 is changed')
        x5= random.uniform(x_min,x_max)
        y5= random.uniform(y_min,y_max)
        counter+=1
        if not((abs(x5-x1) and abs(y5-y1) <0.1) or (abs(x5-x2) and abs(y5-y2) <0.1) or (abs(x5-x3) and abs(y5-y3) <0.1)or (abs(x5-x4) and abs(y5-y4) <0.1)):
            condition_met = 1
        if counter > 7:
            condition_met = 1


# x6= random.uniform(x_min,x_max)
# y6= random.uniform(y_min,y_max)

# if (abs(x6-x1) and abs(y6-y1) <0.1) or (abs(x6-x2) and abs(y6-y2) <0.1) or (abs(x6-x3) and abs(y6-y3) <0.1) or (abs(x6-x4) and abs(y6-y4) <0.1)or (abs(x6-x5) and abs(y6-y5) <0.1):
#     rospy.loginfo('position of 6 is changed')
#     x6= random.uniform(x_min,x_max)
#     y6= random.uniform(y_min,y_max)

# x7= random.uniform(x_min,x_max)
# y7= random.uniform(y_min,y_max)

# if (abs(x7-x1) and abs(y7-y1) <0.1) or (abs(x7-x2) and abs(y7-y2) <0.1) or (abs(x7-x3) and abs(y7-y3) <0.1) or (abs(x7-x4) and abs(y7-y4) <0.1) or (abs(x7-x5) and abs(y7-y5) <0.1) or (abs(x7-x6) and abs(y7-y6) <0.1):
#     rospy.loginfo('position of 7 is changed')
#     x7= random.uniform(x_min,x_max)
#     y7= random.uniform(y_min,y_max)

# x8= random.uniform(x_min,x_max)
# y8= random.uniform(y_min,y_max)

# if (abs(x8-x1) and abs(y8-y1) <0.1) or (abs(x8-x2) and abs(y8-y2) <0.1) or (abs(x8-x3) and abs(y8-y3) <0.1) or (abs(x8-x4) and abs(y8-y4) <0.1) or (abs(x8-x5) and abs(y8-y5) <0.1) or (abs(x8-x6) and abs(y8-y6) <0.1) or (abs(x8-x7) and abs(y8-y7) <0.1):
#     rospy.loginfo('position of 8 is changed')
#     x8= random.uniform(x_min,x_max)
#     y8= random.uniform(y_min,y_max)


    
rospy.loginfo("Spawning Cube")
rospy.loginfo(x1)
rospy.loginfo(y1)
req1 = create_cube_request("cube1",
                            x1, y1, 0.05,  # position
                            0.0, 0.0, 0.0,  # rotation
                            0.057, 0.057, 0.057)  # size
spawn_srv.call(req1)
# rospy.sleep(1.0)


# Spawn Coke can

rospy.loginfo("Spawning Coke Can")
req2 = create_coke_can_request("coke_can1",
                            x2, y2, 0.05,  # position
                            0.0, 0.0, 0.0,  # rotation
                            0.8, 0.8, 0.8)  # size
spawn_srv.call(req2)
# rospy.sleep(1.0)

# Spawn Cricket ball

rospy.loginfo("Spawning Cricket ball")
req2 = create_cricket_ball_request("cricket_ball1",
                            x3, y3, 0.05,  # position
                            0.0, 0.0, 0.0,  # rotation
                            0.8, 0.8, 0.8)  # size
spawn_srv.call(req2)
# rospy.sleep(1.0)

# Spawn Door handle

rospy.loginfo("Spawning Door handle")
req2 = create_door_handle_request("door_handle1",
                            x4, y4, 0.05,  # position
                            0.0, 0.0, 0.0,  # rotation
                            0.8, 0.8, 0.8)  # size
spawn_srv.call(req2)
# rospy.sleep(1.0)

# Spawn Bowl

rospy.loginfo("Spawning Bowl")
req2 = create_bowl_request("bowl1",
                            x5, y5, 0.05,  # position
                            0.0, 0.0, 0.0,  # rotation
                            0.8, 0.8, 0.8)  # size
spawn_srv.call(req2)
# rospy.sleep(1.0)

# # Spawn Hammer

# rospy.loginfo("Spawning Hammer")
# req2 = create_hammer_request("hammer1",
#                             x6, y6, 0.05,  # position
#                             0.0, 0.0, 0.0,  # rotation
#                             0.8, 0.8, 0.8)  # size
# spawn_srv.call(req2)
# rospy.sleep(1.0)

# # Spawn Wooden peg

# rospy.loginfo("Spawning Wooden peg")
# req2 = create_wooden_peg_request("wooden_peg1",
#                             x7, y7, 0.05,  # position
#                             0.0, 0.0, 0.0,  # rotation
#                             0.8, 0.8, 0.8)  # size
# spawn_srv.call(req2)
# rospy.sleep(1.0)

# # # Plastic cup

# rospy.loginfo("Spawning Plastic cup")
# req2 = create_plastic_cup_request("plastic_cup1",
#                             x8, y8, 0.05,  # position
#                             0.0, 0.0, 0.0,  # rotation
#                             0.8, 0.8, 0.8)  # size
# spawn_srv.call(req2)
# rospy.sleep(1.0)

    

