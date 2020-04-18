(define (smallest-divisor n) (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor)))))

(define (next n)
  (if (= n 2) 3 (+ n 2)))

(define (square n) (* n n))

(define (divides? a b) (= (remainder b a) 0))

(define (prime? n) (= (smallest-divisor n) n))

(define (time-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
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
(search-for-primes 10000000 10000155)

;; Average runtime on my machine:
;;             Before  |  After  |  Ratio
;;            -----------------------------
;; 1000    ->  3       |  2      |  1.5
;; 10000   ->  7       |  5      |  1.4
;; 100000  ->  22      |  14     |  1.6
;; 1000000 ->  69      |  41     |  1.7
;;
;; It's not twice as fast with these ranges,
;; on average it's 1.55 faster than the old method.
;;
;; But the ratio is propotional to the number being,
;; so it might get twice as fast with very large numbers.
;;
;; On my machine, the method starts to be as twice as
;; fast with numbers larger than 10000000.