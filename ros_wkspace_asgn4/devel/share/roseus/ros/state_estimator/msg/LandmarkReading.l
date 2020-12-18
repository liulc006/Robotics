;; Auto-generated. Do not edit!


(when (boundp 'state_estimator::LandmarkReading)
  (if (not (find-package "STATE_ESTIMATOR"))
    (make-package "STATE_ESTIMATOR"))
  (shadow 'LandmarkReading (find-package "STATE_ESTIMATOR")))
(unless (find-package "STATE_ESTIMATOR::LANDMARKREADING")
  (make-package "STATE_ESTIMATOR::LANDMARKREADING"))

(in-package "ROS")
;;//! \htmlinclude LandmarkReading.msg.html


(defclass state_estimator::LandmarkReading
  :super ros::object
  :slots (_landmark _range _bearing ))

(defmethod state_estimator::LandmarkReading
  (:init
   (&key
    ((:landmark __landmark) (instance state_estimator::Landmark :init))
    ((:range __range) 0.0)
    ((:bearing __bearing) 0.0)
    )
   (send-super :init)
   (setq _landmark __landmark)
   (setq _range (float __range))
   (setq _bearing (float __bearing))
   self)
  (:landmark
   (&rest __landmark)
   (if (keywordp (car __landmark))
       (send* _landmark __landmark)
     (progn
       (if __landmark (setq _landmark (car __landmark)))
       _landmark)))
  (:range
   (&optional __range)
   (if __range (setq _range __range)) _range)
  (:bearing
   (&optional __bearing)
   (if __bearing (setq _bearing __bearing)) _bearing)
  (:serialization-length
   ()
   (+
    ;; state_estimator/Landmark _landmark
    (send _landmark :serialization-length)
    ;; float64 _range
    8
    ;; float64 _bearing
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; state_estimator/Landmark _landmark
       (send _landmark :serialize s)
     ;; float64 _range
       (sys::poke _range (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _bearing
       (sys::poke _bearing (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; state_estimator/Landmark _landmark
     (send _landmark :deserialize buf ptr-) (incf ptr- (send _landmark :serialization-length))
   ;; float64 _range
     (setq _range (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _bearing
     (setq _bearing (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get state_estimator::LandmarkReading :md5sum-) "b6297115c9296944dda00cf56fb301f4")
(setf (get state_estimator::LandmarkReading :datatype-) "state_estimator/LandmarkReading")
(setf (get state_estimator::LandmarkReading :definition-)
      "# The landmark for which this reading was created
state_estimator/Landmark landmark

# The range from the robot's location to the landmark above
float64 range

# The bearing of this landmark relative to the robot's orientation
float64 bearing

================================================================================
MSG: state_estimator/Landmark
# The x coordinate of this landmark
float64 x

# The y coordinate of this landmark
float64 y


")



(provide :state_estimator/LandmarkReading "b6297115c9296944dda00cf56fb301f4")


