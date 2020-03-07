;; Exercise 1-16

(define (even? n)
  (= (remainder n 2) 0))

(define (square n) (* n n))

(define (fast-expt-rec b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt-rec b (/ n 2))))
        (else (* b (fast-expt-rec b (- n 1))))))

(define (fast-expt b n)
  (define (iter b n a)
    (cond ((= n 0) a)
          ((even? n) (iter (square b) (/ n 2) a))
          (else (iter b (- n 1) (* a b)))))
  (iter b n 1))

;; Test if two procedures have equal results
;; on specific base with a specific range
(define (test b limit)
  (define (iter counter)
    (cond ((> counter limit) #t)
          ((= (fast-expt b counter)
              (fast-expt-rec b counter))
           (iter (+ counter 1)))
          (else #f)))
  (iter 0))