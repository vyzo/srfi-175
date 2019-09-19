(define-library (ascii)
  (import (scheme base))
  (export ascii-char?
          ascii-control?
          ascii-display?
          ascii-whitespace?
          ascii-space-or-tab?
          ascii-punctuation?
          ascii-upper-case?
          ascii-lower-case?
          ascii-alphabetic?
          ascii-alphanumeric?
          ascii-numeric?

          ascii-digit-value
          ascii-upper-case-value
          ascii-lower-case-value
          ascii-nth-digit
          ascii-nth-upper-case
          ascii-nth-lower-case
          ascii-upcase
          ascii-downcase

          ascii-digits
          ascii-lower-case
          ascii-upper-case
          ascii-punctuation)
  (include "ascii.scm"))