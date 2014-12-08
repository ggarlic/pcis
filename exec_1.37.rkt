#lang racket
(provide cont-frac cont-frac-iter)
(define (cont-frac n d k)
  ;; this is WRONG! for i put pair nk/dk with wrong k, the test case below is right because all the nk/dks is the same.
  ;; but when used with exec_1.38.rkt, i find this error.
  ;; (if (= k 1) 1
  ;;   (/ (n k) (+ (d k) (cont-frac n d (- k 1))))))
  (define (c-f i)
    (if (> i k) 0
        (/ (n i) (+ (d i) (c-f (+ i 1))))))
  (c-f 1))

(cont-frac (lambda (x) 1.0) (lambda (x) 1.0) 11)

;;iter ed.
(define (cont-frac-iter n d k)
  (define (iter current result)
    (cond ((= 0 current) result)
          ((< current k) (iter (- current 1) (/ (n current) (+ (d current) result))))))
  (iter (- k 1) (/ (n k) (d k))))

(cont-frac-iter (lambda (x) 1.0) (lambda (x) 1.0) 11)
