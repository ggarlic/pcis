#lang racket
(define (inc x) (+ x 1))

(define (double term)
  (lambda (x) (term (term x))))

(((double (double double)) inc) 5)
