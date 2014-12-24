#lang racket
(define nil '())
(define (reverse l)
  (if (null? l) l
      ;(append (reverse (cdr l)) (cons (car l) nil))
      (append (reverse (cdr l)) (list (car l)) )
      ))
(reverse (list 1 2 3 4))
(reverse '())
