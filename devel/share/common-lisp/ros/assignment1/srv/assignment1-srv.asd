
(cl:in-package :asdf)

(defsystem "assignment1-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "TspList" :depends-on ("_package_TspList"))
    (:file "_package_TspList" :depends-on ("_package"))
    (:file "TurtleSpawn" :depends-on ("_package_TurtleSpawn"))
    (:file "_package_TurtleSpawn" :depends-on ("_package"))
  ))