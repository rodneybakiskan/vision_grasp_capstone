; Auto-generated. Do not edit!


(cl:in-package ggcnn-srv)


;//! \htmlinclude GraspPrediction-request.msg.html

(cl:defclass <GraspPrediction-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass GraspPrediction-request (<GraspPrediction-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GraspPrediction-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GraspPrediction-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ggcnn-srv:<GraspPrediction-request> is deprecated: use ggcnn-srv:GraspPrediction-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GraspPrediction-request>) ostream)
  "Serializes a message object of type '<GraspPrediction-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GraspPrediction-request>) istream)
  "Deserializes a message object of type '<GraspPrediction-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GraspPrediction-request>)))
  "Returns string type for a service object of type '<GraspPrediction-request>"
  "ggcnn/GraspPredictionRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GraspPrediction-request)))
  "Returns string type for a service object of type 'GraspPrediction-request"
  "ggcnn/GraspPredictionRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GraspPrediction-request>)))
  "Returns md5sum for a message object of type '<GraspPrediction-request>"
  "86d7d0d5a00535c6699247df54f62820")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GraspPrediction-request)))
  "Returns md5sum for a message object of type 'GraspPrediction-request"
  "86d7d0d5a00535c6699247df54f62820")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GraspPrediction-request>)))
  "Returns full string definition for message of type '<GraspPrediction-request>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GraspPrediction-request)))
  "Returns full string definition for message of type 'GraspPrediction-request"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GraspPrediction-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GraspPrediction-request>))
  "Converts a ROS message object to a list"
  (cl:list 'GraspPrediction-request
))
;//! \htmlinclude GraspPrediction-response.msg.html

(cl:defclass <GraspPrediction-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil)
   (best_grasp
    :reader best_grasp
    :initarg :best_grasp
    :type ggcnn-msg:Grasp
    :initform (cl:make-instance 'ggcnn-msg:Grasp)))
)

(cl:defclass GraspPrediction-response (<GraspPrediction-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GraspPrediction-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GraspPrediction-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ggcnn-srv:<GraspPrediction-response> is deprecated: use ggcnn-srv:GraspPrediction-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <GraspPrediction-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ggcnn-srv:success-val is deprecated.  Use ggcnn-srv:success instead.")
  (success m))

(cl:ensure-generic-function 'best_grasp-val :lambda-list '(m))
(cl:defmethod best_grasp-val ((m <GraspPrediction-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ggcnn-srv:best_grasp-val is deprecated.  Use ggcnn-srv:best_grasp instead.")
  (best_grasp m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GraspPrediction-response>) ostream)
  "Serializes a message object of type '<GraspPrediction-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'best_grasp) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GraspPrediction-response>) istream)
  "Deserializes a message object of type '<GraspPrediction-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'best_grasp) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GraspPrediction-response>)))
  "Returns string type for a service object of type '<GraspPrediction-response>"
  "ggcnn/GraspPredictionResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GraspPrediction-response)))
  "Returns string type for a service object of type 'GraspPrediction-response"
  "ggcnn/GraspPredictionResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GraspPrediction-response>)))
  "Returns md5sum for a message object of type '<GraspPrediction-response>"
  "86d7d0d5a00535c6699247df54f62820")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GraspPrediction-response)))
  "Returns md5sum for a message object of type 'GraspPrediction-response"
  "86d7d0d5a00535c6699247df54f62820")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GraspPrediction-response>)))
  "Returns full string definition for message of type '<GraspPrediction-response>"
  (cl:format cl:nil "bool success~%ggcnn/Grasp best_grasp~%~%~%================================================================================~%MSG: ggcnn/Grasp~%geometry_msgs/Pose pose~%float32 width~%float32 quality~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GraspPrediction-response)))
  "Returns full string definition for message of type 'GraspPrediction-response"
  (cl:format cl:nil "bool success~%ggcnn/Grasp best_grasp~%~%~%================================================================================~%MSG: ggcnn/Grasp~%geometry_msgs/Pose pose~%float32 width~%float32 quality~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GraspPrediction-response>))
  (cl:+ 0
     1
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'best_grasp))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GraspPrediction-response>))
  "Converts a ROS message object to a list"
  (cl:list 'GraspPrediction-response
    (cl:cons ':success (success msg))
    (cl:cons ':best_grasp (best_grasp msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'GraspPrediction)))
  'GraspPrediction-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'GraspPrediction)))
  'GraspPrediction-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GraspPrediction)))
  "Returns string type for a service object of type '<GraspPrediction>"
  "ggcnn/GraspPrediction")