(define nil '())
(define (square-list items)
  (if (null? items)
      nil
      (cons (* (car items) (car items)) (square-list (cdr items)))))

(square-list (list 1 3 4 5))

(define (square-list items)
  (map (lambda (x) (* x x)) items))

(square-list (list 2 3 5 8))
