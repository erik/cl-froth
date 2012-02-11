#!/usr/bin/sbcl --noinform

(cl:in-package :cl-user)

(ql:quickload :cl-froth)

#+sbcl
(sb-ext:save-lisp-and-die "cl-froth" :executable t :toplevel #'cl-froth:init)


;; TODO: Other Clisp, ClozureCL, etc.

