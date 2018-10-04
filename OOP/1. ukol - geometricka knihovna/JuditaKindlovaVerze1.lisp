
;----------------------------------------------------- point

(defun make-point ()
  (cons (cons (cons 0 0) :black ) 'point))

(defun x (point)
  (caaar point)) ; muze se pouzit i funkce first, ale to je lepsi definovat fci make-point pomoci list misto cons

(defun y (point)
  (cdr (caar point)))

(defun set-x (point value)
  (setf (caaar point) value))

(defun set-y (point value)
  (setf (cdr (caar point)) value))

(defun move (obj dx dy)
 (cond  ((equalp (cdr obj) 'point)
          (progn
          (set-x obj ( + dx (x obj)))
          (set-y obj ( + dy (y obj)))))
        ((equalp (cdr obj) 'circle)
          (progn
          (set-x (caaar obj) ( + dx (x (caaar obj))))
          (set-y (caaar obj) ( + dy (y (caaar obj))))))
        ((equalp (cdr obj) 'polygon)
          (dolist (z (caar obj))
          (set-x z ( + dx (x z)))
          (set-y z ( + dy (y z)))))
        ((equalp (cdr obj) 'picture)
          (dolist (z (caar obj))
          (funcall 'move z dx dy)))))
         
(defun color (obj)  ; tato funkce je obecna
 (cdar obj))

(defun set-color (obj col)  ; tato funkce je obecna
 (setf (cdar obj) col))


;----------------------------------------------------- circle

(defun make-circle () ; v zadani neni polomer, tak si ho zvolim treba 1
 (cons (cons (cons (make-point) 1) :black) 'circle))

(defun center (circ)
  (caaar circ))

(defun radius (circ)
  (cdr (caar circ)))

(defun set-radius (circ val)
  (setf (cdr (caar circ)) val))


; v zadani neni, zda mame obarvit i stred, tak obarvim pouze obvod -> nemusim funkci set-color psat znovu

;----------------------------------------------------- polygon

; pri pridavani dalsich bodu je potreba jako prvni argument mit (make-point) a jako druhy argument dany polygon, ne obracene

(defun make-polygon ()
  (cons (cons NIL :BLACK) 'polygon))

(defun items (obj) ; tato funkce je obecna -> funguje i pro picture
  (caar obj))

(defun set-items (obj lst) ; tato funkce je obecna -> funguje i pro picture
  (setf (caar obj) lst))

;----------------------------------------------------- picture

(defun make-picture ()
  (cons (cons NIL :BLACK) 'picture))



#|

(setf poi (make-point))
(setf circ (make-circle))
(setf pic (make-picture))
(set-items pic (list poi circ))
(setf pol (make-polygon))
(set-items pol (list poi circ poi))
(setf pict (make-picture))
(set-items pict (list pic poi))
(set-color pict :green)
(move pict 32 25)

|#


