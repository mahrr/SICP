;; Exercise 1-33

(define (filtered-accumulate predicate combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a)
              (if (predicate a)
                  (combiner (term a) result)
                  result))))
  (iter a null-value))

;; (a)
(define (sum-primes a b)
  (filtered-accumulate prime? + 0 (lambda (x) x) a (lambda (x) (+ x 1)) b))

;; (b)
(define (product-positives n)
  (define (predicate x) (and (> x 0) (= (gcd i n) 1)))
  (filtered-accumulater predicate * 1 (lambda (x) x) a (lambda (x) (+ x 1)) n)) 