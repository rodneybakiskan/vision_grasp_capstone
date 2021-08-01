; Auto-generated. Do not edit!


(cl:in-package mvp_grasping-srv)


;//! \htmlinclude NextViewpoint-request.msg.html

(cl:defclass <NextViewpoint-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass NextViewpoint-request (<NextViewpoint-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <NextViewpoint-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'NextViewpoint-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name mvp_grasping-srv:<NextViewpoint-request> is deprecated: use mvp_grasping-srv:NextViewpoint-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <NextViewpoint-request>) ostream)
  "Serializes a message object of type '<NextViewpoint-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <NextViewpoint-request>) istream)
  "Deserializes a message object of type '<NextViewpoint-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<NextViewpoint-request>)))
  "Returns string type for a service object of type '<NextViewpoint-request>"
  "mvp_grasping/NextViewpointRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'NextViewpoint-request)))
  "Returns string type for a service object of type 'NextViewpoint-request"
  "mvp_grasping/NextViewpointRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<NextViewpoint-request>)))
  "Returns md5sum for a message object of type '<NextViewpoint-request>"
  "b48658ae3de44f598cf8af1346003291")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'NextViewpoint-request)))
  "Returns md5sum for a message object of type 'NextViewpoint-request"
  "b48658ae3de44f598cf8af1346003291")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<NextViewpoint-request>)))
  "Returns full string definition for message of type '<NextViewpoint-request>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'NextViewpoint-request)))
  "Returns full string definition for message of type 'NextViewpoint-request"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <NextViewpoint-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <NextViewpoint-request>))
  "Converts a ROS message object to a list"
  (cl:list 'NextViewpoint-request
))
;//! \htmlinclude NextViewpoint-response.msg.html

(cl:defclass <NextViewpoint-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil)
   (velocity_cmd
    :reader velocity_cmd
    :initarg :velocity_cmd
    :type geometry_msgs-msg:Twist
    :initform (cl:make-instance 'geometry_msgs-msg:Twist))
   (best_grasp
    :reader best_grasp
    :initarg :best_grasp
    :type mvp_grasping-msg:Grasp
    :initform (cl:make-instance 'mvp_grasping-msg:Grasp))
   (no_viewpoints
    :reader no_viewpoints
    :initarg :no_viewpoints
    :type cl:integer
    :initform 0))
)

(cl:defclass NextViewpoint-response (<NextViewpoint-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <NextViewpoint-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'NextViewpoint-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name mvp_grasping-srv:<NextViewpoint-response> is deprecated: use mvp_grasping-srv:NextViewpoint-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <NextViewpoint-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mvp_grasping-srv:success-val is deprecated.  Use mvp_grasping-srv:success instead.")
  (success m))

(cl:ensure-generic-function 'velocity_cmd-val :lambda-list '(m))
(cl:defmethod velocity_cmd-val ((m <NextViewpoint-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mvp_grasping-srv:velocity_cmd-val is deprecated.  Use mvp_grasping-srv:velocity_cmd instead.")
  (velocity_cmd m))

(cl:ensure-generic-function 'best_grasp-val :lambda-list '(m))
(cl:defmethod best_grasp-val ((m <NextViewpoint-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mvp_grasping-srv:best_grasp-val is deprecated.  Use mvp_grasping-srv:best_grasp instead.")
  (best_grasp m))

(cl:ensure-generic-function 'no_viewpoints-val :lambda-list '(m))
(cl:defmethod no_viewpoints-val ((m <NextViewpoint-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mvp_grasping-srv:no_viewpoints-val is deprecated.  Use mvp_grasping-srv:no_viewpoints instead.")
  (no_viewpoints m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <NextViewpoint-response>) ostream)
  "Serializes a message object of type '<NextViewpoint-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'velocity_cmd) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'best_grasp) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'no_viewpoints)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'no_viewpoints)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'no_viewpoints)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'no_viewpoints)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <NextViewpoint-response>) istream)
  "Deserializes a message object of type '<NextViewpoint-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'velocity_cmd) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'best_grasp) istream)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'no_viewpoints)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'no_viewpoints)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'no_viewpoints)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'no_viewpoints)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<NextViewpoint-response>)))
  "Returns string type for a service object of type '<NextViewpoint-response>"
  "mvp_grasping/NextViewpointResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'NextViewpoint-response)))
  "Returns string type for a service object of type 'NextViewpoint-response"
  "mvp_grasping/NextViewpointResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<NextViewpoint-response>)))
  "Returns md5sum for a message object of type '<NextViewpoint-response>"
  "b48658ae3de44f598cf8af1346003291")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'NextViewpoint-response)))
  "Returns md5sum for a message object of type 'NextViewpoint-response"
  "b48658ae3de44f598cf8af1346003291")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<NextViewpoint-response>)))
  "Returns full string definition for message of type '<NextViewpoint-response>"
  (cl:format cl:nil "bool success~%geometry_msgs/Twist velocity_cmd~%mvp_grasping/Grasp best_grasp~%uint32 no_viewpoints~%~%~%================================================================================~%MSG: geometry_msgs/Twist~%# This expresses velocity in free space broken into its linear and angular parts.~%Vector3  linear~%Vector3  angular~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%================================================================================~%MSG: mvp_grasping/Grasp~%geometry_msgs/Pose pose~%float32 quality~%float32 entropy~%float32 width~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'NextViewpoint-response)))
  "Returns full string definition for message of type 'NextViewpoint-response"
  (cl:format cl:nil "bool success~%geometry_msgs/Twist velocity_cmd~%mvp_grasping/Grasp best_grasp~%uint32 no_viewpoints~%~%~%================================================================================~%MSG: geometry_msgs/Twist~%# This expresses velocity in free space broken into its linear and angular parts.~%Vector3  linear~%Vector3  angular~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%================================================================================~%MSG: mvp_grasping/Grasp~%geometry_msgs/Pose pose~%float32 quality~%float32 entropy~%float32 width~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <NextViewpoint-response>))
  (cl:+ 0
     1
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'velocity_cmd))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'best_grasp))
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <NextViewpoint-response>))
  "Converts a ROS message object to a list"
  (cl:list 'NextViewpoint-response
    (cl:cons ':success (success msg))
    (cl:cons ':velocity_cmd (velocity_cmd msg))
    (cl:cons ':best_grasp (best_grasp msg))
    (cl:cons ':no_viewpoints (no_viewpoints msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'NextViewpoint)))
  'NextViewpoint-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'NextViewpoint)))
  'NextViewpoint-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'NextViewpoint)))
  "Returns string type for a service object of type '<NextViewpoint>"
  "mvp_grasping/NextViewpoint")