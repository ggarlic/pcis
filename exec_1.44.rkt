#lang racket
(require "exec_1.43.rkt")

(define dx 0.0001)
(define (average . numbers)
        (/ (apply + numbers) (length numbers)))
(define (square x) (* x x))

(define (smooth f)
  (lambda (x)
    (average (f (- x dx))
             (f x)
             (f (+ x dx)))))

((smooth square) 5)

(define (smooth-n f n)
  ((repeated smooth n) f))

((smooth-n square 4) 5)
