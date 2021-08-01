;; Auto-generated. Do not edit!


(when (boundp 'mvp_grasping::AddFailurePoint)
  (if (not (find-package "MVP_GRASPING"))
    (make-package "MVP_GRASPING"))
  (shadow 'AddFailurePoint (find-package "MVP_GRASPING")))
(unless (find-package "MVP_GRASPING::ADDFAILUREPOINT")
  (make-package "MVP_GRASPING::ADDFAILUREPOINT"))
(unless (find-package "MVP_GRASPING::ADDFAILUREPOINTREQUEST")
  (make-package "MVP_GRASPING::ADDFAILUREPOINTREQUEST"))
(unless (find-package "MVP_GRASPING::ADDFAILUREPOINTRESPONSE")
  (make-package "MVP_GRASPING::ADDFAILUREPOINTRESPONSE"))

(in-package "ROS")

(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))




(defclass mvp_grasping::AddFailurePointRequest
  :super ros::object
  :slots (_point ))

(defmethod mvp_grasping::AddFailurePointRequest
  (:init
   (&key
    ((:point __point) (instance geometry_msgs::Point :init))
    )
   (send-super :init)
   (setq _point __point)
   self)
  (:point
   (&rest __point)
   (if (keywordp (car __point))
       (send* _point __point)
     (progn
       (if __point (setq _point (car __point)))
       _point)))
  (:serialization-length
   ()
   (+
    ;; geometry_msgs/Point _point
    (send _point :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; geometry_msgs/Point _point
       (send _point :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; geometry_msgs/Point _point
     (send _point :deserialize buf ptr-) (incf ptr- (send _point :serialization-length))
   ;;
   self)
  )

(defclass mvp_grasping::AddFailurePointResponse
  :super ros::object
  :slots ())

(defmethod mvp_grasping::AddFailurePointResponse
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

(defclass mvp_grasping::AddFailurePoint
  :super ros::object
  :slots ())

(setf (get mvp_grasping::AddFailurePoint :md5sum-) "a7c84ff13976aa04656e56e300124444")
(setf (get mvp_grasping::AddFailurePoint :datatype-) "mvp_grasping/AddFailurePoint")
(setf (get mvp_grasping::AddFailurePoint :request) mvp_grasping::AddFailurePointRequest)
(setf (get mvp_grasping::AddFailurePoint :response) mvp_grasping::AddFailurePointResponse)

(defmethod mvp_grasping::AddFailurePointRequest
  (:response () (instance mvp_grasping::AddFailurePointResponse :init)))

(setf (get mvp_grasping::AddFailurePointRequest :md5sum-) "a7c84ff13976aa04656e56e300124444")
(setf (get mvp_grasping::AddFailurePointRequest :datatype-) "mvp_grasping/AddFailurePointRequest")
(setf (get mvp_grasping::AddFailurePointRequest :definition-)
      "geometry_msgs/Point point

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z
---

")

(setf (get mvp_grasping::AddFailurePointResponse :md5sum-) "a7c84ff13976aa04656e56e300124444")
(setf (get mvp_grasping::AddFailurePointResponse :datatype-) "mvp_grasping/AddFailurePointResponse")
(setf (get mvp_grasping::AddFailurePointResponse :definition-)
      "geometry_msgs/Point point

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z
---

")



(provide :mvp_grasping/AddFailurePoint "a7c84ff13976aa04656e56e300124444")


