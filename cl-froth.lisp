(in-package :cl-froth)

(defun prompt (p)
  (format *query-io* "~a " p)
  (force-output *query-io*))

(defun slurp-file (stream)
  "Efficiently read a file all at once"
  (let ((seq (make-array (file-length stream) :element-type 'character :fill-pointer t)))
    (setf (fill-pointer seq) (read-sequence seq stream))
    seq))

(defun do-file (name)
  "Evaluates a file."
  (handler-case
      (with-open-file (file name)
        ;; evaluate the file here
        (format t "Pretend I just evaluated this: ~a~%" (slurp-file file)))
    (error () (format t "Can't open file: ~a, skipping...~%" name))))

(defun make-repl ()
  "Creates an interative REPL"

  (loop for word = (progn (prompt ">") (read-word))
     until (null word)

     do (handler-case
            (progn
              (if (numberp word)
                  (evaluate-word word)
                  (evaluate-word (get-word word)))
              (format t "=> ~a~%" (peek-stack *stack*)))
          (error (e) (format t "~a~%" e)))))

(defun main()

  (create-default-dictionary *dictionary* *stack*)

  (format t "ARGV => ~a~%" *argv*)

  ;; program name is given as first arg, so ignore that
  ;; currently explodes on clisp, so sbcl only for now
  #+sbcl (loop for file-name in (rest *argv*) do (do-file file-name))

  (make-repl))
