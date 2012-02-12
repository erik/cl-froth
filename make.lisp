#- (or sbcl clisp) (error "This lisp implementation isn't supported.")

(require 'asdf)
(asdf:oos 'asdf:load-op 'cl-froth)

#+sbcl
(sb-ext:save-lisp-and-die "cl-froth"
                          :toplevel (lambda ()
                                      (sb-posix:putenv (format nil "SBCL_HOME=~A" #.(sb-ext:posix-getenv "SBCL_HOME")))
                                      (cl-froth:main)
                                      (sb-ext:quit))
                          :executable t)
#+clisp
(ext:saveinitmem "cl-froth"
                 :init-function (lambda ()
                                  (cl-froth:main)
                                  (ext:quit))
                 :executable t :keep-global-handlers t :norc t)

