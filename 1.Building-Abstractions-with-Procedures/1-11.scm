;; Exercise 1-11

;; Recursive Procedure

(define (f n)
  (if (< n 3)
      n
      (+ (f (- n 1)) (* 2 (f (- n 2))) (* 3 (f (- n 3))))))

;; Iterative Procedure

(define (f n)
  (define (iter x y z count)
    (if (< count 3)
        z
        (iter y z (+ z (* 2 y) (* 3 x)) (- count 1))))
  (if (< n 3)
      n
      (iter 0 1 2 n)))