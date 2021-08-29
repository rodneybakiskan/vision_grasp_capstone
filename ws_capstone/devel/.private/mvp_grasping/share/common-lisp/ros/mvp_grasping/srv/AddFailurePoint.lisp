; Auto-generated. Do not edit!


(cl:in-package mvp_grasping-srv)


;//! \htmlinclude AddFailurePoint-request.msg.html

(cl:defclass <AddFailurePoint-request> (roslisp-msg-protocol:ros-message)
  ((point
    :reader point
    :initarg :point
    :type geometry_msgs-msg:Point
    :initform (cl:make-instance 'geometry_msgs-msg:Point)))
)

(cl:defclass AddFailurePoint-request (<AddFailurePoint-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <AddFailurePoint-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'AddFailurePoint-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name mvp_grasping-srv:<AddFailurePoint-request> is deprecated: use mvp_grasping-srv:AddFailurePoint-request instead.")))

(cl:ensure-generic-function 'point-val :lambda-list '(m))
(cl:defmethod point-val ((m <AddFailurePoint-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mvp_grasping-srv:point-val is deprecated.  Use mvp_grasping-srv:point instead.")
  (point m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <AddFailurePoint-request>) ostream)
  "Serializes a message object of type '<AddFailurePoint-request>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'point) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <AddFailurePoint-request>) istream)
  "Deserializes a message object of type '<AddFailurePoint-request>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'point) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<AddFailurePoint-request>)))
  "Returns string type for a service object of type '<AddFailurePoint-request>"
  "mvp_grasping/AddFailurePointRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'AddFailurePoint-request)))
  "Returns string type for a service object of type 'AddFailurePoint-request"
  "mvp_grasping/AddFailurePointRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<AddFailurePoint-request>)))
  "Returns md5sum for a message object of type '<AddFailurePoint-request>"
  "a7c84ff13976aa04656e56e300124444")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'AddFailurePoint-request)))
  "Returns md5sum for a message object of type 'AddFailurePoint-request"
  "a7c84ff13976aa04656e56e300124444")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<AddFailurePoint-request>)))
  "Returns full string definition for message of type '<AddFailurePoint-request>"
  (cl:format cl:nil "geometry_msgs/Point point~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'AddFailurePoint-request)))
  "Returns full string definition for message of type 'AddFailurePoint-request"
  (cl:format cl:nil "geometry_msgs/Point point~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <AddFailurePoint-request>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'point))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <AddFailurePoint-request>))
  "Converts a ROS message object to a list"
  (cl:list 'AddFailurePoint-request
    (cl:cons ':point (point msg))
))
;//! \htmlinclude AddFailurePoint-response.msg.html

(cl:defclass <AddFailurePoint-response> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass AddFailurePoint-response (<AddFailurePoint-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <AddFailurePoint-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'AddFailurePoint-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name mvp_grasping-srv:<AddFailurePoint-response> is deprecated: use mvp_grasping-srv:AddFailurePoint-response instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <AddFailurePoint-response>) ostream)
  "Serializes a message object of type '<AddFailurePoint-response>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <AddFailurePoint-response>) istream)
  "Deserializes a message object of type '<AddFailurePoint-response>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<AddFailurePoint-response>)))
  "Returns string type for a service object of type '<AddFailurePoint-response>"
  "mvp_grasping/AddFailurePointResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'AddFailurePoint-response)))
  "Returns string type for a service object of type 'AddFailurePoint-response"
  "mvp_grasping/AddFailurePointResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<AddFailurePoint-response>)))
  "Returns md5sum for a message object of type '<AddFailurePoint-response>"
  "a7c84ff13976aa04656e56e300124444")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'AddFailurePoint-response)))
  "Returns md5sum for a message object of type 'AddFailurePoint-response"
  "a7c84ff13976aa04656e56e300124444")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<AddFailurePoint-response>)))
  "Returns full string definition for message of type '<AddFailurePoint-response>"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'AddFailurePoint-response)))
  "Returns full string definition for message of type 'AddFailurePoint-response"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <AddFailurePoint-response>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <AddFailurePoint-response>))
  "Converts a ROS message object to a list"
  (cl:list 'AddFailurePoint-response
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'AddFailurePoint)))
  'AddFailurePoint-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'AddFailurePoint)))
  'AddFailurePoint-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'AddFailurePoint)))
  "Returns string type for a service object of type '<AddFailurePoint>"
  "mvp_grasping/AddFailurePoint")