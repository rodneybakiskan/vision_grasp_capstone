;; Auto-generated. Do not edit!


(when (boundp 'ggcnn::Grasp)
  (if (not (find-package "GGCNN"))
    (make-package "GGCNN"))
  (shadow 'Grasp (find-package "GGCNN")))
(unless (find-package "GGCNN::GRASP")
  (make-package "GGCNN::GRASP"))

(in-package "ROS")
;;//! \htmlinclude Grasp.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass ggcnn::Grasp
  :super ros::object
  :slots (_pose _width _quality ))

(defmethod ggcnn::Grasp
  (:init
   (&key
    ((:pose __pose) (instance geometry_msgs::Pose :init))
    ((:width __width) 0.0)
    ((:quality __quality) 0.0)
    )
   (send-super :init)
   (setq _pose __pose)
   (setq _width (float __width))
   (setq _quality (float __quality))
   self)
  (:pose
   (&rest __pose)
   (if (keywordp (car __pose))
       (send* _pose __pose)
     (progn
       (if __pose (setq _pose (car __pose)))
       _pose)))
  (:width
   (&optional __width)
   (if __width (setq _width __width)) _width)
  (:quality
   (&optional __quality)
   (if __quality (setq _quality __quality)) _quality)
  (:serialization-length
   ()
   (+
    ;; geometry_msgs/Pose _pose
    (send _pose :serialization-length)
    ;; float32 _width
    4
    ;; float32 _quality
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; geometry_msgs/Pose _pose
       (send _pose :serialize s)
     ;; float32 _width
       (sys::poke _width (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _quality
       (sys::poke _quality (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; geometry_msgs/Pose _pose
     (send _pose :deserialize buf ptr-) (incf ptr- (send _pose :serialization-length))
   ;; float32 _width
     (setq _width (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _quality
     (setq _quality (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get ggcnn::Grasp :md5sum-) "ffb74d75fb92764666a6fb85638db3e0")
(setf (get ggcnn::Grasp :datatype-) "ggcnn/Grasp")
(setf (get ggcnn::Grasp :definition-)
      "geometry_msgs/Pose pose
float32 width
float32 quality
================================================================================
MSG: geometry_msgs/Pose
# A representation of pose in free space, composed of position and orientation. 
Point position
Quaternion orientation

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w

")



(provide :ggcnn/Grasp "ffb74d75fb92764666a6fb85638db3e0")


