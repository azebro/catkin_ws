; Auto-generated. Do not edit!


(cl:in-package assignment1-srv)


;//! \htmlinclude TurtleSpawn-request.msg.html

(cl:defclass <TurtleSpawn-request> (roslisp-msg-protocol:ros-message)
  ((turtleCount
    :reader turtleCount
    :initarg :turtleCount
    :type cl:integer
    :initform 0))
)

(cl:defclass TurtleSpawn-request (<TurtleSpawn-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <TurtleSpawn-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'TurtleSpawn-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name assignment1-srv:<TurtleSpawn-request> is deprecated: use assignment1-srv:TurtleSpawn-request instead.")))

(cl:ensure-generic-function 'turtleCount-val :lambda-list '(m))
(cl:defmethod turtleCount-val ((m <TurtleSpawn-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader assignment1-srv:turtleCount-val is deprecated.  Use assignment1-srv:turtleCount instead.")
  (turtleCount m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <TurtleSpawn-request>) ostream)
  "Serializes a message object of type '<TurtleSpawn-request>"
  (cl:let* ((signed (cl:slot-value msg 'turtleCount)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <TurtleSpawn-request>) istream)
  "Deserializes a message object of type '<TurtleSpawn-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'turtleCount) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<TurtleSpawn-request>)))
  "Returns string type for a service object of type '<TurtleSpawn-request>"
  "assignment1/TurtleSpawnRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'TurtleSpawn-request)))
  "Returns string type for a service object of type 'TurtleSpawn-request"
  "assignment1/TurtleSpawnRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<TurtleSpawn-request>)))
  "Returns md5sum for a message object of type '<TurtleSpawn-request>"
  "fe402387a08743623c9801322d19262d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'TurtleSpawn-request)))
  "Returns md5sum for a message object of type 'TurtleSpawn-request"
  "fe402387a08743623c9801322d19262d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<TurtleSpawn-request>)))
  "Returns full string definition for message of type '<TurtleSpawn-request>"
  (cl:format cl:nil "int32 turtleCount~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'TurtleSpawn-request)))
  "Returns full string definition for message of type 'TurtleSpawn-request"
  (cl:format cl:nil "int32 turtleCount~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <TurtleSpawn-request>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <TurtleSpawn-request>))
  "Converts a ROS message object to a list"
  (cl:list 'TurtleSpawn-request
    (cl:cons ':turtleCount (turtleCount msg))
))
;//! \htmlinclude TurtleSpawn-response.msg.html

(cl:defclass <TurtleSpawn-response> (roslisp-msg-protocol:ros-message)
  ((turtles
    :reader turtles
    :initarg :turtles
    :type (cl:vector cl:integer)
   :initform (cl:make-array 0 :element-type 'cl:integer :initial-element 0)))
)

(cl:defclass TurtleSpawn-response (<TurtleSpawn-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <TurtleSpawn-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'TurtleSpawn-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name assignment1-srv:<TurtleSpawn-response> is deprecated: use assignment1-srv:TurtleSpawn-response instead.")))

(cl:ensure-generic-function 'turtles-val :lambda-list '(m))
(cl:defmethod turtles-val ((m <TurtleSpawn-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader assignment1-srv:turtles-val is deprecated.  Use assignment1-srv:turtles instead.")
  (turtles m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <TurtleSpawn-response>) ostream)
  "Serializes a message object of type '<TurtleSpawn-response>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'turtles))))
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
   (cl:slot-value msg 'turtles))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <TurtleSpawn-response>) istream)
  "Deserializes a message object of type '<TurtleSpawn-response>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'turtles) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'turtles)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296)))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<TurtleSpawn-response>)))
  "Returns string type for a service object of type '<TurtleSpawn-response>"
  "assignment1/TurtleSpawnResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'TurtleSpawn-response)))
  "Returns string type for a service object of type 'TurtleSpawn-response"
  "assignment1/TurtleSpawnResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<TurtleSpawn-response>)))
  "Returns md5sum for a message object of type '<TurtleSpawn-response>"
  "fe402387a08743623c9801322d19262d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'TurtleSpawn-response)))
  "Returns md5sum for a message object of type 'TurtleSpawn-response"
  "fe402387a08743623c9801322d19262d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<TurtleSpawn-response>)))
  "Returns full string definition for message of type '<TurtleSpawn-response>"
  (cl:format cl:nil "int32[] turtles~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'TurtleSpawn-response)))
  "Returns full string definition for message of type 'TurtleSpawn-response"
  (cl:format cl:nil "int32[] turtles~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <TurtleSpawn-response>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'turtles) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <TurtleSpawn-response>))
  "Converts a ROS message object to a list"
  (cl:list 'TurtleSpawn-response
    (cl:cons ':turtles (turtles msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'TurtleSpawn)))
  'TurtleSpawn-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'TurtleSpawn)))
  'TurtleSpawn-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'TurtleSpawn)))
  "Returns string type for a service object of type '<TurtleSpawn>"
  "assignment1/TurtleSpawn")