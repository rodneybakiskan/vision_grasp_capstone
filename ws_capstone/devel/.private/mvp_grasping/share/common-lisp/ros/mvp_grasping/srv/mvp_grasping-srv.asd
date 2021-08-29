
(cl:in-package :asdf)

(defsystem "mvp_grasping-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
               :mvp_grasping-msg
)
  :components ((:file "_package")
    (:file "AddFailurePoint" :depends-on ("_package_AddFailurePoint"))
    (:file "_package_AddFailurePoint" :depends-on ("_package"))
    (:file "NextViewpoint" :depends-on ("_package_NextViewpoint"))
    (:file "_package_NextViewpoint" :depends-on ("_package"))
  ))