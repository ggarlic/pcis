#lang racket

(define (close-enough? v1 v2)
  (< (/ (abs (- v1 v2)) v2) 0.000001))

(define (iteractive-improve close-enough? improve)
  (lambda (x)
    (let ((improved-x (improve x)))
      (if (close-enough? x improved-x) x
          ((iteractive-improve close-enough? improve) improved-x)))))

(define (sqrt x)
  ((iteractive-improve (lambda (y) (/ (+ (/ x y) y) 2))
                       close-enough?)
   1.0))

(define (fixed-point f first-guess)
  ((iteractive-improve f close-enough?) first-guess))
