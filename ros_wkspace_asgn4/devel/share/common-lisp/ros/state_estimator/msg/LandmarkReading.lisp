; Auto-generated. Do not edit!


(cl:in-package state_estimator-msg)


;//! \htmlinclude LandmarkReading.msg.html

(cl:defclass <LandmarkReading> (roslisp-msg-protocol:ros-message)
  ((landmark
    :reader landmark
    :initarg :landmark
    :type state_estimator-msg:Landmark
    :initform (cl:make-instance 'state_estimator-msg:Landmark))
   (range
    :reader range
    :initarg :range
    :type cl:float
    :initform 0.0)
   (bearing
    :reader bearing
    :initarg :bearing
    :type cl:float
    :initform 0.0))
)

(cl:defclass LandmarkReading (<LandmarkReading>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <LandmarkReading>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'LandmarkReading)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name state_estimator-msg:<LandmarkReading> is deprecated: use state_estimator-msg:LandmarkReading instead.")))

(cl:ensure-generic-function 'landmark-val :lambda-list '(m))
(cl:defmethod landmark-val ((m <LandmarkReading>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader state_estimator-msg:landmark-val is deprecated.  Use state_estimator-msg:landmark instead.")
  (landmark m))

(cl:ensure-generic-function 'range-val :lambda-list '(m))
(cl:defmethod range-val ((m <LandmarkReading>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader state_estimator-msg:range-val is deprecated.  Use state_estimator-msg:range instead.")
  (range m))

(cl:ensure-generic-function 'bearing-val :lambda-list '(m))
(cl:defmethod bearing-val ((m <LandmarkReading>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader state_estimator-msg:bearing-val is deprecated.  Use state_estimator-msg:bearing instead.")
  (bearing m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <LandmarkReading>) ostream)
  "Serializes a message object of type '<LandmarkReading>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'landmark) ostream)
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'range))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'bearing))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <LandmarkReading>) istream)
  "Deserializes a message object of type '<LandmarkReading>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'landmark) istream)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'range) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'bearing) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<LandmarkReading>)))
  "Returns string type for a message object of type '<LandmarkReading>"
  "state_estimator/LandmarkReading")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'LandmarkReading)))
  "Returns string type for a message object of type 'LandmarkReading"
  "state_estimator/LandmarkReading")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<LandmarkReading>)))
  "Returns md5sum for a message object of type '<LandmarkReading>"
  "b6297115c9296944dda00cf56fb301f4")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'LandmarkReading)))
  "Returns md5sum for a message object of type 'LandmarkReading"
  "b6297115c9296944dda00cf56fb301f4")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<LandmarkReading>)))
  "Returns full string definition for message of type '<LandmarkReading>"
  (cl:format cl:nil "# The landmark for which this reading was created~%state_estimator/Landmark landmark~%~%# The range from the robot's location to the landmark above~%float64 range~%~%# The bearing of this landmark relative to the robot's orientation~%float64 bearing~%~%================================================================================~%MSG: state_estimator/Landmark~%# The x coordinate of this landmark~%float64 x~%~%# The y coordinate of this landmark~%float64 y~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'LandmarkReading)))
  "Returns full string definition for message of type 'LandmarkReading"
  (cl:format cl:nil "# The landmark for which this reading was created~%state_estimator/Landmark landmark~%~%# The range from the robot's location to the landmark above~%float64 range~%~%# The bearing of this landmark relative to the robot's orientation~%float64 bearing~%~%================================================================================~%MSG: state_estimator/Landmark~%# The x coordinate of this landmark~%float64 x~%~%# The y coordinate of this landmark~%float64 y~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <LandmarkReading>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'landmark))
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <LandmarkReading>))
  "Converts a ROS message object to a list"
  (cl:list 'LandmarkReading
    (cl:cons ':landmark (landmark msg))
    (cl:cons ':range (range msg))
    (cl:cons ':bearing (bearing msg))
))
