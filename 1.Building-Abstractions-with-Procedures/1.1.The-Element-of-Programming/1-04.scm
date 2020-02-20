; Exercise 1-04

(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

; This procedure add the absolute value of b to a.
; It relies on the fact that the operator of a
; combination is evaluated before the application,
; in this case the operator value is determined
; based on wether or not value of the first argument
; b is larger greater than zero. If it's the operation
; is an addition, otherwise it's a subtraction. 