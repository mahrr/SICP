;; Exercise 1-41

(define (double f)
  (lambda (x) (f (f x))))

;; Increment '5' sixteen times -> 21
(((double (double double)) inc) 5)

;; Explanation with replacement model:
;;
;; (double double)
;; (lambda (f) (double (double f)))
;; (lambda (x) (f (f (f (f x)))))
;;
;; (double (double double)
;; (lambda (g)
;;   ((lambda (f) (double (double f))) ((lambda (f) (double (double f))) g)))
;;
;; Apply inc as argument:
;;
;; ((lambda (f) (double (double f))) ((lambda (f) (double (double f))) inc))
;;                                   |
;;                                   V
;; ((lambda (f) (double (double f))) (lambda (x) (inc (inc (inc (inc x))))))
;;                                   |
;;                                   V
;; ((lambda (f) (double (double f))) inc-4)
;; |
;; V
;; (lambda (x) (inc-4 (inc-4 (inc-4 (inc-4 x)))))
;; |
;; V
;; (inc-16)
