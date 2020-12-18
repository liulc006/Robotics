;; Auto-generated. Do not edit!


(when (boundp 'state_estimator::Landmark)
  (if (not (find-package "STATE_ESTIMATOR"))
    (make-package "STATE_ESTIMATOR"))
  (shadow 'Landmark (find-package "STATE_ESTIMATOR")))
(unless (find-package "STATE_ESTIMATOR::LANDMARK")
  (make-package "STATE_ESTIMATOR::LANDMARK"))

(in-package "ROS")
;;//! \htmlinclude Landmark.msg.html


(defclass state_estimator::Landmark
  :super ros::object
  :slots (_x _y ))

(defmethod state_estimator::Landmark
  (:init
   (&key
    ((:x __x) 0.0)
    ((:y __y) 0.0)
    )
   (send-super :init)
   (setq _x (float __x))
   (setq _y (float __y))
   self)
  (:x
   (&optional __x)
   (if __x (setq _x __x)) _x)
  (:y
   (&optional __y)
   (if __y (setq _y __y)) _y)
  (:serialization-length
   ()
   (+
    ;; float64 _x
    8
    ;; float64 _y
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _x
       (sys::poke _x (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _y
       (sys::poke _y (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _x
     (setq _x (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _y
     (setq _y (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get state_estimator::Landmark :md5sum-) "209f516d3eb691f0663e25cb750d67c1")
(setf (get state_estimator::Landmark :datatype-) "state_estimator/Landmark")
(setf (get state_estimator::Landmark :definition-)
      "# The x coordinate of this landmark
float64 x

# The y coordinate of this landmark
float64 y


")



(provide :state_estimator/Landmark "209f516d3eb691f0663e25cb750d67c1")


