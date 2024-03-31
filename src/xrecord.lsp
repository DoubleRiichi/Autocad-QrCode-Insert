;((-3 ("qrgen" (1010 . point))))

(defun get-xrecord (name)
  (dictsearch (namedobjdict) name))


(defun create-xrecord (name point) 
  (setq xrec (list '(0 . "XRECORD") '(100 . "AcDbXrecord") 
    (cons 1 name)
    (cons 10 point)))

  (setq xname (entmakex xrec))
  (dictadd (namedobjdict) name xname))


(defun register-app (name)
  (regapp name))


(defun update-xrecord (name point / )
  (setq xlist (dictsearch (namedobjdict) name))
  (if (dictremove (namedobjdict) name)
    (create-xrecord name point)))


(defun get-pos (name index)
 (setq point 
        (cdr (assoc index (get-xrecord name)))))