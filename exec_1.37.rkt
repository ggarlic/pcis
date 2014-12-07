#lang racket
(provide cont-frac)
(define (cont-frac n d k)
  (if (= k 0) 0
      (/ (n k) (+ (d k) (cont-frac n d (- k 1))))))

(cont-frac (lambda (x) 1.0) (lambda (x) 1.0) 11)

;;iter ed.
(define (cont-frac-iter n d k)
  (define (iter current result)
    (cond ((= k current) result)
          ((< current k) (iter (+ current 1) (/ (n k) (+ (d k) result))))))
  (iter 0 0))

(cont-frac-iter (lambda (x) 1.0) (lambda (x) 1.0) 11)

