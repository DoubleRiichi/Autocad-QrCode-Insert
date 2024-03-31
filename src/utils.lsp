(setq DWGNAME (getvar "DWGNAME"))

(defun format-name (datestr)
  (strcat DWGNAME "-" datestr))


(defun getRasterPoint ()
  (append (getpoint) '(0.0)))

