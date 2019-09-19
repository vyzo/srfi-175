#!r6rs
;; Automatically generated
(import (rnrs) (ascii))
(define (hex-digit char)
  (or (ascii-digit-value char 10)
      (ascii-upper-case-value char 10 6)
      (ascii-lower-case-value char 10 6)))
(define (caesar-char rot char)
  (or
   (let ((n (ascii-upper-case-value char rot 26)))
     (and n (ascii-nth-upper-case n)))
   (let ((n (ascii-lower-case-value char rot 26)))
     (and n (ascii-nth-lower-case n)))
   char))
(define (caesar rotation s)
  (let loop ((i 0) (chars '()))
    (if (fx=? i (string-length s))
        (list->string (reverse chars))
        (let ((char (string-ref s i)))
          (loop (fx+ i 1) (cons (caesar-char rotation char) chars))))))
(define (strings byte-port)
  (define (disp stride)
    (when (fx>=? (length stride) 4)
      (display (list->string (map integer->char (reverse stride))))
      (newline)))
  (let loop ((stride '()))
    (let ((byte (get-u8 byte-port)))
      (cond ((eof-object? byte) (disp stride))
            ((not (ascii-display? byte)) (disp stride) (loop '()))
            (else (loop (cons byte stride)))))))
(define (span a b)
  (let loop ((b b) (acc '()))
    (if (fx<? b a) acc (loop (fx- b 1) (cons b acc)))))
(define-syntax dribble
  (syntax-rules ()
    ((_ x) (begin (write 'x) (display " => ") (write x) (newline)))))
(dribble (hex-digit #\a))
(dribble (hex-digit #\0))
(dribble (hex-digit #\9))
(dribble (hex-digit #\A))
(dribble (hex-digit #\F))
(dribble (hex-digit #\G))
(dribble (ascii-nth-upper-case 0))
(dribble (ascii-nth-upper-case -1))
(dribble (ascii-nth-lower-case 15))
(dribble (caesar -55 (caesar 55 "hello world")))
(dribble (call-with-port (open-file-input-port "/bin/ls") strings))