
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

(defun set-items (obj lst) 
 (if  (polygonp obj)
         (progn
            (dolist (shape lst)
                  (unless (pointp shape)
               (error "Polygon lze skladat jenom z bodu.")))
             (setf (first obj) lst))
        (setf (first obj) lst))
obj)

;----------------------------------------------------- picture

(defun make-picture ()
 (list NIL :BLACK 'picture))

;-------------------------------------- pohyb

(defun move-point (obj dx dy)
        (set-x obj (+ dx (x obj)))
        (set-y obj (+ dy (y obj)))
     obj)

(defun move-circle (obj dx dy)
        (set-x (first obj) (+ dx (x (first obj))))
        (set-y (first obj) (+ dy (y (first obj))))
     obj)

(defun move-polygon (obj dx dy)
 (dolist (point (first obj))
    (move-point point dx dy))
 obj)

(defun move-picture (obj dx dy)
 (dolist (shape (first obj))
      (move shape dx dy))
 obj)

(defun move (obj dx dy)
  (cond  ((pointp obj)
          (move-point obj dx dy))
         ((circlep obj)
          (move-circle obj dx dy))
         ((polygonp obj)
          (move-polygon obj dx dy))
         ((picturep obj)
          (move-picture obj dx dy))))

;-------------------- barva

(defun color (obj)  
 (third obj))

(defun set-color (obj col) 
 (setf (third obj) col))

;-------------------- predikaty

(defun pointp (shape)
 (eql (fourth shape) 'point))

(defun circlep (shape)
 (eql (fourth shape) 'circle))

(defun polygonp (shape)
 (eql (third shape) 'polygon))

(defun picturep (shape)
 (eql (third shape) 'picture))

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
(color pict)
(move circ 32 25)
(move poi 2 15)
(move pol 3 14)
(move pict 12 16)

|#

