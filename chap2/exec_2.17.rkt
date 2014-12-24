(define (last-pair x)
  (let ((rest (cdr x)))
    (if (null? rest) x (last-pair rest))))

(last-pair (list 1 2 9 8 7))
