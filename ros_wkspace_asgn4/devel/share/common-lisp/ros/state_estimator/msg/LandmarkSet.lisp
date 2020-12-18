; Auto-generated. Do not edit!


(cl:in-package state_estimator-msg)


;//! \htmlinclude LandmarkSet.msg.html

(cl:defclass <LandmarkSet> (roslisp-msg-protocol:ros-message)
  ((landmarks
    :reader landmarks
    :initarg :landmarks
    :type (cl:vector state_estimator-msg:Landmark)
   :initform (cl:make-array 0 :element-type 'state_estimator-msg:Landmark :initial-element (cl:make-instance 'state_estimator-msg:Landmark))))
)

(cl:defclass LandmarkSet (<LandmarkSet>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <LandmarkSet>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'LandmarkSet)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name state_estimator-msg:<LandmarkSet> is deprecated: use state_estimator-msg:LandmarkSet instead.")))

(cl:ensure-generic-function 'landmarks-val :lambda-list '(m))
(cl:defmethod landmarks-val ((m <LandmarkSet>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader state_estimator-msg:landmarks-val is deprecated.  Use state_estimator-msg:landmarks instead.")
  (landmarks m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <LandmarkSet>) ostream)
  "Serializes a message object of type '<LandmarkSet>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'landmarks))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'landmarks))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <LandmarkSet>) istream)
  "Deserializes a message object of type '<LandmarkSet>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'landmarks) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'landmarks)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'state_estimator-msg:Landmark))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<LandmarkSet>)))
  "Returns string type for a message object of type '<LandmarkSet>"
  "state_estimator/LandmarkSet")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'LandmarkSet)))
  "Returns string type for a message object of type 'LandmarkSet"
  "state_estimator/LandmarkSet")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<LandmarkSet>)))
  "Returns md5sum for a message object of type '<LandmarkSet>"
  "2e42ef07fd19a8de8b0770685a8090aa")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'LandmarkSet)))
  "Returns md5sum for a message object of type 'LandmarkSet"
  "2e42ef07fd19a8de8b0770685a8090aa")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<LandmarkSet>)))
  "Returns full string definition for message of type '<LandmarkSet>"
  (cl:format cl:nil "state_estimator/Landmark[] landmarks~%~%================================================================================~%MSG: state_estimator/Landmark~%# The x coordinate of this landmark~%float64 x~%~%# The y coordinate of this landmark~%float64 y~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'LandmarkSet)))
  "Returns full string definition for message of type 'LandmarkSet"
  (cl:format cl:nil "state_estimator/Landmark[] landmarks~%~%================================================================================~%MSG: state_estimator/Landmark~%# The x coordinate of this landmark~%float64 x~%~%# The y coordinate of this landmark~%float64 y~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <LandmarkSet>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'landmarks) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <LandmarkSet>))
  "Converts a ROS message object to a list"
  (cl:list 'LandmarkSet
    (cl:cons ':landmarks (landmarks msg))
))
