(define (square n) (* n n))

(define (divides? a b) (= (remainder b a) 0))

(define (sqrmod x n)
  (let ((y (remainder (square x) n)))
    (cond ((or (= x 1) (= x (- n 1))) y)
          ((= y 1) 0)
          (else y))))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (sqrmod (expmod base (/ exp 2) m) m))
        (else
         (remainder (* base (expmod base (- exp 1) m)) m))))

(define (miller-rabin-test n x)
  (= (expmod x (- n 1) n) 1))

(define (test-miller-rabin n)
  (define (iter x)
    (cond ((= x n)
           (begin (display n)
                  (display " ** PASS **")
                  (newline)))
          ((miller-rabin-test n x) (iter (+ x 1)))
          (else
           (begin (display n)
                  (display " ** FAILED **")
                  (newline)))))
  (iter 2))
        

;; Carmichael numbers less than 10000
(define carmichael-numbers (list 561 1105 1729 2465 2821 6601))

;; Some prime numbers
(define prime-numbers (list 73 79 83 89 97 101 103 107 109 113 127))

(define (try-miller-rabin-on-list numbers)
  (if (null? numbers)
      '()
      (begin
        (test-miller-rabin (car numbers))
        (try-miller-rabin-on-list (cdr numbers)))))

(try-miller-rabin-on-list carmichael-numbers)  ;; Should FAIL
(try-miller-rabin-on-list prime-numbers)       ;; Should PASS