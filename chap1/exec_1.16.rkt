(define (fast-expt b n)
  (fast-expt-iter b n 1))

(define (fast-expt-iter b n product)
  (cond ((= n 0) product)
	((even? n) (fast-expt-iter (* b b) (/ n 2) product))
	;; odd
	(else (fast-expt-iter b (- n 1) (* product b)))))

(fast-expt 3 5)
(fast-expt 3 0)
(fast-expt 5 4)
