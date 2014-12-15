#lang racket
(provide make-point x-point y-point)
(define (make-point x y)
  (cons x y))

(define (x-point point) (car point))
(define (y-point point) (cdr point))

(define (print-point point)
  (newline)
  (display "(")
  (display (x-point point))
  (display ",")
  (display (y-point point))
  (display ")"))

(define (make-segment start-point end-point)
  (cons start-point end-point))

(define (start-segment segment)
  (car segment))

(define (end-segment segment)
  (cdr segment))

(define (midpoint-segment segment)
  (define (average a b) (/ (+ a b) 2.0))
  (let ((s (start-segment segment))
	(e (end-segment segment)))
    (make-point (average (x-point s) (x-point e))
		(average (y-point s) (y-point e)))))

(define test-segment (make-segment (make-point 1 9) (make-point 5 8)))

(print-point (midpoint-segment test-segment))
