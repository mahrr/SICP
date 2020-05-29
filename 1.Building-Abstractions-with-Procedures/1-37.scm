;; Exercise 1-37

;; k-term finite continued fraction

;; (a)
(define (cont-frac n d k)
  (define (recur i)
    (if (> i k)
        0
        (/ (n i) (+ (d i) (recur (+ i 1))))))
  (recur 1))

;;
;; 1/φ                                                ~= 0.6180339887498948
;; (cont-frac (lambda (x) 1.0) (lambda (x) 1.0) 11.0) ~= 0.6180555555555556
;; (cont-frac (lambda (x) 1.0) (lambda (x) 1.0) 38.0) ~= 0.6180339887498948
;;
;; k must be 11 in order to get an approximation
;; that is accurate to 4 decimal places.
;;

;; (b)
(define (cont-frac-iter n d k)
  (define (iter i result)
    (if (= i 0)
        result
        (iter (- i 1)
              (/ (n i) (+ (d i) result)))))
  (iter k 0))