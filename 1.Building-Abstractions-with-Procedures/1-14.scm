;; Exercise 1-14

(define (first-denomination kind-of-coins)
    (cond ((= kind-of-coins 1) 1)
          ((= kind-of-coins 2) 5)
          ((= kind-of-coins 3) 10)
          ((= kind-of-coins 4) 25)
          ((= kind-of-coins 5) 50)))

(define (count-change amount)
  (define (cc amount kind-of-coins)
    (cond ((= amount 0) 1)
          ((or (< amount 0) (= kind-of-coins 0)) 0)
          (else (+ (cc amount (- kind-of-coins 1))
                   (cc (- amount (first-denomination kind-of-coins))
                       kind-of-coins)))))
  (cc amount 5))

;; (count-change 11)
;;
;; (cc 11 5)
;; (+ (cc 11 4) (cc -39 5))
;; (+ (cc 11 4) 0)
;; (+ (+ (cc 11 3) (cc -14 4)) 0)
;; (+ (+ (cc 11 3) 0) 0)
;; (+ (+ (+ (cc 11 2) (cc 1 3)) 0) 0)
;; (+ (+ (+ (cc 11 2) (+ (cc 1 2) (cc -9 3)) 0) 0) 0)
;; (+ (+ (+ (cc 11 2) (+ (cc 1 2) 0) 0) 0) 0)
;; (+ (+ (+ (cc 11 2) (+ (+ (cc 1 1) (cc -4 2)) 0) 0) 0) 0)
;; (+ (+ (+ (cc 11 2) (+ (+ (cc 1 1) 0) 0) 0) 0) 0)
;; (+ (+ (+ (cc 11 2) (+ (+ (+ (cc 1 0) (cc 0 1)) 0) 0) 0) 0) 0)
;; (+ (+ (+ (cc 11 2) (+ (+ (+ 0 1) 0) 0) 0) 0) 0)
;; (+ (+ (+ (cc 11 2) 1) 0) 0)
;; (+ (+ (+ (+ (cc 11 1) (cc 1 2)) 1) 0) 0)
;; (+ (+ (+ (+ (cc 11 1) (+ (cc 1 1) 0)) 1) 0) 0)
;; (+ (+ (+ (+ (cc 11 1) (+ (+ (cc 1 0) (cc 0 1)) 0)) 1) 0) 0)
;; (+ (+ (+ (+ (cc 11 1) (+ (+ 0 1) 0)) 1) 0) 0)
;; (+ (+ (+ (+ (cc 11 1) 1) 1) 0) 0)
;; (+ (+ (+ (+ (+ (cc 11 0) (cc 10 1)) 1) 1) 0) 0)
;; (+ (+ (+ (+ (+ (cc 11 0) (+ (cc 10 0) (cc 9 1))) 1) 1) 0) 0)
;; (+ (+ (+ (+ (+ (cc 11 0) (+ (cc 10 0) (+ (cc 9 0) (cc 8 1)))) 1) 1) 0) 0)
;; (+ (+ (+ (+ (+ (cc 11 0) (+ (cc 10 0) (+ (cc 9 0) (+ (cc 8 0) (cc 8 1))))) 1) 1) 0) 0)
;; (+ (+ (+ (+ (+ (cc 11 0) (+ (cc 10 0) (+ (cc 9 0) (+ (cc 8 0) (+ (cc 7 0) (cc 7 1)))))) 1) 1) 0) 0)
;; (+ (+ (+ (+ (+ (cc 11 0) (+ (cc 10 0) (+ (cc 9 0) (+ (cc 8 0) (+ (cc 7 0) ... (cc 0 1)))))) 1) 1) 0) 0)
;; (+ (+ (+ (+ 1 1) 1) 0) 0)
;; (+ (+ 2 1) 0) 0)
;; (+ (+ 3 0) 0)
;; (+ 3 0)
;; 3

;; Or you just can ...

(define (count-change-traced amount)
  (define (trace amount kind-of-coins)
    (display `(+ (cc ,amount ,(- kind-of-coins 1))
                 (cc ,(- amount (first-denomination kind-of-coins))
                     ,kind-of-coins)))
    (display "\n"))
  (define (indent level)
    (if (= level 0)
        nil
        (begin
          (display "   |")
          (indent (- level 1)))))
  (define (cc amount kind-of-coins level)
    (indent level)
    (cond ((= amount 0) (display "1\n") 1)
          ((or (< amount 0) (= kind-of-coins 0)) (display "0\n") 0)
          (else 
           (trace amount kind-of-coins)
           (+ (cc amount (- kind-of-coins 1) (+ level 1))
                   (cc (- amount (first-denomination kind-of-coins))
                       kind-of-coins (+ level 1))))))
  (cc amount 5 0))

(count-change-traced 11)

;; Space -> O(n)
;; Steps -> ??