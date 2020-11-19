; Auto-generated. Do not edit!


(cl:in-package cartesian_control-msg)


;//! \htmlinclude CartesianCommand.msg.html

(cl:defclass <CartesianCommand> (roslisp-msg-protocol:ros-message)
  ((x_target
    :reader x_target
    :initarg :x_target
    :type geometry_msgs-msg:Transform
    :initform (cl:make-instance 'geometry_msgs-msg:Transform))
   (secondary_objective
    :reader secondary_objective
    :initarg :secondary_objective
    :type cl:boolean
    :initform cl:nil)
   (q0_target
    :reader q0_target
    :initarg :q0_target
    :type cl:float
    :initform 0.0))
)

(cl:defclass CartesianCommand (<CartesianCommand>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <CartesianCommand>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'CartesianCommand)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name cartesian_control-msg:<CartesianCommand> is deprecated: use cartesian_control-msg:CartesianCommand instead.")))

(cl:ensure-generic-function 'x_target-val :lambda-list '(m))
(cl:defmethod x_target-val ((m <CartesianCommand>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cartesian_control-msg:x_target-val is deprecated.  Use cartesian_control-msg:x_target instead.")
  (x_target m))

(cl:ensure-generic-function 'secondary_objective-val :lambda-list '(m))
(cl:defmethod secondary_objective-val ((m <CartesianCommand>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cartesian_control-msg:secondary_objective-val is deprecated.  Use cartesian_control-msg:secondary_objective instead.")
  (secondary_objective m))

(cl:ensure-generic-function 'q0_target-val :lambda-list '(m))
(cl:defmethod q0_target-val ((m <CartesianCommand>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cartesian_control-msg:q0_target-val is deprecated.  Use cartesian_control-msg:q0_target instead.")
  (q0_target m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <CartesianCommand>) ostream)
  "Serializes a message object of type '<CartesianCommand>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'x_target) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'secondary_objective) 1 0)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'q0_target))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <CartesianCommand>) istream)
  "Deserializes a message object of type '<CartesianCommand>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'x_target) istream)
    (cl:setf (cl:slot-value msg 'secondary_objective) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'q0_target) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<CartesianCommand>)))
  "Returns string type for a message object of type '<CartesianCommand>"
  "cartesian_control/CartesianCommand")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'CartesianCommand)))
  "Returns string type for a message object of type 'CartesianCommand"
  "cartesian_control/CartesianCommand")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<CartesianCommand>)))
  "Returns md5sum for a message object of type '<CartesianCommand>"
  "e5ffe3cb2eac6f1acc27e5635f953be7")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'CartesianCommand)))
  "Returns md5sum for a message object of type 'CartesianCommand"
  "e5ffe3cb2eac6f1acc27e5635f953be7")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<CartesianCommand>)))
  "Returns full string definition for message of type '<CartesianCommand>"
  (cl:format cl:nil "geometry_msgs/Transform x_target~%bool secondary_objective~%float32 q0_target~%================================================================================~%MSG: geometry_msgs/Transform~%# This represents the transform between two coordinate frames in free space.~%~%Vector3 translation~%Quaternion rotation~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'CartesianCommand)))
  "Returns full string definition for message of type 'CartesianCommand"
  (cl:format cl:nil "geometry_msgs/Transform x_target~%bool secondary_objective~%float32 q0_target~%================================================================================~%MSG: geometry_msgs/Transform~%# This represents the transform between two coordinate frames in free space.~%~%Vector3 translation~%Quaternion rotation~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <CartesianCommand>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'x_target))
     1
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <CartesianCommand>))
  "Converts a ROS message object to a list"
  (cl:list 'CartesianCommand
    (cl:cons ':x_target (x_target msg))
    (cl:cons ':secondary_objective (secondary_objective msg))
    (cl:cons ':q0_target (q0_target msg))
))
