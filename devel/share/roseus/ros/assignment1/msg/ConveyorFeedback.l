;; Auto-generated. Do not edit!


(when (boundp 'assignment1::ConveyorFeedback)
  (if (not (find-package "ASSIGNMENT1"))
    (make-package "ASSIGNMENT1"))
  (shadow 'ConveyorFeedback (find-package "ASSIGNMENT1")))
(unless (find-package "ASSIGNMENT1::CONVEYORFEEDBACK")
  (make-package "ASSIGNMENT1::CONVEYORFEEDBACK"))

(in-package "ROS")
;;//! \htmlinclude ConveyorFeedback.msg.html


(defclass assignment1::ConveyorFeedback
  :super ros::object
  :slots (_result ))

(defmethod assignment1::ConveyorFeedback
  (:init
   (&key
    ((:result __result) "")
    )
   (send-super :init)
   (setq _result (string __result))
   self)
  (:result
   (&optional __result)
   (if __result (setq _result __result)) _result)
  (:serialization-length
   ()
   (+
    ;; string _result
    4 (length _result)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _result
       (write-long (length _result) s) (princ _result s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _result
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _result (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get assignment1::ConveyorFeedback :md5sum-) "c22f2a1ed8654a0b365f1bb3f7ff2c0f")
(setf (get assignment1::ConveyorFeedback :datatype-) "assignment1/ConveyorFeedback")
(setf (get assignment1::ConveyorFeedback :definition-)
      "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======
string result

")



(provide :assignment1/ConveyorFeedback "c22f2a1ed8654a0b365f1bb3f7ff2c0f")

