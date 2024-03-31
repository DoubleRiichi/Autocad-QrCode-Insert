(defun remove-xref (name)
  (setq doc (vla-get-activedocument (vlax-get-acad-object)))
  (setq blocks (vla-get-blocks doc))

  (vlax-for item blocks 
             (print (vla-get-name item))
    (if (= (vla-get-name item) "qr-DATE")
      (progn

        (vla-detach item))))

  (vla-regen item acallviewports))



(defun dict-test ()
  (while (setq dict (dictnext (namedobjdict)))
    (print dict)))


(defun c:detachImage  (/ mspcoll dictcoll)
      (vl-load-com)
      (vlax-for obj (vla-get-modelspace
                      (vla-get-activedocument
                            (vlax-get-acad-object)))
            (if
                  
                        (eq (vla-get-objectname obj)
                            "AcDbRasterImage")
                    
                      (vl-cmdf "_.-image" "_detach" (vla-get-name obj))
                             )
                       )
      (princ)
      )

