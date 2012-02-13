;; wrappers around the various inconsistencies betweeen
;; implementations

(in-package :cl-froth.wrappers)

(export '(get-args quit-application *argv*))

(defun quit-application ()
  #+sbcl  (sb-ext:quit)
  #+clisp (exit))

(defun get-args ()
  #+sbcl  (copy-list sb-ext:*posix-argv*)
  #+clisp (coerce (ext:argv) 'list)
  #-( or sbcl clisp)
  (error "unimplemented"))

(defparameter *argv* (get-args) "Returns command line arguments")
