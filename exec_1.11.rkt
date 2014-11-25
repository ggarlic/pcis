;; recursion edition
(define (wtf x)
  (cond ((< x 3) x)
        (else (+ (wtf (- x 1))
                 (* 2 (wtf (- x 2)))
                 (* 3 (wtf (- x 3)))))))
(wtf 1)
(wtf 2)
(wtf 3)
(wtf 4)

;; iteration edition
(define (wtf-iter x y z count)
  (if (= count 0)
      z
      (wtf-iter (+ x (* 2 y) (* 3 z)) x y (- count 1))))
(define (new-wtf n)
  (wtf-iter 2 1 0 n))
(new-wtf 1)
(new-wtf 2)
(new-wtf 3)
(new-wtf 4)
