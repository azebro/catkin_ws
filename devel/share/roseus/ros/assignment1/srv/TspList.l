;; Auto-generated. Do not edit!


(when (boundp 'assignment1::TspList)
  (if (not (find-package "ASSIGNMENT1"))
    (make-package "ASSIGNMENT1"))
  (shadow 'TspList (find-package "ASSIGNMENT1")))
(unless (find-package "ASSIGNMENT1::TSPLIST")
  (make-package "ASSIGNMENT1::TSPLIST"))
(unless (find-package "ASSIGNMENT1::TSPLISTREQUEST")
  (make-package "ASSIGNMENT1::TSPLISTREQUEST"))
(unless (find-package "ASSIGNMENT1::TSPLISTRESPONSE")
  (make-package "ASSIGNMENT1::TSPLISTRESPONSE"))

(in-package "ROS")





(defclass assignment1::TspListRequest
  :super ros::object
  :slots (_turtles ))

(defmethod assignment1::TspListRequest
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

(defclass assignment1::TspListResponse
  :super ros::object
  :slots (_sequence ))

(defmethod assignment1::TspListResponse
  (:init
   (&key
    ((:sequence __sequence) (make-array 0 :initial-element 0 :element-type :integer))
    )
   (send-super :init)
   (setq _sequence __sequence)
   self)
  (:sequence
   (&optional __sequence)
   (if __sequence (setq _sequence __sequence)) _sequence)
  (:serialization-length
   ()
   (+
    ;; int32[] _sequence
    (* 4    (length _sequence)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32[] _sequence
     (write-long (length _sequence) s)
     (dotimes (i (length _sequence))
       (write-long (elt _sequence i) s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32[] _sequence
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _sequence (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _sequence i) (sys::peek buf ptr- :integer)) (incf ptr- 4)
     ))
   ;;
   self)
  )

(defclass assignment1::TspList
  :super ros::object
  :slots ())

(setf (get assignment1::TspList :md5sum-) "479c0bc11d8910d2e80e7da4072f2c4a")
(setf (get assignment1::TspList :datatype-) "assignment1/TspList")
(setf (get assignment1::TspList :request) assignment1::TspListRequest)
(setf (get assignment1::TspList :response) assignment1::TspListResponse)

(defmethod assignment1::TspListRequest
  (:response () (instance assignment1::TspListResponse :init)))

(setf (get assignment1::TspListRequest :md5sum-) "479c0bc11d8910d2e80e7da4072f2c4a")
(setf (get assignment1::TspListRequest :datatype-) "assignment1/TspListRequest")
(setf (get assignment1::TspListRequest :definition-)
      "string turtles
---
int32[] sequence
")

(setf (get assignment1::TspListResponse :md5sum-) "479c0bc11d8910d2e80e7da4072f2c4a")
(setf (get assignment1::TspListResponse :datatype-) "assignment1/TspListResponse")
(setf (get assignment1::TspListResponse :definition-)
      "string turtles
---
int32[] sequence
")



(provide :assignment1/TspList "479c0bc11d8910d2e80e7da4072f2c4a")


