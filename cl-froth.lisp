(in-package :cl-froth)

(defun prompt (p)
  (format *query-io* "~a > " p)
  (force-output *query-io*))

(defun init ()
  (prompt "Type some words")

  (loop for word = (read-word)
     until (null word)
     do (format t "~a~%" word)))
