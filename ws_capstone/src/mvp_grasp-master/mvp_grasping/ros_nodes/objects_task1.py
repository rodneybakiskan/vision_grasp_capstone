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

try:
    selected_object= int(input('Which object would you like to spawn?(int)\nFrom the easiest to the most difficult\n\t1 - Cube\n\t2 - Coke can \n\t3 - plastic cup \n\t4 - cricket ball\n\t5 - door handle\n\t6 - wooden peg\n\t7 - hammer\n\t8 - bowl\n\t'))
    if selected_object == 1:
        rospy.loginfo("Spawning cube1")
        req1 = create_cube_request("cube1",
                    0.0, 0.0, 0.12,  # position
                    0.0, 0.0, 0.0,  # rotation
                    0.05, 0.05, 0.05)  # size
        spawn_srv.call(req1)
        rospy.sleep(1.0)
    elif selected_object == 2:
        rospy.loginfo("Spawning coke_can1")
        req1 = create_coke_can_request("coke_can1",
                    0.0, 0.0, 0.05,  # position
                    0.0, 0.0, 0.0,  # rotation
                    0.8, 0.8, 0.8)  # size
        spawn_srv.call(req1)
        rospy.sleep(1.0)
    elif selected_object == 3:
        rospy.loginfo("Spawning plastic_cup1")
        req2 = create_plastic_cup_request("plastic_cup1",
                                    0, 0, 0.05,  # position
                                    0.0, 0.0, 0.0,  # rotation
                                    0.8, 0.8, 0.8)  # size
        spawn_srv.call(req2)
        rospy.sleep(1.0)
    elif selected_object == 4:
        rospy.loginfo("Spawning Cricket ball")
        req2 = create_cricket_ball_request("cricket_ball1",
                                    0, 0, 0.05,  # position
                                    0.0, 0.0, 0.0,  # rotation
                                    0.8, 0.8, 0.8)  # size
        spawn_srv.call(req2)
        rospy.sleep(1.0)
    elif selected_object == 5:
        rospy.loginfo("Spawning door_handle1")
        req2 = create_door_handle_request("door_handle1",
                                    0, 0, 0.05,  # position
                                    0.0, 0.0, 0.0,  # rotation
                                    0.8, 0.8, 0.8)  # size
        spawn_srv.call(req2)
        rospy.sleep(1.0)
    elif selected_object == 6:
        rospy.loginfo("Spawning wooden_peg1")
        req2 = create_wooden_peg_request("wooden_peg1",
                                    0, 0, 0.05,  # position
                                    0.0, 0.0, 0.0,  # rotation
                                    0.8, 0.8, 0.8)  # size
        spawn_srv.call(req2)
        rospy.sleep(1.0)
    elif selected_object == 7:
        rospy.loginfo("Spawning hammer")
        req2 = create_hammer_request("hammer1",
                                    0, 0, 0.05,  # position
                                    0.0, 0.0, 0.0,  # rotation
                                    0.8, 0.8, 0.8)  # size
        spawn_srv.call(req2)
        rospy.sleep(1.0)
    elif selected_object == 8:
        rospy.loginfo("Spawning bowl1")
        req2 = create_bowl_request("bowl1",
                                    0, 0, 0.05,  # position
                                    0.0, 0.0, 0.0,  # rotation
                                    0.8, 0.8, 0.8)  # size
        spawn_srv.call(req2)
        rospy.sleep(1.0)
    else:
        rospy.loginfo("the selected option is out of range")
except:
    rospy.loginfo("invlid input!")



