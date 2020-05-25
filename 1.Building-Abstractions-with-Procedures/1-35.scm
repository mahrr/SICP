;; Exercise 1-35

;;
;; The golden ratio satisfies the equation:
;;
;; x^2 = x + 1
;;
;; With: x = (1 + sqrt(5)) / 2 ~= 1.618
;; 
;; x^2 = x + 1     (divide by x)
;; x   = 1 + 1/x
;;

(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2))
       tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define golden-ratio (fixed-point (lambda (x) (+ 1.0 (/ 1.0 x))) 1.0))