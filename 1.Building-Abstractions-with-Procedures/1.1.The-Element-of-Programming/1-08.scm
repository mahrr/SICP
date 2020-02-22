;; Exercise 1-08

(define (average x y)
  (/ (+ x y) 2))

(define (square x)
  (* x x))

;; Formula for y as guess:
;;  (x / y^2 + 2*y) / 3
(define (improve guess x)
  (/ (+ (/ x (square guess)) (* guess 2)) 3))

(define (good-enough? guess x)
  (< (abs (- (improve guess x) guess)) 0.00001))

(define (sqrt3-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt3-iter (improve guess x) x)))

(define (sqrt3 x)
  (sqrt3-iter 1.0 x))