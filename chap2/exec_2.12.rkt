#lang racket
(require "exec_2.7-2.8.rkt")
(define (make-center-width c w)
  (make-interval (- c w) (+ c w)))

(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))

(define (width i)
  (/ (- (upper-bound i) (lower-bound i)) 2))

(define (make-center-percent center percent)
  (let ((interval (* center (/ percent 100.0))))
    (make-interval (- center interval) (+ center interval))))

(define (percent i)
  (* (/ (width i) (center i)) 100))

(define node (make-center-percent 5 50))
(lower-bound node)
(upper-bound node)
(center node)
(percent node)
