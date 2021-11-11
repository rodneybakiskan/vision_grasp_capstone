## System

OS: Linux Ubuntu 18.04 LTS (Bionic Beaver)

Recommend 30-40GB+ for HD space

Install ROS Melodic: http://wiki.ros.org/ROS/Installation

Clone repository and activate catkin workspace
catkin clean
catkin build

This directory is the catkin workspace vision_grasop_capstone/ws_captsone/

Install into Python 2.7 env

### Dependencies
sudo apt-get install ros-melodic-gazebo-ros ros-melodic-eigen-conversions ros-melodic-object-recognition-msgs ros-melodic-roslint

## GGCNN - 
by D. Morrison et al. 
https://github.com/dougsm/ggcnn
https://github.com/dougsm/mvp_grasp

Install dependencies from requirements.txt

GGCNN generative grasping and ROS node modified from this research. This code also contains some higher level improvements for grasping implemented in task schedulers and could be worth a look at reintroducing. GGCNN paper - https://arxiv.org/abs/1804.05172
GGCNN improved grasping - https://arxiv.org/abs/1809.08564

GGCNN node output:

geometry_msgs/Pose pose
float32 width
float32 quality

## YOLOv3 - 

ROS nodes for more advanced YOLOs are hard to find for python 2.7 so I used YOLOv3 here. This will need to be retrained for any new objects and could be replaced with a segmentation algorithm or better object detector. Currently the bounding boxes are used to estimate the location of the objects. It uses a crude estimation of the height to do this and should be improved to use the orientation of the camera to accurately translate the bounding box coordinates to the robot base frame. The current translation is found in the function transform() in vision_grasp_capstone\ws_capstone\src\mvp_grasp-master\yolov3_pytorch_ros-master\src\yolov3_pytorch_ros\detector.py. 

YOLO node output:

string Class
float64 probability
float64 xmin
float64 ymin
float64 xmax
float64 ymax

## CAPSTONE SCHEDULER - 

Main program to run the robot. Main go() function is the current program running which currently integrates both the YOLO and GGCNN network callbacks and some basic filtering of the YOLO bounding boxes. The movement of the robot is controlled by the moveit library. 

## RVIZ

Rviz is run to visualise topics and the simulated world. The depth cloud, ros node outputs and grasps can all be visualised in Rviz.

## RUN PROJECT
Launches the robot model in Gazebo and Rviz:
*roslaunch moveit_config demo_gazebo.launch

Launches Grasping node:
*roslaunch ggcnn ggcnn_service.launch

Launches object detection node:
*roslaunch yolov3_pytorch_ros detector.launch

Launches main program and controller:
*rosrun mvp_grasping capstone_scheduler.py

*Currently the project uses a simulated sensor in gazebo. To use the real world D435 use the following command:
*roslaunch mvp_grasping wrist_realsense.launch

Modifications to the code may be required where the camera topic names are defined such as gcnn_service.yaml

### Spawning and deleting objects in Gazebo

rosrun mvp_grasping spawn_models.py

rosrun mvp_grasping delete_models.py

rosrun mvp_grasping objects_task1.py

rosrun mvp_grasping objects_task2.py

### 2021 Contributors:
Liam Jemmeson
Joshua Ten
Rodney Bakiskan
Nuwan Devasurendra
Taha Mohsin Abdul Redha Al Lawati

Further information can be found on github for the respective libraries used regarding installation. There may be some dependencies missing from these lists so please add them here where necessary if you come across anything crucial. Feel free to contact me at ljemmeson@gmail.com to assist with installation, setup or any questions about the project