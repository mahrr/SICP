;; Exercise 2-01

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(define (make-rat n d)
  (let ((g (gcd (abs n) (abs d))))
    (if (< d 0)
        (cons (/ (- n) g)
              (/ (- d) g))
        (cons (/ n g)
              (/ d g)))))