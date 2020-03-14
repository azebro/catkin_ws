
(cl:in-package :asdf)

(defsystem "assignment1-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :actionlib_msgs-msg
               :std_msgs-msg
)
  :components ((:file "_package")
    (:file "StartAssignmentAction" :depends-on ("_package_StartAssignmentAction"))
    (:file "_package_StartAssignmentAction" :depends-on ("_package"))
    (:file "StartAssignmentActionFeedback" :depends-on ("_package_StartAssignmentActionFeedback"))
    (:file "_package_StartAssignmentActionFeedback" :depends-on ("_package"))
    (:file "StartAssignmentActionGoal" :depends-on ("_package_StartAssignmentActionGoal"))
    (:file "_package_StartAssignmentActionGoal" :depends-on ("_package"))
    (:file "StartAssignmentActionResult" :depends-on ("_package_StartAssignmentActionResult"))
    (:file "_package_StartAssignmentActionResult" :depends-on ("_package"))
    (:file "StartAssignmentFeedback" :depends-on ("_package_StartAssignmentFeedback"))
    (:file "_package_StartAssignmentFeedback" :depends-on ("_package"))
    (:file "StartAssignmentGoal" :depends-on ("_package_StartAssignmentGoal"))
    (:file "_package_StartAssignmentGoal" :depends-on ("_package"))
    (:file "StartAssignmentResult" :depends-on ("_package_StartAssignmentResult"))
    (:file "_package_StartAssignmentResult" :depends-on ("_package"))
  ))