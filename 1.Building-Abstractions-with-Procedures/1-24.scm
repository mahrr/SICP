(define (square n) (* n n))

(define (divides? a b) (= (remainder b a) 0))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m)) m))
        (else
         (remainder (* base (expmod base (- exp 1) m)) m))))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))

(define (time-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (fast-prime? n 1)
      (report-time (- (runtime) start-time))))

(define (report-time elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (search-for-primes x y)
  (search-in-range (if (divides? 2 x) (+ x 1) x) y))

(define (search-in-range x y)
  (if (>= x y)
      (newline)
      (begin
        (time-prime-test x)
        (search-in-range (+ x 2) y))))


;; Smallest three prime numbers larger than
;; 1000, 10,000, 100,000 and 1,000,000:

(search-for-primes 1000 1020)          ;; 1009    1013    1019
(search-for-primes 10000 10038)        ;; 10007   10009   10037
(search-for-primes 100000 100045)      ;; 100003  100019  100043
(search-for-primes 1000000 1000038)    ;; 1000003 1000033 1000037

;;
;; Average runtime on my machine:
;;
;;            Brute   |  Fermat  |  Ratio
;; ----------------------------------------
;; 1000    |  3       |  2       |  1.5
;; 10000   |  7       |  3       |  2.3
;; 100000  |  22      |  3       |  7.3
;; 1000000 |  69      |  4       |  17.25
;; 