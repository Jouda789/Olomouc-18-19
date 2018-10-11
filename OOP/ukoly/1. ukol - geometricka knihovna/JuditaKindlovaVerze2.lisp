
;----------------------------------------------------- point

(defun make-point ()
  (list 0 0 :black 'point))

(defun x (point)
  (first point))

(defun y (point)
  (second point))

(defun set-x (point value)
  (setf (first point) value))

(defun set-y (point value)
  (setf (second point) value))

(defun move-point (obj dx dy)
     (progn
        (set-x obj (+ dx (x obj)))
        (set-y obj (+ dy (y obj)))))

(defun move-circle (obj dx dy)
     (progn
        (set-x (first obj) (+ dx (x (first obj))))
        (set-y (first obj) (+ dy (y (first obj))))))

(defun move-polygon (obj dx dy)
 (dolist (point (first obj))
    (move-point point dx dy)))

(defun move-picture (obj dx dy)
 (dolist (w (first obj))
  (cond  ((equalp (fourth w) 'point)
          (move-point w dx dy))
         ((equalp (fourth w) 'circle)
          (move-circle w dx dy))
         ((equalp (third w) 'polygon)
          (move-polygon w dx dy)))))

(defun color (obj)  ; tato funkce je obecna
 (third obj))

(defun set-color (obj col)  ; tato funkce je obecna
 (setf (third obj) col))


;----------------------------------------------------- circle

(defun make-circle () ; v zadani neni polomer, tak si ho zvolim treba 1
 (list (make-point) 1 :black 'circle))

(defun center (circ)
  (first circ))

(defun radius (circ)
  (second circ))

(defun set-radius (circ val)
  (setf (second circ) val))


; v zadani neni, zda mame obarvit i stred, tak obarvim pouze obvod -> nemusim funkci set-color psat znovu

;----------------------------------------------------- polygon

; pri pridavani dalsich bodu je potreba jako prvni argument mit (make-point) a jako druhy argument dany polygon, ne obracene

(defun make-polygon ()
 (list NIL :BLACK 'polygon))

(defun items (obj) ; tato funkce je obecna -> funguje i pro picture
  (first obj))

(defun set-items (obj lst) ; tato funkce je obecna -> funguje i pro picture
  (setf (first obj) lst))

;----------------------------------------------------- picture

(defun make-picture ()
 (list NIL :BLACK 'picture))



#|

(setf poi (make-point))
(setf circ (make-circle))
(setf pic (make-picture))
(set-items pic (list poi circ))
(setf pol (make-polygon))
(set-items pol (list poi poi poi))
(setf pict (make-picture))
(set-items pict (list pic poi))
(set-color pict :green)
(move-circle circ 32 25)
(move-point poi 2 15)

|#


