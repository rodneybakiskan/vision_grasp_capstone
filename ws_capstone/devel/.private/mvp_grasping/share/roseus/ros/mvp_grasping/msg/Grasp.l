;; Auto-generated. Do not edit!


(when (boundp 'mvp_grasping::Grasp)
  (if (not (find-package "MVP_GRASPING"))
    (make-package "MVP_GRASPING"))
  (shadow 'Grasp (find-package "MVP_GRASPING")))
(unless (find-package "MVP_GRASPING::GRASP")
  (make-package "MVP_GRASPING::GRASP"))

(in-package "ROS")
;;//! \htmlinclude Grasp.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass mvp_grasping::Grasp
  :super ros::object
  :slots (_pose _quality _entropy _width ))

(defmethod mvp_grasping::Grasp
  (:init
   (&key
    ((:pose __pose) (instance geometry_msgs::Pose :init))
    ((:quality __quality) 0.0)
    ((:entropy __entropy) 0.0)
    ((:width __width) 0.0)
    )
   (send-super :init)
   (setq _pose __pose)
   (setq _quality (float __quality))
   (setq _entropy (float __entropy))
   (setq _width (float __width))
   self)
  (:pose
   (&rest __pose)
   (if (keywordp (car __pose))
       (send* _pose __pose)
     (progn
       (if __pose (setq _pose (car __pose)))
       _pose)))
  (:quality
   (&optional __quality)
   (if __quality (setq _quality __quality)) _quality)
  (:entropy
   (&optional __entropy)
   (if __entropy (setq _entropy __entropy)) _entropy)
  (:width
   (&optional __width)
   (if __width (setq _width __width)) _width)
  (:serialization-length
   ()
   (+
    ;; geometry_msgs/Pose _pose
    (send _pose :serialization-length)
    ;; float32 _quality
    4
    ;; float32 _entropy
    4
    ;; float32 _width
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; geometry_msgs/Pose _pose
       (send _pose :serialize s)
     ;; float32 _quality
       (sys::poke _quality (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _entropy
       (sys::poke _entropy (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _width
       (sys::poke _width (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; geometry_msgs/Pose _pose
     (send _pose :deserialize buf ptr-) (incf ptr- (send _pose :serialization-length))
   ;; float32 _quality
     (setq _quality (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _entropy
     (setq _entropy (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _width
     (setq _width (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get mvp_grasping::Grasp :md5sum-) "90c9438303b271d3a45352442c7a7579")
(setf (get mvp_grasping::Grasp :datatype-) "mvp_grasping/Grasp")
(setf (get mvp_grasping::Grasp :definition-)
      "geometry_msgs/Pose pose
float32 quality
float32 entropy
float32 width

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



(provide :mvp_grasping/Grasp "90c9438303b271d3a45352442c7a7579")


