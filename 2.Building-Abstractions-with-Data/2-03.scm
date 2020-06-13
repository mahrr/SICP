;; Exercise 2-03

(define (avg a b) (/ (+ a b) 2))

(define (make-point x y) (cons x y))
(define (x-point p) (car p))
(define (y-point p) (cdr p))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(define (make-segment start end)
  (cons start end))

(define (start-segment s) (car s))
(define (end-segment s) (cdr s))

(define (midpoint-segment s)
  (let ((start (start-segment s))
        (end (end-segment s)))
    (make-point (avg (x-point start) (x-point end))
                (avg (y-point start) (y-point end)))))


;; Representation 1: two points
(define (make-rect lower-left top-right)
  (cons lower-left top-right))

(define (rect-lower-left r) (car r))
(define (rect-top-right r) (cdr r))

;; Represetation 2: segment [lower-left] --> [top-right]
(define (make-rect segment) segment)
(define (rect-lower-left r) (start-segment r))
(define (rect-top-right r) (end-segment r))


(define (rect-height r)
  (- (y-point (rect-top-right r))
     (y-point (rect-lower-left r))))

(define (rect-width r)
  (- (x-point (rect-top-right r))
     (x-point (rect-lower-left r))))

(define (rect-perimeter r)
  (+ (* 2 (rect-height r))
     (* 2 (rect-width r))))

(define (rect-area r)
  (* (rect-height r)
     (rect-width r)))