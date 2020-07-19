;; Exercise 2-05

(define (pow x exp)
  (define (iter x exp acc)
    (cond ((= 0 exp) acc)
          ((even? exp) (iter (* x x) (/ exp 2) acc))
          (else (iter x (- exp 1) (* x acc)))))
  (iter x exp 1))

(define (cons x y)
  (* (pow 2 x) (pow 3 y)))

(define (car pair)
  (if (> (remainder pair 2) 0)
      0
      (+ 1 (car (/ pair 2)))))

(define (cdr pair)
  (if (> (remainder pair 3) 0)
      0
      (+ 1 (cdr (/ pair 3)))))
