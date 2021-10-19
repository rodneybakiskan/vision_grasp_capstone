#!/usr/bin/env python2.7

import rospy
from gazebo_msgs.srv import DeleteModel
from tf.transformations import quaternion_from_euler


def delete_all_Objects():
        delete_model = rospy.ServiceProxy('/gazebo/delete_model', DeleteModel)
        resp_delete = delete_model("cube1")
        resp_delete = delete_model("bowl1")
        # resp_delete = delete_model("hammer1")
        resp_delete = delete_model("coke_can1")
        resp_delete = delete_model("cricket_ball1")
        resp_delete = delete_model("door_handle1")
        # resp_delete = delete_model("plastic_cup1")
        # resp_delete = delete_model("wooden_peg1")

def delete_object(object1):
        delete_model = rospy.ServiceProxy('/gazebo/delete_model', DeleteModel)
        delete_model(object1)



if __name__ == '__main__':
  rospy.loginfo("Deleting cube1")
  delete_all_Objects()
