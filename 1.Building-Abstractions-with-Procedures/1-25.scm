(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m)) m))
        (else
         (remainder (* base (expmod base (- exp 1) m)) m))))


(define (fast-exp base exp)
  (cond ((= exp 0) 1)
        ((even? exp) (square (fast-exp base (/ exp 2))))
        (else (* base (fast-exp base (- exp 1) m)))))

(define (expmod-2 base exp m)
  (remainder (fast-exp base exp) m))

;;
;; It's correct, but on my machine, it doesn't have
;; the same performance as the first method, in fact
;; it's even much slower than the brute force verson
;; of the algorithm. My guess is that because it have
;; to compute very large numbers, and the represenation
;; of these numbers is not a native machine int, it's
;; some sort of bigint, and operations on these data
;; structures may have a big performance cost.
;;
;;
;; Average runtime on my machine:
;;
;;         |  Brute   |  Old-Fermat  |  New-Fermat
;; -------------------------------------------------
;; 1000    |  3       |  2           |  17
;; 10000   |  7       |  3           |  400
;; 100000  |  22      |  3           |  19260
;; 1000000 |  69      |  4           |  621226
;; 