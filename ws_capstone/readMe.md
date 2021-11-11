OS: Linux Ubuntu 18.04 LTS (Bionic Beaver)

Recommend 30-40GB+ for HD space

Install ROS Melodic: http://wiki.ros.org/ROS/Installation

Clone repository and activate catkin workspace
catkin clean
catkin build

////////////////// Dependencies //////////////////
sudo apt-get install ros-melodic-gazebo-ros ros-melodic-eigen-conversions ros-melodic-object-recognition-msgs ros-melodic-roslint

////////////////// RUN PROJECT//////////////////

Launches the robot model in Gazebo and Rviz
roslaunch moveit_config demo_gazebo.launch

Launches Grasping node
roslaunch ggcnn ggcnn_service.launch

Launches object detection node
roslaunch yolov3_pytorch_ros detector.launch

Launches main program and controller
rosrun mvp_grasping capstone_scheduler.py

*Currently the project uses a simulated sensor in gazebo. To use the real world D435 use the following command:
roslaunch mvp_grasping wrist_realsense.launch

Modifications to the code may be required where the camera topic names are defined.

////////////////// Spawning and deleting objects in Gazebo //////////////////

rosrun mvp_grasping spawn_models.py

rosrun mvp_grasping delete_models.py

rosrun mvp_grasping objects_task1.py

rosrun mvp_grasping objects_task2.py

