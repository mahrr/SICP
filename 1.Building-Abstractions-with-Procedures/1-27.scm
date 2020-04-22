(define (square n) (* n n))

(define (divides? a b) (= (remainder b a) 0))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m)) m))
        (else
         (remainder (* base (expmod base (- exp 1) m)) m))))

(define (fermat-test n x)
  (= (expmod x n n) x))

(define (test-fermat n)
  (define (iter x)
    (cond ((= x n)
           (begin (display n)
                  (display " ** PASS **")
                  (newline)))
          ((fermat-test n x) (iter (+ x 1)))
          (else
           (begin (display n)
                  (display " ** FAILED **")
                  (newline)))))
  (iter 2))
        

;; Carmichael numbers less than 10000
(define carmichael-numbers (list 561 1105 1729 2465 2821 6601))

(define (try-fermat-on-list numbers)
  (if (null? numbers)
      '()
      (begin
        (test-fermat (car numbers))
        (try-fermat-on-list (cdr numbers)))))

(try-fermat-on-list carmichael-numbers)