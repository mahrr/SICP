;; Exercise 1-39

;; Tangent function based on Lambert’s formula

(define (cont-frac n d k)
  (define (iter i result)
    (if (= i 0)
        result
        (iter (- i 1)
              (/ (n i) (+ (d i) result)))))
  (iter k 0))


(define (tan-cf x k)
  (define (n i)
    (if (= i 1)
        x
        (- (* x x))))
  ;; The nth odd number
  (define (d i) (+ 1 (* 2 (- i 1))))
  (cont-frac n d k))
