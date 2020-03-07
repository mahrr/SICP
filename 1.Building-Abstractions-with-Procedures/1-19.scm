;; Exercise 1-19

;; T pq:
;;       a <- bq + aq + ap      (1)
;;       b <- bp + aq           (2)
;;
;; T pq, 2 times:
;;    Let's start with b, since it has less terms.
;;    Substituting every b and a with (bp + aq) and
;;    (bq + aq + ap), respectively.
;;
;;       b <- (bp + aq)p + (bq + aq + ap)q
;;       b <- bpp + aqp + bqq + aqq + apq
;;       b <- b(pp + qq) + a(2pq + qq)
;;
;;    From (2)
;;       b <- bp + aq
;;    then
;;       p` = (pp + qq), q` = (2pq + qq)
;;
;;    Doing the same with a.
;;       a <- (bp + aq)q + (bq + aq + ap)q + (bq + aq + ap)p
;;       a <- bpq + aqq + bqq + aqq + apq + bpq + apq + app
;;       a <- b(2pq + qq) + a(qq + qq + 2pq + pp)
;;       a <- b(2pq + qq) + a(2pq + qq) + a(pp + qq)
;;
;;    From (1)
;;       a <- bq + aq + ap
;;    then
;;       p` = (pp + qq), q` = (2pq + qq)
;;

(define (even? x)
  (= (remainder x 2) 0))

(define (fib n)
  (fib-iter 1 0 0 1 n))

(define (fib-iter a b p q count)
  (cond ((= count 0) b)
        ((even? count)
         (fib-iter a
                   b
                   (+ (* p p) (* q q))
                   (+ (* p q 2) (* q q))
                   (/ count 2)))
        (else (fib-iter (+ (* b q) (* a q) (* a p))
                        (+ (* b p) (* a q))
                        p
                        q
                        (- count 1)))))

