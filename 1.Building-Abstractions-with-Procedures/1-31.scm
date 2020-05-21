;; Exercise 1-31

(define (product term a next b)
  (if (> a b)
      1
      (* (term a) (product term (next a) next b))))

(define (fact n)
  (product (lambda (x) x) 1 (lambda (x) (+ x 1)) n))

(define (product-iter term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* (term a) result))))
  (iter a 1))

;; Calculate PI approximation using John Wallis' formula with product

(define (pi-term n) 
  (if (even? n) 
      (/ (+ n 2) (+ n 1)) 
      (/ (+ n 1) (+ n 2)))) 

(define (PI steps)
  (* 4 (product pi-term 1 (lambda (x) (+ x 1)) steps)))