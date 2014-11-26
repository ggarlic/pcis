;; hey racket, why you don't have 'double' and 'halve'
(define (double a)
  (+ a a))

(define (halve a)
  (/ a 2))

(define (fast-multi a b)
  (cond ((= b 0) 0)
        ((even? b) (double (fast-multi a (halve b))))
        ;;odd
        (else (+ a (fast-multi a (- b 1))))))

(fast-multi 3 6)
