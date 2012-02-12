(in-package :cl-froth.functions)

(defmethod create-default-dictionary ((d dictionary)
                                      s)
  "Return a dictionary filled with the standard words."

  (add-word-dict d "dup"    (lambda () (push-stack s (peek-stack s))))
  (add-word-dict d "+"      (lambda () (push-stack s (+ (pop-stack s) (pop-stack s)))))

  (add-word-dict d "-"      (lambda () (push-stack s (let* ((a (pop-stack s)) (b (pop-stack s)))
                                                  (- b a)))))

  (add-word-dict d "*"      (lambda () (push-stack s (* (pop-stack s) (pop-stack s)))))
  (add-word-dict d "/"      (lambda () (push-stack s (let* ((a (pop-stack s)) (b (pop-stack s)))
                                                  (/ b a)))))

  (add-word-dict d "swap"   (lambda () (let ((a (pop-stack s)) (b (pop-stack s)))
                                    (push-stack s a)
                                    (push-stack s b))))

  (add-word-dict d ">"      (lambda () (push-stack s (< (pop-stack s) (pop-stack s)))))
  (add-word-dict d "<"      (lambda () (push-stack s (> (pop-stack s) (pop-stack s)))))
  (add-word-dict d "="      (lambda () (push-stack s (= (pop-stack s) (pop-stack s)))))
  (add-word-dict d "."      (lambda () (format t "~a~%" (pop-stack s))))
  (add-word-dict d ".S"     (lambda () (write-line (print-stack s))))
  (add-word-dict d "0SP"    (lambda () (clear-stack s)))
  (add-word-dict d ":"      (lambda () (let* ((def (read-definition))
                                         (name (first def))
                                         (code (rest def)))
                                    (add-word-dict d name
                                                   (lambda () (loop for word in (compile-words code)
                                                            do (if (primitivep word)
                                                                   (push-stack s word)
                                                                   (funcall word))))))))

  (add-word-dict d ".\""    (lambda () (push-stack s (read-delim "\""))))
  (add-word-dict d ".("     (lambda () (push-stack s (read-delim ")"))))

  ;; TODO: finish functions
  )
