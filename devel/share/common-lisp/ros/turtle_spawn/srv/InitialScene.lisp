; Auto-generated. Do not edit!


(cl:in-package turtle_spawn-srv)


;//! \htmlinclude InitialScene-request.msg.html

(cl:defclass <InitialScene-request> (roslisp-msg-protocol:ros-message)
  ((numberOfTSPTurtles
    :reader numberOfTSPTurtles
    :initarg :numberOfTSPTurtles
    :type cl:integer
    :initform 0))
)

(cl:defclass InitialScene-request (<InitialScene-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <InitialScene-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'InitialScene-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name turtle_spawn-srv:<InitialScene-request> is deprecated: use turtle_spawn-srv:InitialScene-request instead.")))

(cl:ensure-generic-function 'numberOfTSPTurtles-val :lambda-list '(m))
(cl:defmethod numberOfTSPTurtles-val ((m <InitialScene-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader turtle_spawn-srv:numberOfTSPTurtles-val is deprecated.  Use turtle_spawn-srv:numberOfTSPTurtles instead.")
  (numberOfTSPTurtles m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <InitialScene-request>) ostream)
  "Serializes a message object of type '<InitialScene-request>"
  (cl:let* ((signed (cl:slot-value msg 'numberOfTSPTurtles)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <InitialScene-request>) istream)
  "Deserializes a message object of type '<InitialScene-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'numberOfTSPTurtles) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<InitialScene-request>)))
  "Returns string type for a service object of type '<InitialScene-request>"
  "turtle_spawn/InitialSceneRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'InitialScene-request)))
  "Returns string type for a service object of type 'InitialScene-request"
  "turtle_spawn/InitialSceneRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<InitialScene-request>)))
  "Returns md5sum for a message object of type '<InitialScene-request>"
  "5d4fe416861dd7bf8618226c4384cb42")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'InitialScene-request)))
  "Returns md5sum for a message object of type 'InitialScene-request"
  "5d4fe416861dd7bf8618226c4384cb42")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<InitialScene-request>)))
  "Returns full string definition for message of type '<InitialScene-request>"
  (cl:format cl:nil "int32 numberOfTSPTurtles~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'InitialScene-request)))
  "Returns full string definition for message of type 'InitialScene-request"
  (cl:format cl:nil "int32 numberOfTSPTurtles~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <InitialScene-request>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <InitialScene-request>))
  "Converts a ROS message object to a list"
  (cl:list 'InitialScene-request
    (cl:cons ':numberOfTSPTurtles (numberOfTSPTurtles msg))
))
;//! \htmlinclude InitialScene-response.msg.html

(cl:defclass <InitialScene-response> (roslisp-msg-protocol:ros-message)
  ((tsp_turtles
    :reader tsp_turtles
    :initarg :tsp_turtles
    :type cl:string
    :initform "")
   (conveyor_turtle
    :reader conveyor_turtle
    :initarg :conveyor_turtle
    :type cl:string
    :initform "")
   (catch_turtle
    :reader catch_turtle
    :initarg :catch_turtle
    :type cl:string
    :initform ""))
)

(cl:defclass InitialScene-response (<InitialScene-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <InitialScene-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'InitialScene-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name turtle_spawn-srv:<InitialScene-response> is deprecated: use turtle_spawn-srv:InitialScene-response instead.")))

(cl:ensure-generic-function 'tsp_turtles-val :lambda-list '(m))
(cl:defmethod tsp_turtles-val ((m <InitialScene-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader turtle_spawn-srv:tsp_turtles-val is deprecated.  Use turtle_spawn-srv:tsp_turtles instead.")
  (tsp_turtles m))

(cl:ensure-generic-function 'conveyor_turtle-val :lambda-list '(m))
(cl:defmethod conveyor_turtle-val ((m <InitialScene-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader turtle_spawn-srv:conveyor_turtle-val is deprecated.  Use turtle_spawn-srv:conveyor_turtle instead.")
  (conveyor_turtle m))

(cl:ensure-generic-function 'catch_turtle-val :lambda-list '(m))
(cl:defmethod catch_turtle-val ((m <InitialScene-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader turtle_spawn-srv:catch_turtle-val is deprecated.  Use turtle_spawn-srv:catch_turtle instead.")
  (catch_turtle m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <InitialScene-response>) ostream)
  "Serializes a message object of type '<InitialScene-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'tsp_turtles))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'tsp_turtles))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'conveyor_turtle))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'conveyor_turtle))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'catch_turtle))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'catch_turtle))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <InitialScene-response>) istream)
  "Deserializes a message object of type '<InitialScene-response>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'tsp_turtles) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'tsp_turtles) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'conveyor_turtle) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'conveyor_turtle) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'catch_turtle) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'catch_turtle) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<InitialScene-response>)))
  "Returns string type for a service object of type '<InitialScene-response>"
  "turtle_spawn/InitialSceneResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'InitialScene-response)))
  "Returns string type for a service object of type 'InitialScene-response"
  "turtle_spawn/InitialSceneResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<InitialScene-response>)))
  "Returns md5sum for a message object of type '<InitialScene-response>"
  "5d4fe416861dd7bf8618226c4384cb42")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'InitialScene-response)))
  "Returns md5sum for a message object of type 'InitialScene-response"
  "5d4fe416861dd7bf8618226c4384cb42")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<InitialScene-response>)))
  "Returns full string definition for message of type '<InitialScene-response>"
  (cl:format cl:nil "string tsp_turtles~%string conveyor_turtle~%string catch_turtle~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'InitialScene-response)))
  "Returns full string definition for message of type 'InitialScene-response"
  (cl:format cl:nil "string tsp_turtles~%string conveyor_turtle~%string catch_turtle~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <InitialScene-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'tsp_turtles))
     4 (cl:length (cl:slot-value msg 'conveyor_turtle))
     4 (cl:length (cl:slot-value msg 'catch_turtle))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <InitialScene-response>))
  "Converts a ROS message object to a list"
  (cl:list 'InitialScene-response
    (cl:cons ':tsp_turtles (tsp_turtles msg))
    (cl:cons ':conveyor_turtle (conveyor_turtle msg))
    (cl:cons ':catch_turtle (catch_turtle msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'InitialScene)))
  'InitialScene-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'InitialScene)))
  'InitialScene-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'InitialScene)))
  "Returns string type for a service object of type '<InitialScene>"
  "turtle_spawn/InitialScene")