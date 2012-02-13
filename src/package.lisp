(defpackage :cl-froth.wrappers
  (:use :common-lisp)
  (:export
   :quit-application
   :get-args
   :*argv*))

(defpackage :cl-froth.core
  (:use :common-lisp :cl-froth.wrappers)
  (:export

   ;; functions
   :primitivep
   :whitespacep
   :prompt

   ;; vars
   :*reader-source*))

(defpackage :cl-froth.reader
  (:use :common-lisp :cl-froth.core)
  (:export

   ;; functions
   :read-word
   :read-string
   :read-definition
   :read-delim))

(defpackage :cl-froth.dictionary
  (:use :common-lisp)
  (:export
   ;; vars
   :*dictionary*

   ;; classes
   :dictionary

   ;; functions
   :add-word
   :remove-word
   :get-word

   :add-word-dict
   :remove-word-dict
   :get-word-dict))

(defpackage :cl-froth.stack
  (:use :common-lisp)
  (:export
   ;; vars
   :*stack*

   ;; classes
   :stack

   ;; functions
   :push-stack
   :pop-stack
   :peek-stack
   :print-stack
   :clear-stack
   ))

(defpackage :cl-froth.compile
  (:use
   :common-lisp
   :cl-froth.stack
   :cl-froth.dictionary
   :cl-froth.core)
  (:export

   :evaluate-word
   :compile-words))

(defpackage :cl-froth.functions
  (:use
   :common-lisp
   :cl-froth.dictionary
   :cl-froth.stack
   :cl-froth.core
   :cl-froth.compile
   :cl-froth.wrappers
   :cl-froth.reader)

  (:export
   :create-default-dictionary))

(defpackage :cl-froth
  (:use :common-lisp
        :cl :cl-froth.core
        :cl-froth.compile
        :cl-froth.dictionary
        :cl-froth.stack
        :cl-froth.reader
        :cl-froth.functions
        :cl-froth.wrappers)
  (:export
   :main))

