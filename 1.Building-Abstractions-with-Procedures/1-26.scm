(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (* (expmod base (/ exp 2) m)
                       (expmod base (/ exp 2) m)) m))
        (else
         (remainder (* base (expmod base (- exp 1) m)) m))))

;;
;; It's not the same, becuase the call stack form a tree of
;; calls, as the expression (expmod base (/ exp 2) m) is
;; evaluated twice on every even exp, unlike the square
;; version, where this expression is evaluated once as an
;; argument to the square procedure.
;;
;; Observing the number of procedure calls of every exp argument:
;;
;; exp |  #calls
;; -------------
;; 2   |  2
;; 3   |  3
;; 4   |  6  *
;; 5   |  7
;; 7   |  9
;; 8   |  14 *
;; 9   |  15
;; 10  |  16
;; 11  |  17
;; 12  |  18
;; 13  |  19
;; 14  |  20
;; 15  |  21
;; 16  |  30 *
;; 17  |  31
;; ...
;; 30  |  44
;; 31  |  45
;; 32  |  62 *
;;
;; The number of calls is roughly linear with exp.
;; An interesting property is that in powers of two
;; exp, the number of calls is the double of previous
;; number of calls from the previous double of two
;; exp plus two, notice the marked rows with '*'.
;;
;; Average runtime on my machine:
;;
;;            Brute   |  Fermat  |  Fermat with O(n) expmod
;; --------------------------------------------------------------
;; 1000    |  3       |  2       |  127
;; 10000   |  7       |  3       |  1349
;; 100000  |  22      |  3       |  11914
;; 1000000 |  69      |  4       |  110044
;; 