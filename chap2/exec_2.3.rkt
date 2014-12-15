#lang racket
(require "exec_2.2.rkt")
(define (make-rectangle topleft-point bottomright-point)
  (cons topleft-point bottomright-point))

(define (topleft rectangle)
  (car rectangle))
(define (bottomright rectangle)
  (cdr rectangle))

(define (width rectangle)
  (abs (- (x-point (topleft rectangle))
          (x-point (bottomright rectangle)))))

(define (height rectangle)
  (abs (- (y-point (topleft rectangle))
          (y-point (bottomright rectangle)))))

(define (perimeter rectangle)
  (* 2 (+ (width rectangle)
          (height rectangle))))

(define (size rectangle)
  (* (height rectangle)
     (width rectangle)))

(perimeter (make-rectangle (make-point 3 2) (make-point 9 9)))
(size (make-rectangle (make-point 3 2) (make-point 9 9)))
