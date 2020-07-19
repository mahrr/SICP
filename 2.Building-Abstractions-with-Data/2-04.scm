;; Exercise 2-04

(define (cons x y)
  (lambda (sel) (sel x y)))

(define (car pair)
  (pair (lambda (x y) x)))

(define (cdr pair)
  (pair (lambda (x y) y)))

;; Verfing with substitution model:
;;
;; | (car (cons 1 2))
;; = (car (lambda (sel) (sel 1 2)))
;; = ((lambda (sel) (set 1 2))
;;     (lambda (x y) x))
;; = ((lambda (x y) x) 1 2)
;; = 1
