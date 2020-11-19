;; Auto-generated. Do not edit!


(when (boundp 'cartesian_control::CartesianCommand)
  (if (not (find-package "CARTESIAN_CONTROL"))
    (make-package "CARTESIAN_CONTROL"))
  (shadow 'CartesianCommand (find-package "CARTESIAN_CONTROL")))
(unless (find-package "CARTESIAN_CONTROL::CARTESIANCOMMAND")
  (make-package "CARTESIAN_CONTROL::CARTESIANCOMMAND"))

(in-package "ROS")
;;//! \htmlinclude CartesianCommand.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass cartesian_control::CartesianCommand
  :super ros::object
  :slots (_x_target _secondary_objective _q0_target ))

(defmethod cartesian_control::CartesianCommand
  (:init
   (&key
    ((:x_target __x_target) (instance geometry_msgs::Transform :init))
    ((:secondary_objective __secondary_objective) nil)
    ((:q0_target __q0_target) 0.0)
    )
   (send-super :init)
   (setq _x_target __x_target)
   (setq _secondary_objective __secondary_objective)
   (setq _q0_target (float __q0_target))
   self)
  (:x_target
   (&rest __x_target)
   (if (keywordp (car __x_target))
       (send* _x_target __x_target)
     (progn
       (if __x_target (setq _x_target (car __x_target)))
       _x_target)))
  (:secondary_objective
   (&optional (__secondary_objective :null))
   (if (not (eq __secondary_objective :null)) (setq _secondary_objective __secondary_objective)) _secondary_objective)
  (:q0_target
   (&optional __q0_target)
   (if __q0_target (setq _q0_target __q0_target)) _q0_target)
  (:serialization-length
   ()
   (+
    ;; geometry_msgs/Transform _x_target
    (send _x_target :serialization-length)
    ;; bool _secondary_objective
    1
    ;; float32 _q0_target
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; geometry_msgs/Transform _x_target
       (send _x_target :serialize s)
     ;; bool _secondary_objective
       (if _secondary_objective (write-byte -1 s) (write-byte 0 s))
     ;; float32 _q0_target
       (sys::poke _q0_target (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; geometry_msgs/Transform _x_target
     (send _x_target :deserialize buf ptr-) (incf ptr- (send _x_target :serialization-length))
   ;; bool _secondary_objective
     (setq _secondary_objective (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; float32 _q0_target
     (setq _q0_target (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get cartesian_control::CartesianCommand :md5sum-) "e5ffe3cb2eac6f1acc27e5635f953be7")
(setf (get cartesian_control::CartesianCommand :datatype-) "cartesian_control/CartesianCommand")
(setf (get cartesian_control::CartesianCommand :definition-)
      "geometry_msgs/Transform x_target
bool secondary_objective
float32 q0_target
================================================================================
MSG: geometry_msgs/Transform
# This represents the transform between two coordinate frames in free space.

Vector3 translation
Quaternion rotation

================================================================================
MSG: geometry_msgs/Vector3
# This represents a vector in free space. 
# It is only meant to represent a direction. Therefore, it does not
# make sense to apply a translation to it (e.g., when applying a 
# generic rigid transformation to a Vector3, tf2 will only apply the
# rotation). If you want your data to be translatable too, use the
# geometry_msgs/Point message instead.

float64 x
float64 y
float64 z
================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w

")



(provide :cartesian_control/CartesianCommand "e5ffe3cb2eac6f1acc27e5635f953be7")


