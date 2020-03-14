;; Auto-generated. Do not edit!


(when (boundp 'assignment1::Tsp)
  (if (not (find-package "ASSIGNMENT1"))
    (make-package "ASSIGNMENT1"))
  (shadow 'Tsp (find-package "ASSIGNMENT1")))
(unless (find-package "ASSIGNMENT1::TSP")
  (make-package "ASSIGNMENT1::TSP"))
(unless (find-package "ASSIGNMENT1::TSPREQUEST")
  (make-package "ASSIGNMENT1::TSPREQUEST"))
(unless (find-package "ASSIGNMENT1::TSPRESPONSE")
  (make-package "ASSIGNMENT1::TSPRESPONSE"))

(in-package "ROS")





(defclass assignment1::TspRequest
  :super ros::object
  :slots (_turtles ))

(defmethod assignment1::TspRequest
  (:init
   (&key
    ((:turtles __turtles) "")
    )
   (send-super :init)
   (setq _turtles (string __turtles))
   self)
  (:turtles
   (&optional __turtles)
   (if __turtles (setq _turtles __turtles)) _turtles)
  (:serialization-length
   ()
   (+
    ;; string _turtles
    4 (length _turtles)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _turtles
       (write-long (length _turtles) s) (princ _turtles s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _turtles
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _turtles (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass assignment1::TspResponse
  :super ros::object
  :slots (_sequence ))

(defmethod assignment1::TspResponse
  (:init
   (&key
    ((:sequence __sequence) "")
    )
   (send-super :init)
   (setq _sequence (string __sequence))
   self)
  (:sequence
   (&optional __sequence)
   (if __sequence (setq _sequence __sequence)) _sequence)
  (:serialization-length
   ()
   (+
    ;; string _sequence
    4 (length _sequence)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _sequence
       (write-long (length _sequence) s) (princ _sequence s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _sequence
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _sequence (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass assignment1::Tsp
  :super ros::object
  :slots ())

(setf (get assignment1::Tsp :md5sum-) "cc44a8559cc239a440bb56303c3636a1")
(setf (get assignment1::Tsp :datatype-) "assignment1/Tsp")
(setf (get assignment1::Tsp :request) assignment1::TspRequest)
(setf (get assignment1::Tsp :response) assignment1::TspResponse)

(defmethod assignment1::TspRequest
  (:response () (instance assignment1::TspResponse :init)))

(setf (get assignment1::TspRequest :md5sum-) "cc44a8559cc239a440bb56303c3636a1")
(setf (get assignment1::TspRequest :datatype-) "assignment1/TspRequest")
(setf (get assignment1::TspRequest :definition-)
      "string turtles
---
string sequence
")

(setf (get assignment1::TspResponse :md5sum-) "cc44a8559cc239a440bb56303c3636a1")
(setf (get assignment1::TspResponse :datatype-) "assignment1/TspResponse")
(setf (get assignment1::TspResponse :definition-)
      "string turtles
---
string sequence
")



(provide :assignment1/Tsp "cc44a8559cc239a440bb56303c3636a1")


