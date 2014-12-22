; 2.7
(define (upper-bound x)
  (let ((head (car x))
	(tail (cdr x)))
    (if (> head tail) head tail)))

(define (lower-bound x)
  (let ((head (car x))
	(tail (cdr x)))
    (if (< head tail) head tail)))

(define (make-interval a b) (cons a b))

(upper-bound (make-interval 3 8))

; 2.8
(define (sub-interval x y)
  (make-interval (- (lower-bound x) (upper-bound y))
		 (- (upper-bound x) (lower-bound y))))
(sub-interval (make-interval 4 5) (make-interval 1 2))

