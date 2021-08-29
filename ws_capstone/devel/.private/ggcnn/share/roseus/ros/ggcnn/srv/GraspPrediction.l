;; Auto-generated. Do not edit!


(when (boundp 'ggcnn::GraspPrediction)
  (if (not (find-package "GGCNN"))
    (make-package "GGCNN"))
  (shadow 'GraspPrediction (find-package "GGCNN")))
(unless (find-package "GGCNN::GRASPPREDICTION")
  (make-package "GGCNN::GRASPPREDICTION"))
(unless (find-package "GGCNN::GRASPPREDICTIONREQUEST")
  (make-package "GGCNN::GRASPPREDICTIONREQUEST"))
(unless (find-package "GGCNN::GRASPPREDICTIONRESPONSE")
  (make-package "GGCNN::GRASPPREDICTIONRESPONSE"))

(in-package "ROS")





(defclass ggcnn::GraspPredictionRequest
  :super ros::object
  :slots ())

(defmethod ggcnn::GraspPredictionRequest
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

(defclass ggcnn::GraspPredictionResponse
  :super ros::object
  :slots (_success _best_grasp ))

(defmethod ggcnn::GraspPredictionResponse
  (:init
   (&key
    ((:success __success) nil)
    ((:best_grasp __best_grasp) (instance ggcnn::Grasp :init))
    )
   (send-super :init)
   (setq _success __success)
   (setq _best_grasp __best_grasp)
   self)
  (:success
   (&optional __success)
   (if __success (setq _success __success)) _success)
  (:best_grasp
   (&rest __best_grasp)
   (if (keywordp (car __best_grasp))
       (send* _best_grasp __best_grasp)
     (progn
       (if __best_grasp (setq _best_grasp (car __best_grasp)))
       _best_grasp)))
  (:serialization-length
   ()
   (+
    ;; bool _success
    1
    ;; ggcnn/Grasp _best_grasp
    (send _best_grasp :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _success
       (if _success (write-byte -1 s) (write-byte 0 s))
     ;; ggcnn/Grasp _best_grasp
       (send _best_grasp :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _success
     (setq _success (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; ggcnn/Grasp _best_grasp
     (send _best_grasp :deserialize buf ptr-) (incf ptr- (send _best_grasp :serialization-length))
   ;;
   self)
  )

(defclass ggcnn::GraspPrediction
  :super ros::object
  :slots ())

(setf (get ggcnn::GraspPrediction :md5sum-) "86d7d0d5a00535c6699247df54f62820")
(setf (get ggcnn::GraspPrediction :datatype-) "ggcnn/GraspPrediction")
(setf (get ggcnn::GraspPrediction :request) ggcnn::GraspPredictionRequest)
(setf (get ggcnn::GraspPrediction :response) ggcnn::GraspPredictionResponse)

(defmethod ggcnn::GraspPredictionRequest
  (:response () (instance ggcnn::GraspPredictionResponse :init)))

(setf (get ggcnn::GraspPredictionRequest :md5sum-) "86d7d0d5a00535c6699247df54f62820")
(setf (get ggcnn::GraspPredictionRequest :datatype-) "ggcnn/GraspPredictionRequest")
(setf (get ggcnn::GraspPredictionRequest :definition-)
      "---
bool success
ggcnn/Grasp best_grasp


================================================================================
MSG: ggcnn/Grasp
geometry_msgs/Pose pose
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

(setf (get ggcnn::GraspPredictionResponse :md5sum-) "86d7d0d5a00535c6699247df54f62820")
(setf (get ggcnn::GraspPredictionResponse :datatype-) "ggcnn/GraspPredictionResponse")
(setf (get ggcnn::GraspPredictionResponse :definition-)
      "---
bool success
ggcnn/Grasp best_grasp


================================================================================
MSG: ggcnn/Grasp
geometry_msgs/Pose pose
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



(provide :ggcnn/GraspPrediction "86d7d0d5a00535c6699247df54f62820")


