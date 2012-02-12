;; froth compiler and related functions

(in-package :cl-froth.compile)

(defun compile-words (words)
  "Takes a list of words, evaluating the immediate ones."
  (loop for word in words
     collect (if (primitivep word)
                 word
                 (let ((def (get-word word)))
                   (if (rest def)
                       ;; if immediate, evaluate now
                       (funcall (first def))

                       ;; otherwise just collect the function
                       (first def))))))

(defun evaluate-word (word)
  "Evaluates a given word."

  (if (atom word)
      ;; push immediate values onto the stack
      (push-stack *stack* word)

      (let ((fun (first word)))
        (funcall fun))))
