; Auto-generated. Do not edit!


(cl:in-package assignment0-msg)


;//! \htmlinclude TwoInt.msg.html

(cl:defclass <TwoInt> (roslisp-msg-protocol:ros-message)
  ((num1
    :reader num1
    :initarg :num1
    :type cl:fixnum
    :initform 0)
   (num2
    :reader num2
    :initarg :num2
    :type cl:fixnum
    :initform 0))
)

(cl:defclass TwoInt (<TwoInt>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <TwoInt>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'TwoInt)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name assignment0-msg:<TwoInt> is deprecated: use assignment0-msg:TwoInt instead.")))

(cl:ensure-generic-function 'num1-val :lambda-list '(m))
(cl:defmethod num1-val ((m <TwoInt>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader assignment0-msg:num1-val is deprecated.  Use assignment0-msg:num1 instead.")
  (num1 m))

(cl:ensure-generic-function 'num2-val :lambda-list '(m))
(cl:defmethod num2-val ((m <TwoInt>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader assignment0-msg:num2-val is deprecated.  Use assignment0-msg:num2 instead.")
  (num2 m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <TwoInt>) ostream)
  "Serializes a message object of type '<TwoInt>"
  (cl:let* ((signed (cl:slot-value msg 'num1)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'num2)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <TwoInt>) istream)
  "Deserializes a message object of type '<TwoInt>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'num1) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'num2) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<TwoInt>)))
  "Returns string type for a message object of type '<TwoInt>"
  "assignment0/TwoInt")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'TwoInt)))
  "Returns string type for a message object of type 'TwoInt"
  "assignment0/TwoInt")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<TwoInt>)))
  "Returns md5sum for a message object of type '<TwoInt>"
  "57106ecc5f261c3b4e1105c1171fe312")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'TwoInt)))
  "Returns md5sum for a message object of type 'TwoInt"
  "57106ecc5f261c3b4e1105c1171fe312")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<TwoInt>)))
  "Returns full string definition for message of type '<TwoInt>"
  (cl:format cl:nil "int8 num1~%int8 num2~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'TwoInt)))
  "Returns full string definition for message of type 'TwoInt"
  (cl:format cl:nil "int8 num1~%int8 num2~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <TwoInt>))
  (cl:+ 0
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <TwoInt>))
  "Converts a ROS message object to a list"
  (cl:list 'TwoInt
    (cl:cons ':num1 (num1 msg))
    (cl:cons ':num2 (num2 msg))
))
