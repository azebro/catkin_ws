; Auto-generated. Do not edit!


(cl:in-package assignment1-srv)


;//! \htmlinclude TurtleSpawn-request.msg.html

(cl:defclass <TurtleSpawn-request> (roslisp-msg-protocol:ros-message)
  ((name
    :reader name
    :initarg :name
    :type cl:string
    :initform "")
   (x
    :reader x
    :initarg :x
    :type cl:float
    :initform 0.0)
   (y
    :reader y
    :initarg :y
    :type cl:float
    :initform 0.0)
   (theta
    :reader theta
    :initarg :theta
    :type cl:float
    :initform 0.0)
   (random
    :reader random
    :initarg :random
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass TurtleSpawn-request (<TurtleSpawn-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <TurtleSpawn-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'TurtleSpawn-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name assignment1-srv:<TurtleSpawn-request> is deprecated: use assignment1-srv:TurtleSpawn-request instead.")))

(cl:ensure-generic-function 'name-val :lambda-list '(m))
(cl:defmethod name-val ((m <TurtleSpawn-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader assignment1-srv:name-val is deprecated.  Use assignment1-srv:name instead.")
  (name m))

(cl:ensure-generic-function 'x-val :lambda-list '(m))
(cl:defmethod x-val ((m <TurtleSpawn-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader assignment1-srv:x-val is deprecated.  Use assignment1-srv:x instead.")
  (x m))

(cl:ensure-generic-function 'y-val :lambda-list '(m))
(cl:defmethod y-val ((m <TurtleSpawn-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader assignment1-srv:y-val is deprecated.  Use assignment1-srv:y instead.")
  (y m))

(cl:ensure-generic-function 'theta-val :lambda-list '(m))
(cl:defmethod theta-val ((m <TurtleSpawn-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader assignment1-srv:theta-val is deprecated.  Use assignment1-srv:theta instead.")
  (theta m))

(cl:ensure-generic-function 'random-val :lambda-list '(m))
(cl:defmethod random-val ((m <TurtleSpawn-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader assignment1-srv:random-val is deprecated.  Use assignment1-srv:random instead.")
  (random m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <TurtleSpawn-request>) ostream)
  "Serializes a message object of type '<TurtleSpawn-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'name))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'theta))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'random) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <TurtleSpawn-request>) istream)
  "Deserializes a message object of type '<TurtleSpawn-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'x) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'y) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'theta) (roslisp-utils:decode-single-float-bits bits)))
    (cl:setf (cl:slot-value msg 'random) (cl:not (cl:zerop (cl:read-byte istream))))
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
  "46c7c113caf86168394082f3d95807e0")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'TurtleSpawn-request)))
  "Returns md5sum for a message object of type 'TurtleSpawn-request"
  "46c7c113caf86168394082f3d95807e0")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<TurtleSpawn-request>)))
  "Returns full string definition for message of type '<TurtleSpawn-request>"
  (cl:format cl:nil "string name~%float32 x~%float32 y~%float32 theta~%bool random~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'TurtleSpawn-request)))
  "Returns full string definition for message of type 'TurtleSpawn-request"
  (cl:format cl:nil "string name~%float32 x~%float32 y~%float32 theta~%bool random~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <TurtleSpawn-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'name))
     4
     4
     4
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <TurtleSpawn-request>))
  "Converts a ROS message object to a list"
  (cl:list 'TurtleSpawn-request
    (cl:cons ':name (name msg))
    (cl:cons ':x (x msg))
    (cl:cons ':y (y msg))
    (cl:cons ':theta (theta msg))
    (cl:cons ':random (random msg))
))
;//! \htmlinclude TurtleSpawn-response.msg.html

(cl:defclass <TurtleSpawn-response> (roslisp-msg-protocol:ros-message)
  ((x
    :reader x
    :initarg :x
    :type cl:float
    :initform 0.0)
   (y
    :reader y
    :initarg :y
    :type cl:float
    :initform 0.0)
   (theta
    :reader theta
    :initarg :theta
    :type cl:float
    :initform 0.0)
   (name
    :reader name
    :initarg :name
    :type cl:string
    :initform ""))
)

(cl:defclass TurtleSpawn-response (<TurtleSpawn-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <TurtleSpawn-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'TurtleSpawn-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name assignment1-srv:<TurtleSpawn-response> is deprecated: use assignment1-srv:TurtleSpawn-response instead.")))

(cl:ensure-generic-function 'x-val :lambda-list '(m))
(cl:defmethod x-val ((m <TurtleSpawn-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader assignment1-srv:x-val is deprecated.  Use assignment1-srv:x instead.")
  (x m))

(cl:ensure-generic-function 'y-val :lambda-list '(m))
(cl:defmethod y-val ((m <TurtleSpawn-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader assignment1-srv:y-val is deprecated.  Use assignment1-srv:y instead.")
  (y m))

(cl:ensure-generic-function 'theta-val :lambda-list '(m))
(cl:defmethod theta-val ((m <TurtleSpawn-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader assignment1-srv:theta-val is deprecated.  Use assignment1-srv:theta instead.")
  (theta m))

(cl:ensure-generic-function 'name-val :lambda-list '(m))
(cl:defmethod name-val ((m <TurtleSpawn-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader assignment1-srv:name-val is deprecated.  Use assignment1-srv:name instead.")
  (name m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <TurtleSpawn-response>) ostream)
  "Serializes a message object of type '<TurtleSpawn-response>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'theta))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'name))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <TurtleSpawn-response>) istream)
  "Deserializes a message object of type '<TurtleSpawn-response>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'x) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'y) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'theta) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
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
  "46c7c113caf86168394082f3d95807e0")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'TurtleSpawn-response)))
  "Returns md5sum for a message object of type 'TurtleSpawn-response"
  "46c7c113caf86168394082f3d95807e0")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<TurtleSpawn-response>)))
  "Returns full string definition for message of type '<TurtleSpawn-response>"
  (cl:format cl:nil "float32 x~%float32 y~%float32 theta~%string name~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'TurtleSpawn-response)))
  "Returns full string definition for message of type 'TurtleSpawn-response"
  (cl:format cl:nil "float32 x~%float32 y~%float32 theta~%string name~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <TurtleSpawn-response>))
  (cl:+ 0
     4
     4
     4
     4 (cl:length (cl:slot-value msg 'name))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <TurtleSpawn-response>))
  "Converts a ROS message object to a list"
  (cl:list 'TurtleSpawn-response
    (cl:cons ':x (x msg))
    (cl:cons ':y (y msg))
    (cl:cons ':theta (theta msg))
    (cl:cons ':name (name msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'TurtleSpawn)))
  'TurtleSpawn-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'TurtleSpawn)))
  'TurtleSpawn-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'TurtleSpawn)))
  "Returns string type for a service object of type '<TurtleSpawn>"
  "assignment1/TurtleSpawn")