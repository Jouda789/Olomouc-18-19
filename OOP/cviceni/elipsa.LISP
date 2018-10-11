(defclass point ()
((x :initform -1)
 (y :initform 1)))

(defclass ellipse ()
((focal-point-1 :initform (make-instance 'point))
 (focal-point-2 :initform (make-instance 'point))
 (semiaxis-1 :initform 4) ;; ne nutne major semiaxis 
 (semiaxis-2 :initform 5)))

(defmethod get-focus ((ellipse ellipse))
(let ((x (slot-value ellipse 'focal-point-1))
      (y (slot-value ellipse 'focal-point-2)))
(list x y)))

(defmethod get-eccentricity ((ellipse ellipse))
(let* ((bod1 (slot-value ellipse 'focal-point-1))
       (bod2 (slot-value ellipse 'focal-point-2))
       (x1 (slot-value bod1 'x))
       (y1 (slot-value bod1 'y))
       (x2 (slot-value bod2 'x))
       (y2 (slot-value bod2 'y)))
       (stred (make-instance 'point))
        
;;;;dodelat

)

(defmethod focal-point-1 ((el ellipse))
  (slot-value el 'focal-point-1))

(defmethod focal-point-2 ((el ellipse))
  (slot-value el 'focal-point-2))

(defmethod major-semiaxis ((ellipse ellipse))
(let ((x (slot-value ellipse 'semiaxis-1))
      (y (slot-value ellipse 'semiaxis-2)))
 (if (< x y) (list y) (list x))))

(defmethod minor-semiaxis ((ellipse ellipse))
(let ((x (slot-value ellipse 'semiaxis-1))
      (y (slot-value ellipse 'semiaxis-2)))
 (if (< x y) (list x) (list y))))

(defmethod set-major-semiaxis ((ellipse ellipse) value)
 (let ((x (slot-value ellipse 'semiaxis-1))
      (y (slot-value ellipse 'semiaxis-2))
      (pomocnaPromenna 0))
  (if (< x y) (progn
               (setf y value)
               (setf pomocnaPromenna y))
             (progn
               (setf x value)
               (setf pomocnaPromenna x))) 
  (set-minor-semiaxis ellipse (sqrt (- (* pomocnaPromenna pomocnaPromenna)
                        (* (focal-point-1 ellipse) (focal-point-1 ellipse)))))))

(defmethod set-minor-semiaxis ((ellipse ellipse) value)
(let ((x (slot-value ellipse 'semiaxis-1))
      (y (slot-value ellipse 'semiaxis-2)))
 (if (< x y) (setf x value) (setf y value)))) 

(defmethod eccentricity ((ellipse ellipse))
(let ((x (slot-value ellipse 'focal-point-1))
      (y (slot-value ellipse 'focal-point-2))
      (s1 (slot-value ellipse 'semiaxis-1))
      (s2 (slot-value ellipse 'semiaxis-2)))
(if (> s1 s2) (list (/ (abs (- x y)) s1 2))
              (list (/ (abs (- x y)) s2 2)))))

#|

(setf eli (make-instance 'ellipse))
(set-major-semiaxis eli 2)

 |#

