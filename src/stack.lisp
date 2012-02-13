(in-package :cl-froth.stack)

(defclass stack ()
  ((stk :initform '())))

(defvar *stack* (make-instance 'stack) "Global stack.")

(defun push-stack (st value)
  (setf (slot-value st 'stk) (append (slot-value st 'stk) (list value))))

(defun print-stack (st)
  (format nil "~{~a ~}" (slot-value st 'stk)))

(defun pop-stack (st)
  ;; when list is empty
  (when (eq nil (slot-value st 'stk)) (error "Stack is empty"))

  (let* ((s (slot-value st 'stk))
         (l (first (last s))))
    (setf (slot-value st 'stk) (butlast s))
    l))

(defun peek-stack (st)
  (first (last (slot-value st 'stk))))

(defun clear-stack (st)
  (setf (slot-value st 'stk) '()))
