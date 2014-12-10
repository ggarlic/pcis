#lang scheme

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
  (if (fast-prime? n 10)
      (report-prime (- (runtime) start-time)) #f))


(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

;; fermat test
(define (expmod base exp m)  
  (cond ((= exp 0) 1)  
    ((even? exp)   
     (remainder (square (expmod base (/ exp 2) m))  
            m))  
    (else  
     (remainder (* base (expmod base (- exp 1) m))  
            m))))  

(define (fermat-test n)  
  (define (try-it a)  
    (= (expmod a n n ) a))  
  (try-it (+ 1 (random (- n 1)))))  

;; i don't trust result of only test 1 time!
(define (fast-prime? n times)  
  (cond ((= times 0) true)  
        ((fermat-test n) (fast-prime? n (- times 1)))  
        (else false)))  


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
(search-for-primes 1000000 3)
(search-for-primes 10000000 3)

