#lang racket
(require "exec_1.37.rkt")
(define (tan-cf x k)
  (cont-frac (lambda (i)
               (if (= 1 i) x
                 (- (* x x))))
             (lambda (i)
               (- (* i 2) 1))
             k))

(tan-cf 45.0 100)
(tan 45)

(tan-cf 15.0 100)
(tan 15)
