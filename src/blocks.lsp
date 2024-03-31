(defun get-block (name)
  (setq ss (ssget "_X" '((0 . "INSERT") (2 . name))))
  (setq ent (entget (ssname ss 0)))
  ent)

