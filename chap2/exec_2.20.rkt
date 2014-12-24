(define (same-parity a . b)
  (filter (if (even? a) even? odd?) (cons a b)))

(same-parity 1 2 3 4 5 6 7)
