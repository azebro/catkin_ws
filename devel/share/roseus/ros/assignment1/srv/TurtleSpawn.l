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
  :slots (_turtleCount ))

(defmethod assignment1::TurtleSpawnRequest
  (:init
   (&key
    ((:turtleCount __turtleCount) 0)
    )
   (send-super :init)
   (setq _turtleCount (round __turtleCount))
   self)
  (:turtleCount
   (&optional __turtleCount)
   (if __turtleCount (setq _turtleCount __turtleCount)) _turtleCount)
  (:serialization-length
   ()
   (+
    ;; int32 _turtleCount
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _turtleCount
       (write-long _turtleCount s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _turtleCount
     (setq _turtleCount (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass assignment1::TurtleSpawnResponse
  :super ros::object
  :slots (_turtles ))

(defmethod assignment1::TurtleSpawnResponse
  (:init
   (&key
    ((:turtles __turtles) (make-array 0 :initial-element 0 :element-type :integer))
    )
   (send-super :init)
   (setq _turtles __turtles)
   self)
  (:turtles
   (&optional __turtles)
   (if __turtles (setq _turtles __turtles)) _turtles)
  (:serialization-length
   ()
   (+
    ;; int32[] _turtles
    (* 4    (length _turtles)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32[] _turtles
     (write-long (length _turtles) s)
     (dotimes (i (length _turtles))
       (write-long (elt _turtles i) s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32[] _turtles
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _turtles (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _turtles i) (sys::peek buf ptr- :integer)) (incf ptr- 4)
     ))
   ;;
   self)
  )

(defclass assignment1::TurtleSpawn
  :super ros::object
  :slots ())

(setf (get assignment1::TurtleSpawn :md5sum-) "fe402387a08743623c9801322d19262d")
(setf (get assignment1::TurtleSpawn :datatype-) "assignment1/TurtleSpawn")
(setf (get assignment1::TurtleSpawn :request) assignment1::TurtleSpawnRequest)
(setf (get assignment1::TurtleSpawn :response) assignment1::TurtleSpawnResponse)

(defmethod assignment1::TurtleSpawnRequest
  (:response () (instance assignment1::TurtleSpawnResponse :init)))

(setf (get assignment1::TurtleSpawnRequest :md5sum-) "fe402387a08743623c9801322d19262d")
(setf (get assignment1::TurtleSpawnRequest :datatype-) "assignment1/TurtleSpawnRequest")
(setf (get assignment1::TurtleSpawnRequest :definition-)
      "int32 turtleCount
---
int32[] turtles

")

(setf (get assignment1::TurtleSpawnResponse :md5sum-) "fe402387a08743623c9801322d19262d")
(setf (get assignment1::TurtleSpawnResponse :datatype-) "assignment1/TurtleSpawnResponse")
(setf (get assignment1::TurtleSpawnResponse :definition-)
      "int32 turtleCount
---
int32[] turtles

")



(provide :assignment1/TurtleSpawn "fe402387a08743623c9801322d19262d")


