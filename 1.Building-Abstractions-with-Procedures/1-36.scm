;; Exercise 1-36

(define tolerance 0.00001)

(define (average x y) (/ (+ x y) 2))

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2))
       tolerance))
  (define (try guess step)
    (let ((next (f guess)))
      (begin
        (display step)
        (display ": ")
        (display guess)
        (newline)
        (if (close-enough? guess next)
            next
            (try next (+ step 1))))))
  (try first-guess 0))

(fixed-point (lambda (x) (/ (log 1000) (log x))) 2)

;; With average damping:
;;  x = log(1000) / log(x)
;; Becomes:
;;  x = (x + log(1000) / log(x)) / 2

(fixed-point (lambda (x) (average x (/ (log 1000) (log x)))) 2)

;; Regular:         33 steps
;; Average Damping: 08 steps