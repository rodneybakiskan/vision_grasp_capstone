#!/usr/bin/env python

import rospy
from gazebo_msgs.srv import DeleteModel
from tf.transformations import quaternion_from_euler


def deleteObject():
        delete_model = rospy.ServiceProxy('/gazebo/delete_model', DeleteModel)
        resp_delete = delete_model("cube1")
        resp_delete = delete_model("bowl1")

if __name__ == '__main__':
  rospy.loginfo("Deleting cube1")
  deleteObject()