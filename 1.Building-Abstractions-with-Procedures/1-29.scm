;;
;; Simpson’s Rule,
;; the integral of a function 'f between 'a and 'b is approximated as:
;;   (h/3) * (y[0] + 4 * y[1] + 2 * y[2] + 4 * y[3] + 2 * y[4] + ... + 2 * y[2 - n] + 4 * y[3 - n] + 2 * y[4 - 2])
;; where:
;;    h    = (b - a) / n : for some even integer n
;;    y[k] = f(a + kh)
;;

(define (integral f a b n)
  (define h (/ (- b a) n))
  (define (iter k)
    (let ((y (f (+ a (* k h)))))
      (if (> k n)
          0
          (+ (if (even? k)
                 (* y 2)
                 (* y 4))
             (iter (+ k 1))))))
  (* (/ h 3) (iter 0)))

(integral (lambda (x) (* x x x)) 0 1 100)   ;; => 19/75
(integral (lambda (x) (* x x x)) 0 1 1000)  ;; => 751/3000
(integral (lambda (x) (* x x x)) 0 1 10000) ;; => 7501/30000