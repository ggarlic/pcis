#lang racket
(require "exec_1.42.rkt")
(provide repeated)
(define (repeated f n)
    (if (= n 1) f
        (compose f (repeated f (- n 1)))))
((repeated (lambda (x) (* x x)) 2) 5)
