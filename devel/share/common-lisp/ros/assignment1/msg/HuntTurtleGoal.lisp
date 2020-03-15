; Auto-generated. Do not edit!


(cl:in-package assignment1-msg)


;//! \htmlinclude HuntTurtleGoal.msg.html

(cl:defclass <HuntTurtleGoal> (roslisp-msg-protocol:ros-message)
  ((hunterX
    :reader hunterX
    :initarg :hunterX
    :type cl:float
    :initform 0.0)
   (hunterY
    :reader hunterY
    :initarg :hunterY
    :type cl:float
    :initform 0.0)
   (hunterTheta
    :reader hunterTheta
    :initarg :hunterTheta
    :type cl:float
    :initform 0.0)
   (hunterName
    :reader hunterName
    :initarg :hunterName
    :type cl:string
    :initform "")
   (targetX
    :reader targetX
    :initarg :targetX
    :type cl:float
    :initform 0.0)
   (targetY
    :reader targetY
    :initarg :targetY
    :type cl:float
    :initform 0.0)
   (targetTheta
    :reader targetTheta
    :initarg :targetTheta
    :type cl:float
    :initform 0.0)
   (targetName
    :reader targetName
    :initarg :targetName
    :type cl:string
    :initform "")
   (targetId
    :reader targetId
    :initarg :targetId
    :type cl:integer
    :initform 0)
   (kill
    :reader kill
    :initarg :kill
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass HuntTurtleGoal (<HuntTurtleGoal>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <HuntTurtleGoal>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'HuntTurtleGoal)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name assignment1-msg:<HuntTurtleGoal> is deprecated: use assignment1-msg:HuntTurtleGoal instead.")))

(cl:ensure-generic-function 'hunterX-val :lambda-list '(m))
(cl:defmethod hunterX-val ((m <HuntTurtleGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader assignment1-msg:hunterX-val is deprecated.  Use assignment1-msg:hunterX instead.")
  (hunterX m))

(cl:ensure-generic-function 'hunterY-val :lambda-list '(m))
(cl:defmethod hunterY-val ((m <HuntTurtleGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader assignment1-msg:hunterY-val is deprecated.  Use assignment1-msg:hunterY instead.")
  (hunterY m))

(cl:ensure-generic-function 'hunterTheta-val :lambda-list '(m))
(cl:defmethod hunterTheta-val ((m <HuntTurtleGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader assignment1-msg:hunterTheta-val is deprecated.  Use assignment1-msg:hunterTheta instead.")
  (hunterTheta m))

(cl:ensure-generic-function 'hunterName-val :lambda-list '(m))
(cl:defmethod hunterName-val ((m <HuntTurtleGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader assignment1-msg:hunterName-val is deprecated.  Use assignment1-msg:hunterName instead.")
  (hunterName m))

(cl:ensure-generic-function 'targetX-val :lambda-list '(m))
(cl:defmethod targetX-val ((m <HuntTurtleGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader assignment1-msg:targetX-val is deprecated.  Use assignment1-msg:targetX instead.")
  (targetX m))

(cl:ensure-generic-function 'targetY-val :lambda-list '(m))
(cl:defmethod targetY-val ((m <HuntTurtleGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader assignment1-msg:targetY-val is deprecated.  Use assignment1-msg:targetY instead.")
  (targetY m))

(cl:ensure-generic-function 'targetTheta-val :lambda-list '(m))
(cl:defmethod targetTheta-val ((m <HuntTurtleGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader assignment1-msg:targetTheta-val is deprecated.  Use assignment1-msg:targetTheta instead.")
  (targetTheta m))

(cl:ensure-generic-function 'targetName-val :lambda-list '(m))
(cl:defmethod targetName-val ((m <HuntTurtleGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader assignment1-msg:targetName-val is deprecated.  Use assignment1-msg:targetName instead.")
  (targetName m))

(cl:ensure-generic-function 'targetId-val :lambda-list '(m))
(cl:defmethod targetId-val ((m <HuntTurtleGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader assignment1-msg:targetId-val is deprecated.  Use assignment1-msg:targetId instead.")
  (targetId m))

(cl:ensure-generic-function 'kill-val :lambda-list '(m))
(cl:defmethod kill-val ((m <HuntTurtleGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader assignment1-msg:kill-val is deprecated.  Use assignment1-msg:kill instead.")
  (kill m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <HuntTurtleGoal>) ostream)
  "Serializes a message object of type '<HuntTurtleGoal>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'hunterX))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'hunterY))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'hunterTheta))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'hunterName))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'hunterName))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'targetX))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'targetY))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'targetTheta))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'targetName))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'targetName))
  (cl:let* ((signed (cl:slot-value msg 'targetId)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'kill) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <HuntTurtleGoal>) istream)
  "Deserializes a message object of type '<HuntTurtleGoal>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'hunterX) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'hunterY) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'hunterTheta) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'hunterName) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'hunterName) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'targetX) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'targetY) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'targetTheta) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'targetName) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'targetName) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'targetId) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:setf (cl:slot-value msg 'kill) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<HuntTurtleGoal>)))
  "Returns string type for a message object of type '<HuntTurtleGoal>"
  "assignment1/HuntTurtleGoal")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'HuntTurtleGoal)))
  "Returns string type for a message object of type 'HuntTurtleGoal"
  "assignment1/HuntTurtleGoal")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<HuntTurtleGoal>)))
  "Returns md5sum for a message object of type '<HuntTurtleGoal>"
  "6b95b9c5d2dc338d096d1572fe3309d0")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'HuntTurtleGoal)))
  "Returns md5sum for a message object of type 'HuntTurtleGoal"
  "6b95b9c5d2dc338d096d1572fe3309d0")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<HuntTurtleGoal>)))
  "Returns full string definition for message of type '<HuntTurtleGoal>"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%#goal definition~%float32 hunterX~%float32 hunterY~%float32 hunterTheta~%string hunterName~%float32 targetX~%float32 targetY~%float32 targetTheta~%string targetName~%int32 targetId~%bool kill~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'HuntTurtleGoal)))
  "Returns full string definition for message of type 'HuntTurtleGoal"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%#goal definition~%float32 hunterX~%float32 hunterY~%float32 hunterTheta~%string hunterName~%float32 targetX~%float32 targetY~%float32 targetTheta~%string targetName~%int32 targetId~%bool kill~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <HuntTurtleGoal>))
  (cl:+ 0
     4
     4
     4
     4 (cl:length (cl:slot-value msg 'hunterName))
     4
     4
     4
     4 (cl:length (cl:slot-value msg 'targetName))
     4
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <HuntTurtleGoal>))
  "Converts a ROS message object to a list"
  (cl:list 'HuntTurtleGoal
    (cl:cons ':hunterX (hunterX msg))
    (cl:cons ':hunterY (hunterY msg))
    (cl:cons ':hunterTheta (hunterTheta msg))
    (cl:cons ':hunterName (hunterName msg))
    (cl:cons ':targetX (targetX msg))
    (cl:cons ':targetY (targetY msg))
    (cl:cons ':targetTheta (targetTheta msg))
    (cl:cons ':targetName (targetName msg))
    (cl:cons ':targetId (targetId msg))
    (cl:cons ':kill (kill msg))
))
