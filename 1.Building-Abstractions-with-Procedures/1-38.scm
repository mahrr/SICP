;; Exercise 1-38

;; Euler's De Fractionibus Continuis

(define (cont-frac n d k)
  (define (iter i result)
    (if (= i 0)
        result
        (iter (- i 1)
              (/ (n i) (+ (d i) result)))))
  (iter k 0))

(define (divisible? x y)
  (= (remainder x y) 0))

(define (calc-e k)
  (define (n x) 1)
  ;; To generate sequence: 1 2 1 1 4 1 1 6 1 1 8 ...
  (define (d x)
    (let ((i (+ x 1.0)))
      (if (divisible? i 3.0)
          (- i (/ i 3.0))
          1.0)))
  (+ (cont-frac n d k) 2))