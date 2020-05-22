;; Exercise 1-34

(define (f g) (g 2))

(f f)

;; This will produce an error on the application of the
;; inner g (which is f), since it will try to apply the
;; literal 2 as a procedure.

;; (f f) -> (f 2) -> (2 2)