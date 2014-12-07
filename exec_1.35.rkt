;; i'm too lazy to input the fixed-point function by hand :D
(define golden-section-point
  (fixed-point (lambda (x) (+ 1 (/ 1 x))) 1.0))
