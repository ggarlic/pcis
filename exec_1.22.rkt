;; racket don't have a runtime primitive
(define (runtime) (current-inexact-milliseconds))

;; racket don't have square procedure
(define (square n)
  (* n n))

;; copied from question :D
(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) start-time)) #f))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

;; copied from page 33  :D
(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
	((divides? test-divisor n) test-divisor)
	(else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

;; the main body of this question
(define (next-odd n)
  (if (even? n)
      (+ n 1)
      n))

(define (even? n)
  (= 0 (remainder n 2)))

(define (search-for-primes start count)
  (cond ((= count 0)
         (newline)
         (display "finish\n"))
        ((timed-prime-test (next-odd start))
         (search-for-primes (+ (next-odd start) 2) (- count 1)))
        (else (search-for-primes (+ (next-odd start) 2) count))))

(search-for-primes 10 3)
(search-for-primes 10000 3)
(search-for-primes 100000 3)
(search-for-primes 10000000000 3)

