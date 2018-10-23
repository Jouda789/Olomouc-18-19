#| DOKUMENTACE

Třída semaphore
======================
Třída semaphore je potomkem třídy picture. Její instance představují semafor,
kterému lze nastavit fázi a typ semaforu (:vehicle, :pedestrian), nebo přidat vlastní typ semaforu.

UPRAVENÉ ZDĚDĚNÉ VLASTNOSTI

žádné

NOVÉ VLASTNOSTI

semaphore-type         typ semaforu :vehicle nebo :pedestrian
semaphore-phase        aktuální stav semaforu
phase-count            počet fází semaforu (pouze pro čtení)

UPRAVENÉ ZDĚDĚNÉ ZPRÁVY

žádné

NOVÉ ZPRÁVY

set-type               změní nebo přídá nový typ semaforu
next-phase             přepne semafor do následujícího stavu



Třída crossroads
======================
Třída crossroads je potomkem třídy picture. Její instance představují křižovatku,
které můžeme nastavit program a přepínat její fáze.

UPRAVENÉ ZDĚDĚNÉ VLASTNOSTI

set-items             slouží k nastavení objektů v křižovatce, automatiky aktualizuje vlastnost semaphores

NOVÉ VLASTNOSTI

crossroads-phase      aktuální stav křižovatky
phase-count           počet fází křižovatky (pouze pro čtení)
program               program křižovatky, který řídí semafory
semaphores            seznam semaforů (pouze pro čtení)

UPRAVENÉ ZDĚDĚNÉ ZPRÁVY

žádné

NOVÉ ZPRÁVY

next-phase            přepne křižovatku do následujího stavu

|#

