;; Auto-generated. Do not edit!


(when (boundp 'state_estimator::LandmarkSet)
  (if (not (find-package "STATE_ESTIMATOR"))
    (make-package "STATE_ESTIMATOR"))
  (shadow 'LandmarkSet (find-package "STATE_ESTIMATOR")))
(unless (find-package "STATE_ESTIMATOR::LANDMARKSET")
  (make-package "STATE_ESTIMATOR::LANDMARKSET"))

(in-package "ROS")
;;//! \htmlinclude LandmarkSet.msg.html


(defclass state_estimator::LandmarkSet
  :super ros::object
  :slots (_landmarks ))

(defmethod state_estimator::LandmarkSet
  (:init
   (&key
    ((:landmarks __landmarks) ())
    )
   (send-super :init)
   (setq _landmarks __landmarks)
   self)
  (:landmarks
   (&rest __landmarks)
   (if (keywordp (car __landmarks))
       (send* _landmarks __landmarks)
     (progn
       (if __landmarks (setq _landmarks (car __landmarks)))
       _landmarks)))
  (:serialization-length
   ()
   (+
    ;; state_estimator/Landmark[] _landmarks
    (apply #'+ (send-all _landmarks :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; state_estimator/Landmark[] _landmarks
     (write-long (length _landmarks) s)
     (dolist (elem _landmarks)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; state_estimator/Landmark[] _landmarks
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _landmarks (let (r) (dotimes (i n) (push (instance state_estimator::Landmark :init) r)) r))
     (dolist (elem- _landmarks)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get state_estimator::LandmarkSet :md5sum-) "2e42ef07fd19a8de8b0770685a8090aa")
(setf (get state_estimator::LandmarkSet :datatype-) "state_estimator/LandmarkSet")
(setf (get state_estimator::LandmarkSet :definition-)
      "state_estimator/Landmark[] landmarks

================================================================================
MSG: state_estimator/Landmark
# The x coordinate of this landmark
float64 x

# The y coordinate of this landmark
float64 y


")



(provide :state_estimator/LandmarkSet "2e42ef07fd19a8de8b0770685a8090aa")


