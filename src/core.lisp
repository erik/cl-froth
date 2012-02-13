;;;; core froth functionality

(in-package :cl-froth.core)

(defvar *reader-source* *standard-input*
  "Input source for reader, defaulting to stdin.")

(defun prompt (p)
  (format *query-io* "~a " p)
  (force-output *query-io*))

(defun whitespacep (c)
  "Returns true if the Lisp character CHAR is whitespace"
  (member c '(#\Space #\Tab #\Newline) :test #'char=))

(defun primitivep (type)
  "Returns true if the type given is a froth primitive value."
  (or (numberp type)
      ;; TODO: probably some other primitives
      ))
