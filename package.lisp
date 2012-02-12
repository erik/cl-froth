(defpackage :cl-froth.core
  (:use :common-lisp)
  (:export

   ;; functions
   :read-word
   :read-string
   :read-definition
   :primitivep

   ;; vars
   :*reader-source*))

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
   :cl-froth.compile)

  (:export
   :create-default-dictionary))

(defpackage :cl-froth
  (:use :common-lisp
        :cl :cl-froth.core
        :cl-froth.compile
        :cl-froth.dictionary
        :cl-froth.stack
        :cl-froth.functions)
  (:export :main))

