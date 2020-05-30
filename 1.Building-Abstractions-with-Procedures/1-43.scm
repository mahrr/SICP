;; Exercise 1-43

(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (define (iter fi i)
    (if (>= i n)
        fi
        (iter (compose f fi) (+ i 1))))
  (iter (lambda (x) x) 0))
