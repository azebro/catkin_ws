;; Auto-generated. Do not edit!


(when (boundp 'assignment1::TurtleSpawn)
  (if (not (find-package "ASSIGNMENT1"))
    (make-package "ASSIGNMENT1"))
  (shadow 'TurtleSpawn (find-package "ASSIGNMENT1")))
(unless (find-package "ASSIGNMENT1::TURTLESPAWN")
  (make-package "ASSIGNMENT1::TURTLESPAWN"))
(unless (find-package "ASSIGNMENT1::TURTLESPAWNREQUEST")
  (make-package "ASSIGNMENT1::TURTLESPAWNREQUEST"))
(unless (find-package "ASSIGNMENT1::TURTLESPAWNRESPONSE")
  (make-package "ASSIGNMENT1::TURTLESPAWNRESPONSE"))

(in-package "ROS")





(defclass assignment1::TurtleSpawnRequest
  :super ros::object
  :slots (_name _x _y _theta _random ))

(defmethod assignment1::TurtleSpawnRequest
  (:init
   (&key
    ((:name __name) "")
    ((:x __x) 0.0)
    ((:y __y) 0.0)
    ((:theta __theta) 0.0)
    ((:random __random) nil)
    )
   (send-super :init)
   (setq _name (string __name))
   (setq _x (float __x))
   (setq _y (float __y))
   (setq _theta (float __theta))
   (setq _random __random)
   self)
  (:name
   (&optional __name)
   (if __name (setq _name __name)) _name)
  (:x
   (&optional __x)
   (if __x (setq _x __x)) _x)
  (:y
   (&optional __y)
   (if __y (setq _y __y)) _y)
  (:theta
   (&optional __theta)
   (if __theta (setq _theta __theta)) _theta)
  (:random
   (&optional __random)
   (if __random (setq _random __random)) _random)
  (:serialization-length
   ()
   (+
    ;; string _name
    4 (length _name)
    ;; float32 _x
    4
    ;; float32 _y
    4
    ;; float32 _theta
    4
    ;; bool _random
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _name
       (write-long (length _name) s) (princ _name s)
     ;; float32 _x
       (sys::poke _x (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _y
       (sys::poke _y (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _theta
       (sys::poke _theta (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; bool _random
       (if _random (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; float32 _x
     (setq _x (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _y
     (setq _y (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _theta
     (setq _theta (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; bool _random
     (setq _random (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass assignment1::TurtleSpawnResponse
  :super ros::object
  :slots (_x _y _theta _name ))

(defmethod assignment1::TurtleSpawnResponse
  (:init
   (&key
    ((:x __x) 0.0)
    ((:y __y) 0.0)
    ((:theta __theta) 0.0)
    ((:name __name) "")
    )
   (send-super :init)
   (setq _x (float __x))
   (setq _y (float __y))
   (setq _theta (float __theta))
   (setq _name (string __name))
   self)
  (:x
   (&optional __x)
   (if __x (setq _x __x)) _x)
  (:y
   (&optional __y)
   (if __y (setq _y __y)) _y)
  (:theta
   (&optional __theta)
   (if __theta (setq _theta __theta)) _theta)
  (:name
   (&optional __name)
   (if __name (setq _name __name)) _name)
  (:serialization-length
   ()
   (+
    ;; float32 _x
    4
    ;; float32 _y
    4
    ;; float32 _theta
    4
    ;; string _name
    4 (length _name)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _x
       (sys::poke _x (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _y
       (sys::poke _y (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _theta
       (sys::poke _theta (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; string _name
       (write-long (length _name) s) (princ _name s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _x
     (setq _x (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _y
     (setq _y (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _theta
     (setq _theta (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; string _name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass assignment1::TurtleSpawn
  :super ros::object
  :slots ())

(setf (get assignment1::TurtleSpawn :md5sum-) "46c7c113caf86168394082f3d95807e0")
(setf (get assignment1::TurtleSpawn :datatype-) "assignment1/TurtleSpawn")
(setf (get assignment1::TurtleSpawn :request) assignment1::TurtleSpawnRequest)
(setf (get assignment1::TurtleSpawn :response) assignment1::TurtleSpawnResponse)

(defmethod assignment1::TurtleSpawnRequest
  (:response () (instance assignment1::TurtleSpawnResponse :init)))

(setf (get assignment1::TurtleSpawnRequest :md5sum-) "46c7c113caf86168394082f3d95807e0")
(setf (get assignment1::TurtleSpawnRequest :datatype-) "assignment1/TurtleSpawnRequest")
(setf (get assignment1::TurtleSpawnRequest :definition-)
      "string name
float32 x
float32 y
float32 theta
bool random
---
float32 x
float32 y
float32 theta
string name

")

(setf (get assignment1::TurtleSpawnResponse :md5sum-) "46c7c113caf86168394082f3d95807e0")
(setf (get assignment1::TurtleSpawnResponse :datatype-) "assignment1/TurtleSpawnResponse")
(setf (get assignment1::TurtleSpawnResponse :definition-)
      "string name
float32 x
float32 y
float32 theta
bool random
---
float32 x
float32 y
float32 theta
string name

")



(provide :assignment1/TurtleSpawn "46c7c113caf86168394082f3d95807e0")


