(in-package :cl-froth.functions)

(defmethod create-default-dictionary ((d cl-froth.dictionary:dictionary)
                                      (s stack))
  "Return a dictionary filled with the standard words."

  (add-word d "dup"    #'(lambda () (push-stack s (peek-stack s))))
  (add-word d "+"      #'(lambda () (push-stack s (+ (pop-stack s) (pop-stack s)))))
  (add-word d "-"      #'(lambda ()
                           (push-stack s (let* ((a (pop-stack s))
                                                (b (pop-stack s)))
                                           (- b a)))))

  (add-word d "*"      #'(lambda () (push-stack s (* (pop-stack s) (pop-stack s)))))
  (add-word d "/"      #'(lambda () (push-stack s (let* ((a (pop-stack s))
                                                    (b (pop-stack s)))
                                               (/ b a)))))

  ;; TODO: finish functions
  )
