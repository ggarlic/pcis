#lang racket
(define (average . numbers)
      (/ (apply + numbers) (length numbers)))
(define tolerance 0.000001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (display guess)
    (newline)
    (let ((next (f guess)))
      (if (close-enough? guess next)
        next
        (try next))))
  (try first-guess))

(fixed-point (lambda (x) (/ (log 1000) (log x))) 10.0)
(fixed-point (lambda (x) (average x (/ (log 1000) (log x)))) 10.0)
 