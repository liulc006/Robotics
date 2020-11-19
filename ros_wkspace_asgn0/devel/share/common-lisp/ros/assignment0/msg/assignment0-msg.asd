
(cl:in-package :asdf)

(defsystem "assignment0-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "TwoInt" :depends-on ("_package_TwoInt"))
    (:file "_package_TwoInt" :depends-on ("_package"))
  ))