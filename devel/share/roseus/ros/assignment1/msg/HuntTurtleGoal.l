;; Auto-generated. Do not edit!


(when (boundp 'assignment1::HuntTurtleGoal)
  (if (not (find-package "ASSIGNMENT1"))
    (make-package "ASSIGNMENT1"))
  (shadow 'HuntTurtleGoal (find-package "ASSIGNMENT1")))
(unless (find-package "ASSIGNMENT1::HUNTTURTLEGOAL")
  (make-package "ASSIGNMENT1::HUNTTURTLEGOAL"))

(in-package "ROS")
;;//! \htmlinclude HuntTurtleGoal.msg.html


(defclass assignment1::HuntTurtleGoal
  :super ros::object
  :slots (_hunterX _hunterY _hunterTheta _hunterName _targetX _targetY _targetTheta _targetName _targetId ))

(defmethod assignment1::HuntTurtleGoal
  (:init
   (&key
    ((:hunterX __hunterX) 0.0)
    ((:hunterY __hunterY) 0.0)
    ((:hunterTheta __hunterTheta) 0.0)
    ((:hunterName __hunterName) "")
    ((:targetX __targetX) 0.0)
    ((:targetY __targetY) 0.0)
    ((:targetTheta __targetTheta) 0.0)
    ((:targetName __targetName) "")
    ((:targetId __targetId) 0)
    )
   (send-super :init)
   (setq _hunterX (float __hunterX))
   (setq _hunterY (float __hunterY))
   (setq _hunterTheta (float __hunterTheta))
   (setq _hunterName (string __hunterName))
   (setq _targetX (float __targetX))
   (setq _targetY (float __targetY))
   (setq _targetTheta (float __targetTheta))
   (setq _targetName (string __targetName))
   (setq _targetId (round __targetId))
   self)
  (:hunterX
   (&optional __hunterX)
   (if __hunterX (setq _hunterX __hunterX)) _hunterX)
  (:hunterY
   (&optional __hunterY)
   (if __hunterY (setq _hunterY __hunterY)) _hunterY)
  (:hunterTheta
   (&optional __hunterTheta)
   (if __hunterTheta (setq _hunterTheta __hunterTheta)) _hunterTheta)
  (:hunterName
   (&optional __hunterName)
   (if __hunterName (setq _hunterName __hunterName)) _hunterName)
  (:targetX
   (&optional __targetX)
   (if __targetX (setq _targetX __targetX)) _targetX)
  (:targetY
   (&optional __targetY)
   (if __targetY (setq _targetY __targetY)) _targetY)
  (:targetTheta
   (&optional __targetTheta)
   (if __targetTheta (setq _targetTheta __targetTheta)) _targetTheta)
  (:targetName
   (&optional __targetName)
   (if __targetName (setq _targetName __targetName)) _targetName)
  (:targetId
   (&optional __targetId)
   (if __targetId (setq _targetId __targetId)) _targetId)
  (:serialization-length
   ()
   (+
    ;; float32 _hunterX
    4
    ;; float32 _hunterY
    4
    ;; float32 _hunterTheta
    4
    ;; string _hunterName
    4 (length _hunterName)
    ;; float32 _targetX
    4
    ;; float32 _targetY
    4
    ;; float32 _targetTheta
    4
    ;; string _targetName
    4 (length _targetName)
    ;; int32 _targetId
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _hunterX
       (sys::poke _hunterX (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _hunterY
       (sys::poke _hunterY (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _hunterTheta
       (sys::poke _hunterTheta (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; string _hunterName
       (write-long (length _hunterName) s) (princ _hunterName s)
     ;; float32 _targetX
       (sys::poke _targetX (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _targetY
       (sys::poke _targetY (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _targetTheta
       (sys::poke _targetTheta (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; string _targetName
       (write-long (length _targetName) s) (princ _targetName s)
     ;; int32 _targetId
       (write-long _targetId s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _hunterX
     (setq _hunterX (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _hunterY
     (setq _hunterY (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _hunterTheta
     (setq _hunterTheta (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; string _hunterName
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _hunterName (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; float32 _targetX
     (setq _targetX (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _targetY
     (setq _targetY (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _targetTheta
     (setq _targetTheta (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; string _targetName
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _targetName (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; int32 _targetId
     (setq _targetId (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get assignment1::HuntTurtleGoal :md5sum-) "0cb907047e6d468ef1ec1e0d0f7d469d")
(setf (get assignment1::HuntTurtleGoal :datatype-) "assignment1/HuntTurtleGoal")
(setf (get assignment1::HuntTurtleGoal :definition-)
      "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======
#goal definition
float32 hunterX
float32 hunterY
float32 hunterTheta
string hunterName
float32 targetX
float32 targetY
float32 targetTheta
string targetName
int32 targetId

")



(provide :assignment1/HuntTurtleGoal "0cb907047e6d468ef1ec1e0d0f7d469d")


