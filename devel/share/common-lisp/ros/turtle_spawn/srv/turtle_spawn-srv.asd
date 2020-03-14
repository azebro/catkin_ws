
(cl:in-package :asdf)

(defsystem "turtle_spawn-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "InitialScene" :depends-on ("_package_InitialScene"))
    (:file "_package_InitialScene" :depends-on ("_package"))
  ))