(in-package :cl-froth.dictionary)

(defclass dictionary ()
  ((dict :initform (make-hash-table))))

(defvar *dictionary* (make-instance 'dictionary) "Global dictionary")

(defgeneric add-word-dict (d k f &optional imm)
  (:documentation "Adds a word to the dictionary"))
(defmethod add-word-dict ((d dictionary)
                          (k string)
                          (f function)
                          &optional imm)
  (let ((hash (slot-value d 'dict)))

    (if (null (gethash (intern k) hash))
        (setf (gethash (intern k) hash) (cons f imm))
        (error (format nil "Word is already defined: ~a" k)))))

(defun add-word (k f &optional imm)
  (add-word-dict *dictionary* k f imm))

(defgeneric remove-word-dict (d k)
  (:documentation "Removes a word from the dictionary"))

(defmethod remove-word-dict ((d dictionary)
                             (k string))

  (let ((hash (slot-value d 'dict)))

    (if (null (gethash (intern k) hash))
        (error (format nil "Word is undefined: ~a" k))
        (remhash (intern k) hash))))

(defun remove-word (k)
  (remove-word-dict *dictionary* k))

(defgeneric get-word-dict (d k)
  (:documentation "Fetches the given word from the dictionary"))

(defmethod get-word-dict ((d dictionary)
                          (k string))

  (let ((hash (slot-value d 'dict)))

    (or (gethash (intern k) hash)
        (error (format nil "Word is undefined: ~a" k)))))

(defun get-word (k)
  (get-word-dict *dictionary* k))
