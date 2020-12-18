; Auto-generated. Do not edit!


(cl:in-package state_estimator-msg)


;//! \htmlinclude RobotPose.msg.html

(cl:defclass <RobotPose> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (pose
    :reader pose
    :initarg :pose
    :type geometry_msgs-msg:Pose2D
    :initform (cl:make-instance 'geometry_msgs-msg:Pose2D)))
)

(cl:defclass RobotPose (<RobotPose>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <RobotPose>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'RobotPose)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name state_estimator-msg:<RobotPose> is deprecated: use state_estimator-msg:RobotPose instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <RobotPose>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader state_estimator-msg:header-val is deprecated.  Use state_estimator-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'pose-val :lambda-list '(m))
(cl:defmethod pose-val ((m <RobotPose>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader state_estimator-msg:pose-val is deprecated.  Use state_estimator-msg:pose instead.")
  (pose m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <RobotPose>) ostream)
  "Serializes a message object of type '<RobotPose>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'pose) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <RobotPose>) istream)
  "Deserializes a message object of type '<RobotPose>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'pose) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<RobotPose>)))
  "Returns string type for a message object of type '<RobotPose>"
  "state_estimator/RobotPose")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'RobotPose)))
  "Returns string type for a message object of type 'RobotPose"
  "state_estimator/RobotPose")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<RobotPose>)))
  "Returns md5sum for a message object of type '<RobotPose>"
  "b5f1e28823201bc5ea7e310fc49d253f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'RobotPose)))
  "Returns md5sum for a message object of type 'RobotPose"
  "b5f1e28823201bc5ea7e310fc49d253f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<RobotPose>)))
  "Returns full string definition for message of type '<RobotPose>"
  (cl:format cl:nil "# Message header~%std_msgs/Header header~%~%# Robot pose~%geometry_msgs/Pose2D pose~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Pose2D~%# Deprecated~%# Please use the full 3D pose.~%~%# In general our recommendation is to use a full 3D representation of everything and for 2D specific applications make the appropriate projections into the plane for their calculations but optimally will preserve the 3D information during processing.~%~%# If we have parallel copies of 2D datatypes every UI and other pipeline will end up needing to have dual interfaces to plot everything. And you will end up with not being able to use 3D tools for 2D use cases even if they're completely valid, as you'd have to reimplement it with different inputs and outputs. It's not particularly hard to plot the 2D pose or compute the yaw error for the Pose message and there are already tools and libraries that can do this for you.~%~%~%# This expresses a position and orientation on a 2D manifold.~%~%float64 x~%float64 y~%float64 theta~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'RobotPose)))
  "Returns full string definition for message of type 'RobotPose"
  (cl:format cl:nil "# Message header~%std_msgs/Header header~%~%# Robot pose~%geometry_msgs/Pose2D pose~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Pose2D~%# Deprecated~%# Please use the full 3D pose.~%~%# In general our recommendation is to use a full 3D representation of everything and for 2D specific applications make the appropriate projections into the plane for their calculations but optimally will preserve the 3D information during processing.~%~%# If we have parallel copies of 2D datatypes every UI and other pipeline will end up needing to have dual interfaces to plot everything. And you will end up with not being able to use 3D tools for 2D use cases even if they're completely valid, as you'd have to reimplement it with different inputs and outputs. It's not particularly hard to plot the 2D pose or compute the yaw error for the Pose message and there are already tools and libraries that can do this for you.~%~%~%# This expresses a position and orientation on a 2D manifold.~%~%float64 x~%float64 y~%float64 theta~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <RobotPose>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'pose))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <RobotPose>))
  "Converts a ROS message object to a list"
  (cl:list 'RobotPose
    (cl:cons ':header (header msg))
    (cl:cons ':pose (pose msg))
))
