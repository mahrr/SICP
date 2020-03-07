;; Exercise 1-15

(define (cube x) (* x x x))
(define (sine angle)
  (define (p x) (- (* 3 x) (* 4 (cube x))))
  (if (not (> (abs angle) 0.1))
      angle
      (p (sine (/ angle 3.0)))))

;; a)
;;
;; sine(12.15)
;; (p (sine 4.05))
;; (p (p (sine 1.349)))
;; (p (p (p (sine 0.449))))
;; (p (p (p (p (sine 0.15)))))
;; (p (p (p (p (p (sine 0.049))))))
;; (p (p (p (p (p 0.049)))))
;;
;; 5 times


;; b)
;;
;; R(a) :space = O(a)
;; R(a) :steps = O(a)