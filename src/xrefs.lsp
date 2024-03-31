(defun detach-xref (name)
  (setq blks (vla-get-block (vla-get-activedocument (vlax-get-acad-object))) )
  (setq err (vl-catch-all-error-p 
              (setq xref (vl-catch-all-apply 'vla-item blks))))
        
  (if (and (not err) (= :vlax-true (vla-get-isxref xref)))
    (vla-detach xref)))


(defun detach-image (name)
  (vl-cmdf "_.-image" "_detach" name))