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

(defun read-word- ()
  "Helper function for read-word"

  ;; skip any leading whitespace
  (loop for ws = (peek-char nil *reader-source*)
     while (and (characterp ws) (whitespacep ws) (listen *reader-source*))
     do (read-char *reader-source*))

  (concatenate
   'string '()
   ;; read until a whitespace or eof is hit
   (loop for char = (read-char *reader-source*)
      while (not (or (null char)
                     (whitespacep char)))
      collect char)))

(defun read-word (&optional interactive)
  "Reads next available word from the reader."

  (when interactive
    (prompt ">"))

  (let ((word (read-word-)))
    ;; try to parse word as number, if this fails, just return the word
    (handler-case
        (parse-integer word)
      (parse-error () word))))

(defun read-definition ()
  "Reads a function definition"

  (loop for word = (read-word)
     until (or (null word) (and (stringp word) (string= word ";")))
     collect word))

(defun read-delim (delim)
  "Returns a string delimited by CHARACTER delim. Consumes the delimiter"

  (concatenate
   'string '()

   (loop for char = (read-char *reader-source*)
      while (and (characterp char)
                 (lambda () (char-not-equal char delim)))
      collect char)))
