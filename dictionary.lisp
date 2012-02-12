(in-package :cl-froth.dictionary)

(defclass dictionary ()
  ((dict :initform (make-hash-table))))

(defvar *dictionary* (make-instance 'dictionary) "Global dictionary")

(defmethod add-word-dict ((d dictionary)
                          (k string)
                          (f function)
                          &optional imm)
  "Adds a word to the dictionary"

  (let ((hash (slot-value d 'dict)))

    (if (null (gethash (intern k) hash))
        (setf (gethash (intern k) hash) (cons f imm))
        (error (format nil "Word is already defined: ~a" k)))))

(defun add-word (k f &optional imm)
  (add-word-dict *dictionary* k f imm))

(defmethod remove-word-dict ((d dictionary)
                             (k string))
  "Removes a word from the dictionary"

  (let ((hash (slot-value d 'dict)))

    (if (null (gethash (intern k) hash))
        (error (format nil "Word is undefined: ~a" k))
        (remhash (intern k) hash))))

(defun remove-word (k)
  (remove-word-dict *dictionary* k))


(defmethod get-word-dict ((d dictionary)
                          (k string))
  "Returns the value of the given word."

  (let ((hash (slot-value d 'dict)))

    (or (gethash (intern k) hash)
        (error (format nil "Word is undefined: ~a" k)))))

(defun get-word (k)
  (get-word-dict *dictionary* k))
