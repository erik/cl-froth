;;;; -*- Mode: Lisp; Syntax: ANSI-Common-Lisp; Base: 10 -*-

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

    :components ((:file "package")
                 (:file "stack")
                 (:file "dictionary")
                 (:file "functions")
                 (:file "cl-froth")
                 (:file "core")
                 (:file "compile")))
