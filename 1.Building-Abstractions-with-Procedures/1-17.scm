;; Exercise 1-17

(define (double x) (+ x x))

(define (halve x) (/ x 2))

(define (even? x)
  (= (remainder x 2) 0))

(define (mul-fast x y)
  (cond ((= y 0) 0)
        ((even? y) (double (mul-fast x (halve y))))
        (else (+ x (mul-fast x (- y 1))))))
