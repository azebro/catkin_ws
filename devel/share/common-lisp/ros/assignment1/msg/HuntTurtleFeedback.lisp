; Auto-generated. Do not edit!


(cl:in-package assignment1-msg)


;//! \htmlinclude HuntTurtleFeedback.msg.html

(cl:defclass <HuntTurtleFeedback> (roslisp-msg-protocol:ros-message)
  ((progressBar
    :reader progressBar
    :initarg :progressBar
    :type cl:string
    :initform "")
   (progress
    :reader progress
    :initarg :progress
    :type cl:float
    :initform 0.0)
   (timeRemaining
    :reader timeRemaining
    :initarg :timeRemaining
    :type cl:string
    :initform ""))
)

(cl:defclass HuntTurtleFeedback (<HuntTurtleFeedback>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <HuntTurtleFeedback>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'HuntTurtleFeedback)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name assignment1-msg:<HuntTurtleFeedback> is deprecated: use assignment1-msg:HuntTurtleFeedback instead.")))

(cl:ensure-generic-function 'progressBar-val :lambda-list '(m))
(cl:defmethod progressBar-val ((m <HuntTurtleFeedback>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader assignment1-msg:progressBar-val is deprecated.  Use assignment1-msg:progressBar instead.")
  (progressBar m))

(cl:ensure-generic-function 'progress-val :lambda-list '(m))
(cl:defmethod progress-val ((m <HuntTurtleFeedback>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader assignment1-msg:progress-val is deprecated.  Use assignment1-msg:progress instead.")
  (progress m))

(cl:ensure-generic-function 'timeRemaining-val :lambda-list '(m))
(cl:defmethod timeRemaining-val ((m <HuntTurtleFeedback>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader assignment1-msg:timeRemaining-val is deprecated.  Use assignment1-msg:timeRemaining instead.")
  (timeRemaining m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <HuntTurtleFeedback>) ostream)
  "Serializes a message object of type '<HuntTurtleFeedback>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'progressBar))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'progressBar))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'progress))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'timeRemaining))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'timeRemaining))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <HuntTurtleFeedback>) istream)
  "Deserializes a message object of type '<HuntTurtleFeedback>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'progressBar) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'progressBar) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'progress) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'timeRemaining) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'timeRemaining) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<HuntTurtleFeedback>)))
  "Returns string type for a message object of type '<HuntTurtleFeedback>"
  "assignment1/HuntTurtleFeedback")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'HuntTurtleFeedback)))
  "Returns string type for a message object of type 'HuntTurtleFeedback"
  "assignment1/HuntTurtleFeedback")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<HuntTurtleFeedback>)))
  "Returns md5sum for a message object of type '<HuntTurtleFeedback>"
  "ebd791a2e9bf1e98d90417c0e82beb3e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'HuntTurtleFeedback)))
  "Returns md5sum for a message object of type 'HuntTurtleFeedback"
  "ebd791a2e9bf1e98d90417c0e82beb3e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<HuntTurtleFeedback>)))
  "Returns full string definition for message of type '<HuntTurtleFeedback>"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%#feedback~%string progressBar~%float32 progress~%string timeRemaining~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'HuntTurtleFeedback)))
  "Returns full string definition for message of type 'HuntTurtleFeedback"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%#feedback~%string progressBar~%float32 progress~%string timeRemaining~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <HuntTurtleFeedback>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'progressBar))
     4
     4 (cl:length (cl:slot-value msg 'timeRemaining))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <HuntTurtleFeedback>))
  "Converts a ROS message object to a list"
  (cl:list 'HuntTurtleFeedback
    (cl:cons ':progressBar (progressBar msg))
    (cl:cons ':progress (progress msg))
    (cl:cons ':timeRemaining (timeRemaining msg))
))
