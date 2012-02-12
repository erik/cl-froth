(defpackage :cl-froth.dictionary
  (:use :common-lisp)
  (:export
   ;; classes
   :dictionary

   ;; functions
   :add-word
   :remove-word
   :get-word))

(defpackage :cl-froth.stack
  (:use :common-lisp)
  (:export
   ;; classes
   :stack

   ;; functions
   :push-stack
   :pop-stack
   :peek-stack
   :clear-stack))

(defpackage :cl-froth.functions
  (:use :common-lisp :cl-froth.dictionary :cl-froth.stack)
  (:export
   :create-default-dictionary))

(defpackage :cl-froth.core
  (:use :common-lisp)
  (:export

   ;; functions
   :read-word
   :read-string
   :read-definition

   ;; vars
   :*reader-source*))

(defpackage :cl-froth
  (:use :common-lisp :cl :cl-froth.core)
  (:export :main))

