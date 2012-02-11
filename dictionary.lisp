(in-package :cl-froth.dictionary)

(defclass dictionary ()
  ((dict :initform (make-hash-table))))

(defmethod add-word ((d dictionary)
                     (k string)
                     (f function))
  "Adds a word to the dictionary"

  (let ((hash (slot-value d 'dict)))

    (if (null (gethash (intern k) hash))
        (setf (gethash (intern k) hash) f)
        (error (format nil "Word is already defined: ~a" k)))))


(defmethod remove-word ((d dictionary)
                        (k string))
  "Removes a word from the dictionary"

  (let ((hash (slot-value d 'dict)))

    (if (null (gethash (intern k) hash))
        (error (format nil "Word is undefined: ~a" k))
        (remhash (intern k) hash))))


(defmethod get-word ((d dictionary)
                     (k string))
  "Returns the value of the given word."

  (let ((hash (slot-value d 'dict)))

    (or (gethash (intern k) hash)
        (error (format nil "Word is undefined: ~a" k)))))
