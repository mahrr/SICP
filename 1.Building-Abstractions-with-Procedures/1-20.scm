;; Exercise 1-20

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

;; Normal-order evaluation of (gcd 206 40)
;;
;; (gcd 40 (remainder 206 40))
;;
;; (gcd (remainder 206 40) (remainder 40 (remainder 206 40)))
;;
;; (gcd (remainder 40 (remainder 206 40))
;;      (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))
;;
;; (gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
;;      (remainder (remainder 40 (remainder 206 40))
;;                 (remainder (remainder 206 40)
;;                            (remainder 40 (remainder 206 40)))))
;;
;; (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
;;
;; Number of total remainder operations:
;;  14 in evaluating the if expressions conditions
;;  04 in the final expanded expression
;;
;; Applicative-order evaluation of (gcd 206 40)
;;
;; (gcd 40 6)
;; (gcd 6 4)
;; (gcd 4 2)
;; (gcd 2 0)
;;
;; Number of total remainder operations:
;;  04 in evaluating the procedure operands
