(define (cube x)
  (* x x x))

(define (even? n)
  (= (remainder n 2) 0))

(define (inc n) (+ n 1))

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
	 (sum term (next a) next b))))

(define (integral f a b dx)
  (define (add-dx x) (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b) dx))

(define (simpson-rule f a b n)
  (define h (/ (- b a) n))
  (define (yk k) (f (+ a (* h k))))
  (define (simpson-function k)
    (* (cond ((or (= k 0) (= k n)) 1)
	     ((odd? k) 4)
	     (else 2))
       (yk k)))
  ;; use 0.0 instead of 0 to get inexact number.
  ;; update 11-30-2014: i can also use (exact->inexact 0)
  (* (/ h 3) (sum simpson-function 0.0 inc n)))

(simpson-rule cube 0 1 1000)

