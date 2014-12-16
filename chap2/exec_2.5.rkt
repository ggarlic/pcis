(define (my-cons x y)
  (* (expt 2 x)
     (expt 3 y)))

(define (my-car z)
  (if (= 0 (remainder z 2))
      (+ 1 (my-car (/ z 2)))
      0))

(define (my-cdr z)
  (if (= 0 (remainder z 3))
      (+ 1 (my-cdr (/ z 3)))
      0))

(define z (my-cons 8 7))
(my-car z)
(my-cdr z)
