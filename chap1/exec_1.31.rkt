(define (product term a next b)
   (if (> a b)
      1
      (* (term a)
	 (product term (next a) next b))))

(define (product-term n) n)
(define (next-n n) (+ n 1))

(product product-term 1 next-n 9)

;; iter ed.
(define (iter-product term a next b)
  (define (iter a result)
    (if (> a b)
	result
	(iter (next-n a) (* (term a) result))))
  (iter a 1))

(iter-product product-term 1 next-n 9)

;;use product to define factorial
(define (factorial n)
  (product product-term 1 next-n n))

;; solve pi
(define (numberator-term n)
  (cond ((odd? n) (+ n 1))
	(else (+ n 2))))

(define (denominator-term n)
  (cond ((odd? n) (+ n 2))
	(else (+ n 1))))

(define (pi n)
  (* 4
     ;; as i said in exec 1.29
     (exact->inexact
      (/ (product numberator-term 1 next-n n)
	 (product denominator-term 1 next-n n)))))

(pi 1)
(pi 10000)
