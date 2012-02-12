(in-package :cl-froth.stack)

(defclass stack ()
  ((stk :initform '())))

(defvar *stack* (make-instance 'stack) "Global stack.")

(defmethod push-stack ((st stack) value)
  (setf (slot-value st 'stk) (append (slot-value st 'stk) (list value))))

(defmethod print-stack ((st stack))
  (format nil "~{~a ~}" (slot-value st 'stk)))

(defmethod pop-stack ((st stack))
  ;; when list is empty
  (when (eq nil (slot-value st 'stk)) (error "Stack is empty"))

  (let* ((s (slot-value st 'stk))
         (l (first (last s))))
    (setf (slot-value st 'stk) (butlast s))
    l))

(defmethod peek-stack ((st stack))
  (first (last (slot-value st 'stk))))

(defmethod clear-stack ((st stack))
  (setf (slot-value st 'stk) '()))
