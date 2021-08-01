
(cl:in-package :asdf)

(defsystem "ggcnn-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :ggcnn-msg
)
  :components ((:file "_package")
    (:file "GraspPrediction" :depends-on ("_package_GraspPrediction"))
    (:file "_package_GraspPrediction" :depends-on ("_package"))
  ))