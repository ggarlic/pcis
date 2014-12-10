#lang racket
;; for repeated
(require "exec_1.43.rkt")
;; for average
(require "exec_1.44.rkt")

(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
        ,          next
        (try next))))
  (try first-guess))

(define (average-damp f)
  (lambda (x) (average x (f x))))

(define (lg n)
  (define (iter p r)
    (if (< (- n r) 0)
      (- p 1)
      (iter (+ p 1) (* r 2))))

  (iter 1 2)) 

(define (pow base n)
  (if (= n 0) 1
    ((repeated (lambda (x) (* base x)) n) 1)))

(define (nth-root exp x)
  (fixed-point ((repeated average-damp (lg exp))
                (lambda (y) (/ x (pow y (- exp 1)))))
               1.0))
(nth-root 3 27)
