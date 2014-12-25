#lang racket
(define x (list (list 1 2) (list 3 4)))
(define nil '())
(define (deep-reverse lst)
  (cond ((not (pair? lst)) lst) ;; both nil and leaf
        (else
         (append (deep-reverse (cdr lst))
                 (list (deep-reverse (car lst)))))))

(deep-reverse x)
(deep-reverse '((4 3) 2 1))
