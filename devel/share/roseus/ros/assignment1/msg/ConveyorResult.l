;; Auto-generated. Do not edit!


(when (boundp 'assignment1::ConveyorResult)
  (if (not (find-package "ASSIGNMENT1"))
    (make-package "ASSIGNMENT1"))
  (shadow 'ConveyorResult (find-package "ASSIGNMENT1")))
(unless (find-package "ASSIGNMENT1::CONVEYORRESULT")
  (make-package "ASSIGNMENT1::CONVEYORRESULT"))

(in-package "ROS")
;;//! \htmlinclude ConveyorResult.msg.html


(defclass assignment1::ConveyorResult
  :super ros::object
  :slots (_message ))

(defmethod assignment1::ConveyorResult
  (:init
   (&key
    ((:message __message) "")
    )
   (send-super :init)
   (setq _message (string __message))
   self)
  (:message
   (&optional __message)
   (if __message (setq _message __message)) _message)
  (:serialization-length
   ()
   (+
    ;; string _message
    4 (length _message)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _message
       (write-long (length _message) s) (princ _message s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _message
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _message (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get assignment1::ConveyorResult :md5sum-) "5f003d6bcc824cbd51361d66d8e4f76c")
(setf (get assignment1::ConveyorResult :datatype-) "assignment1/ConveyorResult")
(setf (get assignment1::ConveyorResult :definition-)
      "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======
string message

")



(provide :assignment1/ConveyorResult "5f003d6bcc824cbd51361d66d8e4f76c")


