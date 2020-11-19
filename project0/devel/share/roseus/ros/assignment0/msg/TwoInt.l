;; Auto-generated. Do not edit!


(when (boundp 'assignment0::TwoInt)
  (if (not (find-package "ASSIGNMENT0"))
    (make-package "ASSIGNMENT0"))
  (shadow 'TwoInt (find-package "ASSIGNMENT0")))
(unless (find-package "ASSIGNMENT0::TWOINT")
  (make-package "ASSIGNMENT0::TWOINT"))

(in-package "ROS")
;;//! \htmlinclude TwoInt.msg.html


(defclass assignment0::TwoInt
  :super ros::object
  :slots (_num1 _num2 ))

(defmethod assignment0::TwoInt
  (:init
   (&key
    ((:num1 __num1) 0)
    ((:num2 __num2) 0)
    )
   (send-super :init)
   (setq _num1 (round __num1))
   (setq _num2 (round __num2))
   self)
  (:num1
   (&optional __num1)
   (if __num1 (setq _num1 __num1)) _num1)
  (:num2
   (&optional __num2)
   (if __num2 (setq _num2 __num2)) _num2)
  (:serialization-length
   ()
   (+
    ;; int8 _num1
    1
    ;; int8 _num2
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int8 _num1
       (write-byte _num1 s)
     ;; int8 _num2
       (write-byte _num2 s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int8 _num1
     (setq _num1 (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _num1 127) (setq _num1 (- _num1 256)))
   ;; int8 _num2
     (setq _num2 (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _num2 127) (setq _num2 (- _num2 256)))
   ;;
   self)
  )

(setf (get assignment0::TwoInt :md5sum-) "57106ecc5f261c3b4e1105c1171fe312")
(setf (get assignment0::TwoInt :datatype-) "assignment0/TwoInt")
(setf (get assignment0::TwoInt :definition-)
      "int8 num1
int8 num2

")



(provide :assignment0/TwoInt "57106ecc5f261c3b4e1105c1171fe312")


