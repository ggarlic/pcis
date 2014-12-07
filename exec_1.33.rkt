#lang racket
(require racket/include)
(include "exec_1.22.rkt")
(define (filtered-accumulate combiner null-value term a next b filter)
  (if (> a b) null-value
      (if (filter a)
          (combiner (term a) (filtered-accumulate combiner null-value term (next a) next b filter))
          (combiner null-value (filtered-accumulate combiner null-value term (next a) next b filter)))))

(define (prime-sum a b)
  (filtered-accumulate + 0 (lambda (x) x) a (lambda (x) (+ x 1)) b prime?))

(prime-sum 1 10)

(define (relatively-prime? m n)
  (define (gcd m n)
    (cond ((< m n) (gcd n m))
          ((= n 0) m)
          (else (gcd n (remainder m n)))))
  (= (gcd m n) 1))

(define (product-relatively-primes n)
  (define (filter x)
    (relatively-prime? x n))
  (filtered-accumulate * 1 (lambda (x) x) 1 (lambda (x) (+ x 1)) n filter))

(product-relatively-primes 10)
