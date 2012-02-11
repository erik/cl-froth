;;;; core froth functionality

(in-package :cl-froth.core)

(defvar *reader-source* *standard-input*
  "Input source for reader, defaulting to stdin.")

(defun whitespacep (c)
  "Returns true if the Lisp character CHAR is whitespace"
  (member c '(#\Space #\Tab #\Newline) :test #'char=))

(defun read-word- ()
  "Helper function for read-word"

  ;; skip any leading whitespace
  (loop for ws = (peek-char nil *reader-source*)
     while (whitespacep ws)
     do (read-char *reader-source*))

  (concatenate
   'string '()
   ;; read until a whitespace or eof is hit
   (loop for char = (read-char *reader-source*)
      while (not (or (null char)
                     (whitespacep char)))
      collect char)))

(defun read-word ()
  "Reads next available word from the reader."

  (let ((word (read-word-)))
    ;; try to parse word as number, if this fails, just return the word
    (handler-case
        (parse-integer word)
      (parse-error () word))))

(defun read-definition (words)
  "Reads a function definition"

  (loop for word = (read-word)
     until (or (null word) (string= word ";"))
     collect word))

(defun read-delim (delim)
  "Returns a string delimited by CHARACTER delim. Consumes the delimiter"

  (concatenate
   'string '()

   (loop for char = (read-char *reader-source*)
      while (lambda () (char-not-equal char delim))
      collect char)))