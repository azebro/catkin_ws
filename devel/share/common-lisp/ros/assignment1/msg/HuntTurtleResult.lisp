; Auto-generated. Do not edit!


(cl:in-package assignment1-msg)


;//! \htmlinclude HuntTurtleResult.msg.html

(cl:defclass <HuntTurtleResult> (roslisp-msg-protocol:ros-message)
  ((status
    :reader status
    :initarg :status
    :type cl:string
    :initform "")
   (time
    :reader time
    :initarg :time
    :type cl:float
    :initform 0.0))
)

(cl:defclass HuntTurtleResult (<HuntTurtleResult>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <HuntTurtleResult>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'HuntTurtleResult)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name assignment1-msg:<HuntTurtleResult> is deprecated: use assignment1-msg:HuntTurtleResult instead.")))

(cl:ensure-generic-function 'status-val :lambda-list '(m))
(cl:defmethod status-val ((m <HuntTurtleResult>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader assignment1-msg:status-val is deprecated.  Use assignment1-msg:status instead.")
  (status m))

(cl:ensure-generic-function 'time-val :lambda-list '(m))
(cl:defmethod time-val ((m <HuntTurtleResult>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader assignment1-msg:time-val is deprecated.  Use assignment1-msg:time instead.")
  (time m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <HuntTurtleResult>) ostream)
  "Serializes a message object of type '<HuntTurtleResult>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'status))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'status))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'time))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <HuntTurtleResult>) istream)
  "Deserializes a message object of type '<HuntTurtleResult>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'status) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'status) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'time) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<HuntTurtleResult>)))
  "Returns string type for a message object of type '<HuntTurtleResult>"
  "assignment1/HuntTurtleResult")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'HuntTurtleResult)))
  "Returns string type for a message object of type 'HuntTurtleResult"
  "assignment1/HuntTurtleResult")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<HuntTurtleResult>)))
  "Returns md5sum for a message object of type '<HuntTurtleResult>"
  "4fc38c7a693cc0fee1486d3f8d3005fb")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'HuntTurtleResult)))
  "Returns md5sum for a message object of type 'HuntTurtleResult"
  "4fc38c7a693cc0fee1486d3f8d3005fb")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<HuntTurtleResult>)))
  "Returns full string definition for message of type '<HuntTurtleResult>"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%#result definition~%string status~%float32 time~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'HuntTurtleResult)))
  "Returns full string definition for message of type 'HuntTurtleResult"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%#result definition~%string status~%float32 time~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <HuntTurtleResult>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'status))
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <HuntTurtleResult>))
  "Converts a ROS message object to a list"
  (cl:list 'HuntTurtleResult
    (cl:cons ':status (status msg))
    (cl:cons ':time (time msg))
))
