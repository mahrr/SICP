;; Exercise 1-18

(define (double x) (+ x x))

(define (halve x) (/ x 2))

(define (even? x)
  (= (remainder x 2) 0))

(define (mul-fast x y)
  (define (iter x y a)
    (cond ((= y 0) a)
          ((even? y) (iter (double x) (halve y) a))
          (else (iter x (- y 1) (+ a x)))))
  (iter x y 0))