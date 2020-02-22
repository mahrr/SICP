;; Exercise 1-07

(define (average x y)
  (/ (+ x y) 2))

(define (square x)
  (* x x))

(define (improve guess x)
  (average guess (/ x guess)))

;; Old test procedure
;; (define (good-enough? guess x)
;;  (< (abs (- (square guess) x)) 0.0000000001))

(define (good-enough? guess x)
  (< (abs (- (improve guess x) guess)) 0.00001))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x) x)))

(define (my-sqrt x)
  (sqrt-iter 1.0 x))

(define (error-margin test-number)
  (abs (- (sqrt test-number)
          (my-sqrt test-number))))

(define (test-case test-suit)
  (if (null? test-suit)
      '()
      (cons (error-margin (car test-suit))
            (test-case (cdr test-suit)))))

;;
;; For small numbers the algorithms does not have
;; a good precision starting from 0.0001 and below:
;;
;;   number    | error margin
;;   --------------------------------
;;   0.01      | 0.00032578510960604157
;;   0.001     | 0.009622649473307356
;;   0.0001    | 0.02230844833048122
;;   0.00001   | 0.028194212447548783
;;   0.000001  | 0.030260655525445275
;;   0.0000001 | 0.0030934837851736983
;;
;; I think the reason for this is that the tolerance
;; factor is relatively big for small numbers, a more
;; smaller factor would yield a better results with,
;; but on the other hand it will be problemitic with
;; much bigger numbers.
;;
;; The problem is that averaging
;; very big numbers could never have a reuslt with
;; difference small as the tolerance factor, so the
;; procedure will stuck in an infinite loop.
;;
;; With 0.001 as a tolerance factor, this problem
;; starts to appear with 53-digits long numbers,
;; which is rarely used in practice.
;;