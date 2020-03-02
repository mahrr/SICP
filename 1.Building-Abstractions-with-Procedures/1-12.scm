;; Exercise 1-12

;;                (0, 0)
;;           (1, 0)    (1, 1)
;;      (2, 0)    (2, 1)    (2, 2)
;; (3, 0)    (3, 1)    (3, 2)    (3, 3)

(define (pascal row col)
  (cond ((> col row) (error "Column number cannot exceed Row number"))
        ((or (= col 0) (= col row)) 1)
        (else (+ (pascal (- row 1) (- col 1))
                 (pascal (- row 1) col)))))
      