(defclass semaphore (picture)
  ((semaphore-type :initform :vehicle)   
   (semaphore-phase :initform 0)
   (types :initform   '((:vehicle (:red :orange :green) ((t nil nil) (t t nil) (nil nil t) (nil t nil)))
                        (:pedestrian (:red :green) ((t nil) (nil t)))))
   (lights :initform '())
   (background :initform  (make-instance 'polygon))))
 
(defmethod initialize-instance ((s semaphore) &key)
  (call-next-method)
  (set-semaphore-type s :vehicle))

(defmethod types ((s semaphore))
  (slot-value s 'types))

(defmethod set-types ((s semaphore) value)
  (setf (slot-value s 'types) value))

(defmethod s-type ((s semaphore) typename)
   (assoc typename (types s)))  ; zde pouzivam assoc: (setq alist '((1 . "one")(2 . "two")(3 . "three"))) , (assoc 2 alist) =>  (2 . "two")

(defmethod set-semaphore-type ((s semaphore) value)
  (if (s-type s value)
      (set-semaphore-type-do s value)
    (error "Typ semaforu neexistuje"))
  (set-semaphore-phase s 0)
  s)

(defmethod set-type ((s semaphore) name lights phases)
  (let ((type (s-type s name)))
    (if type
        (setf (cdr type) (list lights phases))
      (set-types s (append (types s) (list (list name lights phases))))))
  (set-semaphore-type s name))
                     
(defmethod make-background ((s semaphore) count)
  (set-items  (background s) (list 
                              (set-x (set-y (make-instance 'point) 0) 0)
                              (set-x (set-y (make-instance 'point) 0) 8)
                              (set-x (set-y (make-instance 'point) (+ (* 7 count) 2)) 8)
                              (set-x (set-y (make-instance 'point) (+ (* 7 count) 2)) 0)))
  (set-filledp (background s) :gray)
  s)

(defmethod make-lights ((s semaphore) light-colors)
  (set-lights s '())
  (let ((i 0))
   (dolist (color light-colors)
     (add-light s (set-off (move (set-on-color (make-light s) color) 4 (+ (* i 7) 4))))
     (setf i (+ i 1)))))

(defmethod make-light  ((s semaphore))
  (set-radius (make-instance 'light) 3))

(defmethod semaphore-type ((s semaphore))
  (slot-value s 'semaphore-type))

(defmethod type-lights ((s semaphore) type)
   (nth 1 type))

(defmethod type-phases ((s semaphore) type)
   (nth 2 type))
 
(defmethod set-semaphore-type-do ((s semaphore) value)
  (let ((type (s-type s value)))
    (make-lights s (type-lights s type))
    (make-background s (list-length (type-lights s type)))
    (setf (slot-value s 'semaphore-type) value) )
  (set-items s (append (lights s) (list (background s)))))

(defmethod lights ((s semaphore))
  (slot-value s 'lights))

(defmethod set-lights ((s semaphore) value)
  (setf (slot-value s 'lights) value))

(defmethod add-light ((s semaphore) val)
  (set-lights s (append (lights s) (list val))))

(defmethod semaphore-phase ((s semaphore))
  (slot-value s 'semaphore-phase))

(defmethod phase-count ((s semaphore))
  (list-length (type-phases s (s-type s (semaphore-type s)))))

(defmethod background ((s semaphore))
  (slot-value s 'background))
    
(defmethod phases ((s semaphore) n)
  (nth n (type-phases s (s-type s (semaphore-type s)))))

(defmethod set-semaphore-phase ((s semaphore) n)
  (when (<= (phase-count s) n)
    (error "Neplatná fáze"))
  (let ((phase (phases s n)) (i 0))
    (dolist (light (lights s))
      (if (nth i phase)
          (set-on light)
        (set-off light))
      (setf i (+ i 1))))
  (setf (slot-value s 'semaphore-phase) n)
  s)
    
(defmethod next-phase ((s semaphore))
  (set-semaphore-phase s (mod (+ (semaphore-phase s) 1) (phase-count s)))
  s)

; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defclass crossroads (picture)
  ((crossroads-phase :initform 0)
   (semaphores :initform '())
   (program :initform '())))
   
(defmethod semaphores ((c crossroads))
  (slot-value c 'semaphores))

(defmethod program ((c crossroads))
  (slot-value c 'program))

(defmethod set-program ((c crossroads) value)
  (setf (slot-value c 'program) (repair-program c value))
  c)

(defmethod repair-program ((c crossroads) val)
  (mapcar (lambda (x)
            (repair-program-phase c x))       
          val))

(defmethod repair-program-phase ((c crossroads) phase)
  (let ((s-phase (semaphore-phases c)))
    (append
     (mapcar 
      (lambda (x)
        (if s-phase
            (let ((p (car s-phase)))
              (setf s-phase (cdr s-phase))
              (if (< x p) x nil))
          x))
      phase)
     (mapcar (lambda (x) x nil) s-phase))))

(defmethod set-semaphores ((c crossroads) value)
  (setf (slot-value c 'semaphores) value)
  c)

(defmethod add-semaphore ((c crossroads) value)
  (set-semaphores c (append (semaphores c) (list value))))

(defmethod semaphore-phases ((c crossroads))
  (mapcar (lambda (s)
            (phase-count s))
          (semaphores c)))

(defmethod phase-count ((c crossroads))
   (list-length (program c)))

(defmethod crossroads-phase ((c crossroads))
  (slot-value c 'crossroads-phase))

(defmethod set-items ((c crossroads) items)
  (call-next-method)
  (search-semaphores c items)
  (set-program c (program c)))

(defmethod search-semaphores ((c crossroads) items)
   (dolist (item items)
    (cond ((typep item 'semaphore) (add-semaphore c item))
          ((typep item 'picture) (search-semaphores c (items item))))))
   
(defmethod initialize-instance ((c crossroads) &key)
  (call-next-method)
  (default c))
 
(defmethod default ((c crossroads))
  (set-program c '((0 0 2 2 0 0 0 0 1 1 1 1) (0 0 2 2 0 0 0 0 0 0 0 0) (1 1 3 3 0 0 0 0 0 0 0 0) (2 2 0 0 1 1 1 1 0 0 0 0) (2 2 0 0 0 0 0 0 0 0 0 0) (3 3 1 1 0 0 0 0 0 0 0 0)))
  (set-items c (list
                (move (make-instance 'semaphore) 172 122)
                (move (rotate (make-instance 'semaphore) pi (set-x (set-y (make-instance 'point) 0) 0)) 128 78)
                (rotate (move (make-instance 'semaphore) 172 122)  (/ pi 2) (set-x (set-y (make-instance 'point) 100) 150))
                (rotate  (move (rotate (make-instance 'semaphore) pi (set-x (set-y (make-instance 'point) 0) 0)) 128 78)  (/ pi 2) (set-x (set-y (make-instance 'point) 100) 150))
                (move (set-semaphore-type (make-instance 'semaphore) :pedestrian) 70 60)
                (move (rotate (set-semaphore-type (make-instance 'semaphore) :pedestrian) pi (set-x (set-y (make-instance 'point) 0) 0)) 78 140)
                (move (set-semaphore-type (make-instance 'semaphore) :pedestrian) 230 60)
                (move (rotate (set-semaphore-type (make-instance 'semaphore) :pedestrian) pi (set-x (set-y (make-instance 'point) 0) 0)) 238 140)
                (rotate (move (set-semaphore-type (make-instance 'semaphore) :pedestrian) 70 60) (/ pi 2) (set-x (set-y (make-instance 'point) 100) 150))
                (rotate  (move (rotate (set-semaphore-type (make-instance 'semaphore) :pedestrian) pi (set-x (set-y (make-instance 'point) 0) 0)) 78 140) (/ pi 2) (set-x (set-y (make-instance 'point) 100) 150))
                (rotate  (move (set-semaphore-type (make-instance 'semaphore) :pedestrian) 230 60) (/ pi 2) (set-x (set-y (make-instance 'point) 100) 150))
                (rotate  (move (rotate (set-semaphore-type (make-instance 'semaphore) :pedestrian) pi (set-x (set-y (make-instance 'point) 0) 0)) 238 140) (/ pi 2) (set-x (set-y (make-instance 'point) 100) 150))   
                (move (make-transition c) 60 80)
                (move (make-transition c) 220 80)
                (rotate (move (make-transition c) 60 80) (/ pi 2) (set-x (set-y (make-instance 'point) 100) 150))
                (rotate (move (make-transition c) 220 80) (/ pi 2) (set-x (set-y (make-instance 'point) 100) 150))
                (make-rectangle  c
                                 (set-x (set-y (make-instance 'point) 0) 130)
                                 (set-x (set-y (make-instance 'point) 200) 170)
                                 :gray)
                (make-rectangle  c
                                 (set-x (set-y (make-instance 'point) 80) 0)
                                 (set-x (set-y (make-instance 'point) 120) 300)
                                 :gray)
                (make-rectangle  c
                                 (set-x (set-y (make-instance 'point) 0) 0)
                                 (set-x (set-y (make-instance 'point) 200) 300)
                                 :green)))
   (set-crossroads-phase c 0))

(defmethod make-rectangle ((c crossroads) lt rb color)
  (let ((rect (make-instance 'polygon)))
    (set-items rect (list 
                     lt
                     (set-x (set-y (make-instance 'point) (y rb)) (x lt))
                     rb
                     (set-x (set-y (make-instance 'point) (y lt)) (x rb))))
    (set-color rect color)
    (set-filledp rect t)
    rect))

(defmethod make-transition ((c crossroads))
  (let ((pic (make-instance 'picture)))
    (set-items pic (list
                    (make-rectangle  c
                                     (set-x (set-y (make-instance 'point) 3) 0)
                                     (set-x (set-y (make-instance 'point) 8) 30)
                                     :white)
                    (make-rectangle  c
                                     (set-x (set-y (make-instance 'point) 13) 0)
                                     (set-x (set-y (make-instance 'point) 18) 30)
                                     :white)
                    (make-rectangle  c
                                     (set-x (set-y (make-instance 'point) 23) 0)
                                     (set-x (set-y (make-instance 'point) 28) 30)
                                     :white)
                    (make-rectangle  c
                                     (set-x (set-y (make-instance 'point) 33) 0)
                                     (set-x (set-y (make-instance 'point) 38) 30)
                                     :white)))
    pic))

(defmethod phases ((c crossroads) n)
      (nth n (program c)))

(defmethod set-crossroads-phase ((c crossroads) n)
   (when (<= (phase-count c) n)
     (error "Neplatná fáze"))
  (let ((phases (phases c n)) (i 0))
    (dolist (semaphore (semaphores c))
      (let ((phase (nth i phases)))
        (if phase
            (if (eql phase t)
               (next-phase semaphore) 
              (set-semaphore-phase semaphore (nth i phases)))))
      (setf i (+ i 1))))
  (setf (slot-value c 'crossroads-phase) n)
  c)
   
(defmethod next-phase ((c crossroads))
  (unless (= (phase-count c) 0)
      (set-crossroads-phase c (mod (+ (crossroads-phase c) 1) (phase-count c))))
  c)

#|

(setf w (make-instance 'window))

(setf c (make-instance 'crossroads))

(setf s (make-instance 'semaphore))

(set-type s :ve '(:red :yellow :blue :green) '((t t t t) (t nil nil nil) (nil t nil nil)))

(set-shape w c)
(redraw w)
|#