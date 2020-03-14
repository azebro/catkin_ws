; Auto-generated. Do not edit!


(cl:in-package assignment1-srv)


;//! \htmlinclude Tsp-request.msg.html

(cl:defclass <Tsp-request> (roslisp-msg-protocol:ros-message)
  ((turtles
    :reader turtles
    :initarg :turtles
    :type cl:string
    :initform ""))
)

(cl:defclass Tsp-request (<Tsp-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Tsp-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Tsp-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name assignment1-srv:<Tsp-request> is deprecated: use assignment1-srv:Tsp-request instead.")))

(cl:ensure-generic-function 'turtles-val :lambda-list '(m))
(cl:defmethod turtles-val ((m <Tsp-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader assignment1-srv:turtles-val is deprecated.  Use assignment1-srv:turtles instead.")
  (turtles m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Tsp-request>) ostream)
  "Serializes a message object of type '<Tsp-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'turtles))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'turtles))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Tsp-request>) istream)
  "Deserializes a message object of type '<Tsp-request>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Tsp-request>)))
  "Returns string type for a service object of type '<Tsp-request>"
  "assignment1/TspRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Tsp-request)))
  "Returns string type for a service object of type 'Tsp-request"
  "assignment1/TspRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Tsp-request>)))
  "Returns md5sum for a message object of type '<Tsp-request>"
  "cc44a8559cc239a440bb56303c3636a1")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Tsp-request)))
  "Returns md5sum for a message object of type 'Tsp-request"
  "cc44a8559cc239a440bb56303c3636a1")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Tsp-request>)))
  "Returns full string definition for message of type '<Tsp-request>"
  (cl:format cl:nil "string turtles~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Tsp-request)))
  "Returns full string definition for message of type 'Tsp-request"
  (cl:format cl:nil "string turtles~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Tsp-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'turtles))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Tsp-request>))
  "Converts a ROS message object to a list"
  (cl:list 'Tsp-request
    (cl:cons ':turtles (turtles msg))
))
;//! \htmlinclude Tsp-response.msg.html

(cl:defclass <Tsp-response> (roslisp-msg-protocol:ros-message)
  ((sequence
    :reader sequence
    :initarg :sequence
    :type cl:string
    :initform ""))
)

(cl:defclass Tsp-response (<Tsp-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Tsp-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Tsp-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name assignment1-srv:<Tsp-response> is deprecated: use assignment1-srv:Tsp-response instead.")))

(cl:ensure-generic-function 'sequence-val :lambda-list '(m))
(cl:defmethod sequence-val ((m <Tsp-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader assignment1-srv:sequence-val is deprecated.  Use assignment1-srv:sequence instead.")
  (sequence m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Tsp-response>) ostream)
  "Serializes a message object of type '<Tsp-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'sequence))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'sequence))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Tsp-response>) istream)
  "Deserializes a message object of type '<Tsp-response>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'sequence) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'sequence) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Tsp-response>)))
  "Returns string type for a service object of type '<Tsp-response>"
  "assignment1/TspResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Tsp-response)))
  "Returns string type for a service object of type 'Tsp-response"
  "assignment1/TspResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Tsp-response>)))
  "Returns md5sum for a message object of type '<Tsp-response>"
  "cc44a8559cc239a440bb56303c3636a1")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Tsp-response)))
  "Returns md5sum for a message object of type 'Tsp-response"
  "cc44a8559cc239a440bb56303c3636a1")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Tsp-response>)))
  "Returns full string definition for message of type '<Tsp-response>"
  (cl:format cl:nil "string sequence~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Tsp-response)))
  "Returns full string definition for message of type 'Tsp-response"
  (cl:format cl:nil "string sequence~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Tsp-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'sequence))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Tsp-response>))
  "Converts a ROS message object to a list"
  (cl:list 'Tsp-response
    (cl:cons ':sequence (sequence msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'Tsp)))
  'Tsp-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'Tsp)))
  'Tsp-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Tsp)))
  "Returns string type for a service object of type '<Tsp>"
  "assignment1/Tsp")