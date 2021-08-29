;; Auto-generated. Do not edit!


(when (boundp 'mvp_grasping::NextViewpoint)
  (if (not (find-package "MVP_GRASPING"))
    (make-package "MVP_GRASPING"))
  (shadow 'NextViewpoint (find-package "MVP_GRASPING")))
(unless (find-package "MVP_GRASPING::NEXTVIEWPOINT")
  (make-package "MVP_GRASPING::NEXTVIEWPOINT"))
(unless (find-package "MVP_GRASPING::NEXTVIEWPOINTREQUEST")
  (make-package "MVP_GRASPING::NEXTVIEWPOINTREQUEST"))
(unless (find-package "MVP_GRASPING::NEXTVIEWPOINTRESPONSE")
  (make-package "MVP_GRASPING::NEXTVIEWPOINTRESPONSE"))

(in-package "ROS")



(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass mvp_grasping::NextViewpointRequest
  :super ros::object
  :slots ())

(defmethod mvp_grasping::NextViewpointRequest
  (:init
   (&key
    )
   (send-super :init)
   self)
  (:serialization-length
   ()
   (+
    0
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;;
   self)
  )

(defclass mvp_grasping::NextViewpointResponse
  :super ros::object
  :slots (_success _velocity_cmd _best_grasp _no_viewpoints ))

(defmethod mvp_grasping::NextViewpointResponse
  (:init
   (&key
    ((:success __success) nil)
    ((:velocity_cmd __velocity_cmd) (instance geometry_msgs::Twist :init))
    ((:best_grasp __best_grasp) (instance mvp_grasping::Grasp :init))
    ((:no_viewpoints __no_viewpoints) 0)
    )
   (send-super :init)
   (setq _success __success)
   (setq _velocity_cmd __velocity_cmd)
   (setq _best_grasp __best_grasp)
   (setq _no_viewpoints (round __no_viewpoints))
   self)
  (:success
   (&optional __success)
   (if __success (setq _success __success)) _success)
  (:velocity_cmd
   (&rest __velocity_cmd)
   (if (keywordp (car __velocity_cmd))
       (send* _velocity_cmd __velocity_cmd)
     (progn
       (if __velocity_cmd (setq _velocity_cmd (car __velocity_cmd)))
       _velocity_cmd)))
  (:best_grasp
   (&rest __best_grasp)
   (if (keywordp (car __best_grasp))
       (send* _best_grasp __best_grasp)
     (progn
       (if __best_grasp (setq _best_grasp (car __best_grasp)))
       _best_grasp)))
  (:no_viewpoints
   (&optional __no_viewpoints)
   (if __no_viewpoints (setq _no_viewpoints __no_viewpoints)) _no_viewpoints)
  (:serialization-length
   ()
   (+
    ;; bool _success
    1
    ;; geometry_msgs/Twist _velocity_cmd
    (send _velocity_cmd :serialization-length)
    ;; mvp_grasping/Grasp _best_grasp
    (send _best_grasp :serialization-length)
    ;; uint32 _no_viewpoints
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _success
       (if _success (write-byte -1 s) (write-byte 0 s))
     ;; geometry_msgs/Twist _velocity_cmd
       (send _velocity_cmd :serialize s)
     ;; mvp_grasping/Grasp _best_grasp
       (send _best_grasp :serialize s)
     ;; uint32 _no_viewpoints
       (write-long _no_viewpoints s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _success
     (setq _success (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; geometry_msgs/Twist _velocity_cmd
     (send _velocity_cmd :deserialize buf ptr-) (incf ptr- (send _velocity_cmd :serialization-length))
   ;; mvp_grasping/Grasp _best_grasp
     (send _best_grasp :deserialize buf ptr-) (incf ptr- (send _best_grasp :serialization-length))
   ;; uint32 _no_viewpoints
     (setq _no_viewpoints (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass mvp_grasping::NextViewpoint
  :super ros::object
  :slots ())

(setf (get mvp_grasping::NextViewpoint :md5sum-) "b48658ae3de44f598cf8af1346003291")
(setf (get mvp_grasping::NextViewpoint :datatype-) "mvp_grasping/NextViewpoint")
(setf (get mvp_grasping::NextViewpoint :request) mvp_grasping::NextViewpointRequest)
(setf (get mvp_grasping::NextViewpoint :response) mvp_grasping::NextViewpointResponse)

(defmethod mvp_grasping::NextViewpointRequest
  (:response () (instance mvp_grasping::NextViewpointResponse :init)))

(setf (get mvp_grasping::NextViewpointRequest :md5sum-) "b48658ae3de44f598cf8af1346003291")
(setf (get mvp_grasping::NextViewpointRequest :datatype-) "mvp_grasping/NextViewpointRequest")
(setf (get mvp_grasping::NextViewpointRequest :definition-)
      "---
bool success
geometry_msgs/Twist velocity_cmd
mvp_grasping/Grasp best_grasp
uint32 no_viewpoints


================================================================================
MSG: geometry_msgs/Twist
# This expresses velocity in free space broken into its linear and angular parts.
Vector3  linear
Vector3  angular

================================================================================
MSG: geometry_msgs/Vector3
# This represents a vector in free space. 
# It is only meant to represent a direction. Therefore, it does not
# make sense to apply a translation to it (e.g., when applying a 
# generic rigid transformation to a Vector3, tf2 will only apply the
# rotation). If you want your data to be translatable too, use the
# geometry_msgs/Point message instead.

float64 x
float64 y
float64 z
================================================================================
MSG: mvp_grasping/Grasp
geometry_msgs/Pose pose
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

(setf (get mvp_grasping::NextViewpointResponse :md5sum-) "b48658ae3de44f598cf8af1346003291")
(setf (get mvp_grasping::NextViewpointResponse :datatype-) "mvp_grasping/NextViewpointResponse")
(setf (get mvp_grasping::NextViewpointResponse :definition-)
      "---
bool success
geometry_msgs/Twist velocity_cmd
mvp_grasping/Grasp best_grasp
uint32 no_viewpoints


================================================================================
MSG: geometry_msgs/Twist
# This expresses velocity in free space broken into its linear and angular parts.
Vector3  linear
Vector3  angular

================================================================================
MSG: geometry_msgs/Vector3
# This represents a vector in free space. 
# It is only meant to represent a direction. Therefore, it does not
# make sense to apply a translation to it (e.g., when applying a 
# generic rigid transformation to a Vector3, tf2 will only apply the
# rotation). If you want your data to be translatable too, use the
# geometry_msgs/Point message instead.

float64 x
float64 y
float64 z
================================================================================
MSG: mvp_grasping/Grasp
geometry_msgs/Pose pose
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



(provide :mvp_grasping/NextViewpoint "b48658ae3de44f598cf8af1346003291")


