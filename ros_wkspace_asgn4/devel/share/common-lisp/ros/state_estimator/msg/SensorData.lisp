; Auto-generated. Do not edit!


(cl:in-package state_estimator-msg)


;//! \htmlinclude SensorData.msg.html

(cl:defclass <SensorData> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (vel_trans
    :reader vel_trans
    :initarg :vel_trans
    :type cl:float
    :initform 0.0)
   (vel_ang
    :reader vel_ang
    :initarg :vel_ang
    :type cl:float
    :initform 0.0)
   (readings
    :reader readings
    :initarg :readings
    :type (cl:vector state_estimator-msg:LandmarkReading)
   :initform (cl:make-array 0 :element-type 'state_estimator-msg:LandmarkReading :initial-element (cl:make-instance 'state_estimator-msg:LandmarkReading))))
)

(cl:defclass SensorData (<SensorData>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SensorData>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SensorData)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name state_estimator-msg:<SensorData> is deprecated: use state_estimator-msg:SensorData instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <SensorData>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader state_estimator-msg:header-val is deprecated.  Use state_estimator-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'vel_trans-val :lambda-list '(m))
(cl:defmethod vel_trans-val ((m <SensorData>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader state_estimator-msg:vel_trans-val is deprecated.  Use state_estimator-msg:vel_trans instead.")
  (vel_trans m))

(cl:ensure-generic-function 'vel_ang-val :lambda-list '(m))
(cl:defmethod vel_ang-val ((m <SensorData>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader state_estimator-msg:vel_ang-val is deprecated.  Use state_estimator-msg:vel_ang instead.")
  (vel_ang m))

(cl:ensure-generic-function 'readings-val :lambda-list '(m))
(cl:defmethod readings-val ((m <SensorData>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader state_estimator-msg:readings-val is deprecated.  Use state_estimator-msg:readings instead.")
  (readings m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SensorData>) ostream)
  "Serializes a message object of type '<SensorData>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'vel_trans))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'vel_ang))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'readings))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'readings))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SensorData>) istream)
  "Deserializes a message object of type '<SensorData>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'vel_trans) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'vel_ang) (roslisp-utils:decode-double-float-bits bits)))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'readings) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'readings)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'state_estimator-msg:LandmarkReading))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SensorData>)))
  "Returns string type for a message object of type '<SensorData>"
  "state_estimator/SensorData")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SensorData)))
  "Returns string type for a message object of type 'SensorData"
  "state_estimator/SensorData")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SensorData>)))
  "Returns md5sum for a message object of type '<SensorData>"
  "216a9c8ffac46cf3c39b26f16980385c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SensorData)))
  "Returns md5sum for a message object of type 'SensorData"
  "216a9c8ffac46cf3c39b26f16980385c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SensorData>)))
  "Returns full string definition for message of type '<SensorData>"
  (cl:format cl:nil "# Message header~%std_msgs/Header header~%~%# The forward translational velocity commanded to the robot~%float64 vel_trans~%~%# The rotational velocity commanded to the robot~%float64 vel_ang~%~%# The readings of landmarks with the range of the robot's sensors~%# Can be empty, if no landmarks are nearby~%state_estimator/LandmarkReading[] readings~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: state_estimator/LandmarkReading~%# The landmark for which this reading was created~%state_estimator/Landmark landmark~%~%# The range from the robot's location to the landmark above~%float64 range~%~%# The bearing of this landmark relative to the robot's orientation~%float64 bearing~%~%================================================================================~%MSG: state_estimator/Landmark~%# The x coordinate of this landmark~%float64 x~%~%# The y coordinate of this landmark~%float64 y~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SensorData)))
  "Returns full string definition for message of type 'SensorData"
  (cl:format cl:nil "# Message header~%std_msgs/Header header~%~%# The forward translational velocity commanded to the robot~%float64 vel_trans~%~%# The rotational velocity commanded to the robot~%float64 vel_ang~%~%# The readings of landmarks with the range of the robot's sensors~%# Can be empty, if no landmarks are nearby~%state_estimator/LandmarkReading[] readings~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: state_estimator/LandmarkReading~%# The landmark for which this reading was created~%state_estimator/Landmark landmark~%~%# The range from the robot's location to the landmark above~%float64 range~%~%# The bearing of this landmark relative to the robot's orientation~%float64 bearing~%~%================================================================================~%MSG: state_estimator/Landmark~%# The x coordinate of this landmark~%float64 x~%~%# The y coordinate of this landmark~%float64 y~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SensorData>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     8
     8
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'readings) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SensorData>))
  "Converts a ROS message object to a list"
  (cl:list 'SensorData
    (cl:cons ':header (header msg))
    (cl:cons ':vel_trans (vel_trans msg))
    (cl:cons ':vel_ang (vel_ang msg))
    (cl:cons ':readings (readings msg))
))
