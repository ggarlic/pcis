(load "exec_1.17.rkt")

(define (mul a b)
  (mul-iter a b 0))

(define (mul-iter a b product)
  (cond ((= b 0) product)
        ((even? b) (mul-iter (double a) (halve b) product))
        ;;odd
        (else (mul-iter a (- b 1) (+ a product)))))

(mul 9 8)
(mul 3 0)
