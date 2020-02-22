;; Exercise 1-06

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
          guess
          (sqrt-iter (improve guess x) x)))


;; The interpreter will stuck in an infinite loop.
;; Since new-if is a procedure, it evaluates all
;; of its argument. In this case the else-clause
;; will always be evaluated regardess of predicate
;; evaluation result.
