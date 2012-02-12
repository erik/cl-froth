(in-package :cl-froth)

(defun prompt (p)
  (format *query-io* "~a > " p)
  (force-output *query-io*))

(defun main(argv)
  (declare (ignore argv))

  (when argv
    (format t "ARGV => ~a~%" argv))

  (prompt "Type some words")

  (loop for word = (read-word)
     until (null word)
     do (format t "~a~%" word)))
