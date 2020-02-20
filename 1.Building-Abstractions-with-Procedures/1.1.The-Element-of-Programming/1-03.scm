; Exercise 1-03

(define (sum-of-squares x y)
  (+ (* x x) (* y y)))

(define (sum-of-squares-of-larger x y z)
  (cond ((and (>= x z) (>= y z)) (sum-of-squares x y))
        ((and (>= x y) (>= z y)) (sum-of-squares x z))
        (else (sum-of-squares y z))))
