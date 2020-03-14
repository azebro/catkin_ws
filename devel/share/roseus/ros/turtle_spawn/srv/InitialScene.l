;; Auto-generated. Do not edit!


(when (boundp 'turtle_spawn::InitialScene)
  (if (not (find-package "TURTLE_SPAWN"))
    (make-package "TURTLE_SPAWN"))
  (shadow 'InitialScene (find-package "TURTLE_SPAWN")))
(unless (find-package "TURTLE_SPAWN::INITIALSCENE")
  (make-package "TURTLE_SPAWN::INITIALSCENE"))
(unless (find-package "TURTLE_SPAWN::INITIALSCENEREQUEST")
  (make-package "TURTLE_SPAWN::INITIALSCENEREQUEST"))
(unless (find-package "TURTLE_SPAWN::INITIALSCENERESPONSE")
  (make-package "TURTLE_SPAWN::INITIALSCENERESPONSE"))

(in-package "ROS")





(defclass turtle_spawn::InitialSceneRequest
  :super ros::object
  :slots (_numberOfTSPTurtles ))

(defmethod turtle_spawn::InitialSceneRequest
  (:init
   (&key
    ((:numberOfTSPTurtles __numberOfTSPTurtles) 0)
    )
   (send-super :init)
   (setq _numberOfTSPTurtles (round __numberOfTSPTurtles))
   self)
  (:numberOfTSPTurtles
   (&optional __numberOfTSPTurtles)
   (if __numberOfTSPTurtles (setq _numberOfTSPTurtles __numberOfTSPTurtles)) _numberOfTSPTurtles)
  (:serialization-length
   ()
   (+
    ;; int32 _numberOfTSPTurtles
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _numberOfTSPTurtles
       (write-long _numberOfTSPTurtles s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _numberOfTSPTurtles
     (setq _numberOfTSPTurtles (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass turtle_spawn::InitialSceneResponse
  :super ros::object
  :slots (_tsp_turtles _conveyor_turtle _catch_turtle ))

(defmethod turtle_spawn::InitialSceneResponse
  (:init
   (&key
    ((:tsp_turtles __tsp_turtles) "")
    ((:conveyor_turtle __conveyor_turtle) "")
    ((:catch_turtle __catch_turtle) "")
    )
   (send-super :init)
   (setq _tsp_turtles (string __tsp_turtles))
   (setq _conveyor_turtle (string __conveyor_turtle))
   (setq _catch_turtle (string __catch_turtle))
   self)
  (:tsp_turtles
   (&optional __tsp_turtles)
   (if __tsp_turtles (setq _tsp_turtles __tsp_turtles)) _tsp_turtles)
  (:conveyor_turtle
   (&optional __conveyor_turtle)
   (if __conveyor_turtle (setq _conveyor_turtle __conveyor_turtle)) _conveyor_turtle)
  (:catch_turtle
   (&optional __catch_turtle)
   (if __catch_turtle (setq _catch_turtle __catch_turtle)) _catch_turtle)
  (:serialization-length
   ()
   (+
    ;; string _tsp_turtles
    4 (length _tsp_turtles)
    ;; string _conveyor_turtle
    4 (length _conveyor_turtle)
    ;; string _catch_turtle
    4 (length _catch_turtle)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _tsp_turtles
       (write-long (length _tsp_turtles) s) (princ _tsp_turtles s)
     ;; string _conveyor_turtle
       (write-long (length _conveyor_turtle) s) (princ _conveyor_turtle s)
     ;; string _catch_turtle
       (write-long (length _catch_turtle) s) (princ _catch_turtle s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _tsp_turtles
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _tsp_turtles (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _conveyor_turtle
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _conveyor_turtle (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _catch_turtle
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _catch_turtle (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass turtle_spawn::InitialScene
  :super ros::object
  :slots ())

(setf (get turtle_spawn::InitialScene :md5sum-) "5d4fe416861dd7bf8618226c4384cb42")
(setf (get turtle_spawn::InitialScene :datatype-) "turtle_spawn/InitialScene")
(setf (get turtle_spawn::InitialScene :request) turtle_spawn::InitialSceneRequest)
(setf (get turtle_spawn::InitialScene :response) turtle_spawn::InitialSceneResponse)

(defmethod turtle_spawn::InitialSceneRequest
  (:response () (instance turtle_spawn::InitialSceneResponse :init)))

(setf (get turtle_spawn::InitialSceneRequest :md5sum-) "5d4fe416861dd7bf8618226c4384cb42")
(setf (get turtle_spawn::InitialSceneRequest :datatype-) "turtle_spawn/InitialSceneRequest")
(setf (get turtle_spawn::InitialSceneRequest :definition-)
      "int32 numberOfTSPTurtles
---
string tsp_turtles
string conveyor_turtle
string catch_turtle
")

(setf (get turtle_spawn::InitialSceneResponse :md5sum-) "5d4fe416861dd7bf8618226c4384cb42")
(setf (get turtle_spawn::InitialSceneResponse :datatype-) "turtle_spawn/InitialSceneResponse")
(setf (get turtle_spawn::InitialSceneResponse :definition-)
      "int32 numberOfTSPTurtles
---
string tsp_turtles
string conveyor_turtle
string catch_turtle
")



(provide :turtle_spawn/InitialScene "5d4fe416861dd7bf8618226c4384cb42")


