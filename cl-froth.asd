(defpackage #:cl-froth-asd
  (:use :cl :asdf))

(in-package :cl-froth-asd)


(defsystem cl-froth
    :name "cl-froth"
    :version "0.0.0"
    :maintainer "boredomist"
    :author "Erik Price"
    :license "WTFPL"
    :description "Common Lisp port of the froth language"

    ;;;
    :serial t

    :components ((:module src
                          :components ((:file "package")
                                       (:file "core")
                                       (:file "reader")
                                       (:file "wrappers")
                                       (:file "stack")
                                       (:file "dictionary")
                                       (:file "functions")
                                       (:file "compile")
                                       (:file "cl-froth")))))
