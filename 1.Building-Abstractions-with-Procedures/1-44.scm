;; Exercise 1-44

(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (define (iter fi i)
    (if (>= i n)
        fi
        (iter (compose f fi) (+ i 1))))
  (iter (lambda (x) x) 0))

(define dx 0.00001)
(define (smooth f)
  (lambda (x)
    (/ (+ (f (- x dx)) (f x) (f (+ x dx))) 3)))

(define (n-fold-smoothed f n)
  ((repeated smooth n) f))
