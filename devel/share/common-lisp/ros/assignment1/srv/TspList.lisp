; Auto-generated. Do not edit!


(cl:in-package assignment1-srv)


;//! \htmlinclude TspList-request.msg.html

(cl:defclass <TspList-request> (roslisp-msg-protocol:ros-message)
  ((turtles
    :reader turtles
    :initarg :turtles
    :type cl:string
    :initform ""))
)

(cl:defclass TspList-request (<TspList-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <TspList-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'TspList-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name assignment1-srv:<TspList-request> is deprecated: use assignment1-srv:TspList-request instead.")))

(cl:ensure-generic-function 'turtles-val :lambda-list '(m))
(cl:defmethod turtles-val ((m <TspList-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader assignment1-srv:turtles-val is deprecated.  Use assignment1-srv:turtles instead.")
  (turtles m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <TspList-request>) ostream)
  "Serializes a message object of type '<TspList-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'turtles))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'turtles))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <TspList-request>) istream)
  "Deserializes a message object of type '<TspList-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'turtles) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'turtles) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<TspList-request>)))
  "Returns string type for a service object of type '<TspList-request>"
  "assignment1/TspListRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'TspList-request)))
  "Returns string type for a service object of type 'TspList-request"
  "assignment1/TspListRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<TspList-request>)))
  "Returns md5sum for a message object of type '<TspList-request>"
  "479c0bc11d8910d2e80e7da4072f2c4a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'TspList-request)))
  "Returns md5sum for a message object of type 'TspList-request"
  "479c0bc11d8910d2e80e7da4072f2c4a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<TspList-request>)))
  "Returns full string definition for message of type '<TspList-request>"
  (cl:format cl:nil "string turtles~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'TspList-request)))
  "Returns full string definition for message of type 'TspList-request"
  (cl:format cl:nil "string turtles~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <TspList-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'turtles))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <TspList-request>))
  "Converts a ROS message object to a list"
  (cl:list 'TspList-request
    (cl:cons ':turtles (turtles msg))
))
;//! \htmlinclude TspList-response.msg.html

(cl:defclass <TspList-response> (roslisp-msg-protocol:ros-message)
  ((sequence
    :reader sequence
    :initarg :sequence
    :type (cl:vector cl:integer)
   :initform (cl:make-array 0 :element-type 'cl:integer :initial-element 0)))
)

(cl:defclass TspList-response (<TspList-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <TspList-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'TspList-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name assignment1-srv:<TspList-response> is deprecated: use assignment1-srv:TspList-response instead.")))

(cl:ensure-generic-function 'sequence-val :lambda-list '(m))
(cl:defmethod sequence-val ((m <TspList-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader assignment1-srv:sequence-val is deprecated.  Use assignment1-srv:sequence instead.")
  (sequence m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <TspList-response>) ostream)
  "Serializes a message object of type '<TspList-response>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'sequence))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let* ((signed ele) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    ))
   (cl:slot-value msg 'sequence))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <TspList-response>) istream)
  "Deserializes a message object of type '<TspList-response>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'sequence) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'sequence)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296)))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<TspList-response>)))
  "Returns string type for a service object of type '<TspList-response>"
  "assignment1/TspListResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'TspList-response)))
  "Returns string type for a service object of type 'TspList-response"
  "assignment1/TspListResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<TspList-response>)))
  "Returns md5sum for a message object of type '<TspList-response>"
  "479c0bc11d8910d2e80e7da4072f2c4a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'TspList-response)))
  "Returns md5sum for a message object of type 'TspList-response"
  "479c0bc11d8910d2e80e7da4072f2c4a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<TspList-response>)))
  "Returns full string definition for message of type '<TspList-response>"
  (cl:format cl:nil "int32[] sequence~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'TspList-response)))
  "Returns full string definition for message of type 'TspList-response"
  (cl:format cl:nil "int32[] sequence~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <TspList-response>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'sequence) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <TspList-response>))
  "Converts a ROS message object to a list"
  (cl:list 'TspList-response
    (cl:cons ':sequence (sequence msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'TspList)))
  'TspList-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'TspList)))
  'TspList-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'TspList)))
  "Returns string type for a service object of type '<TspList>"
  "assignment1/TspList")