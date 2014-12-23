(define (div-interval x y)
  (if (< (* (lower-bound y) (upper-bound y)) 0)
    (error "error")
    (mul-interval x
      (make-interval (/ 1.0 (upper-bound y))
                     (/ 1.0 (lower-bound y))))))
