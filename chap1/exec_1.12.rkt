#lang scheme
;;recursion version
(define (pascal row col)
  (cond ((> col row) (display "wrong\n"))
   ((or (= col 0) (= row col))
         1)
        (else (+ (pascal (- row 1) (- col 1))
                 (pascal (- row 1) col)))))
(pascal 5 0)
(pascal 5 1)
(pascal 5 2)
(pascal 5 3)
(pascal 5 4)
(pascal 5 5)
(pascal 5 6)

;; iteration edition
;; 'factorial' is copied from sec. 1.2.1
(define (factorial n)
  (fac-iter 1 1 n))

(define (fac-iter product counter max-count)
  (if (> counter max-count)
      product
      (fac-iter (* counter product)
                 (+ counter 1)
                 max-count)))
(define (pascal-iter row col)
  (cond ((> col row) (display "wrong\n"))
	(else (/ (factorial row)
		 (* (factorial col)
		    (factorial (- row col)))))))
(pascal-iter 5 0)
(pascal-iter 5 1)
(pascal-iter 5 2)
(pascal-iter 5 3)
(pascal-iter 5 4)
(pascal-iter 5 5)
(pascal-iter 5 6)
