; Exercise 1-05

(define (p) (p))

(define (test x y)
  (if (= x 0) 0 y))

(test 0 (p))

; If the interpreter uses applicative-order evaluation
; the interpreter would go into infinite loop on
; evaluating the test expression, since the interpter
; would evaluate the combinations operands before
; the application. The second operand is itself an
; application of the p procedure, but since p a recursive
; procedure without any condition to stop the recursion,
; the interpter would stuck.

; If the interpreter uses normal-order evaluation
; the intepreter evaluate the test expression to
; zero. The test expression would expand to:

(if (= 0 0) 0 (p))

(if #t 0 (p)) ; => 0

; the if semantics short circuits the evaluation of
; the alternative expression if the condtion hold
; true, so in this case the the alternative expression
; is not evaluated and the intepreters just evaluate
; the 0 literal, returning 0 as the value of the
; expression.