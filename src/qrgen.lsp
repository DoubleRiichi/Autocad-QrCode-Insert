(setq APP "") ;; Ajouter chemin de l'application ici, autolisp nous force à employer ce genre de solutions                                                                                                                                              
(load (strcat APP "datetime.lsp"))
(load (strcat APP "utils.lsp"))
(load (strcat APP "xrecord.lsp"))
(load (strcat APP "xrefs.lsp"))


(setq QRGEN-PATH "/exe/qrgen.exe"
      OUTPUT-PATH "Desktop/autocad-QRcode/"
      DEFAULT-SIZE "256"
      REF-NAME "qr-DATE"
      XRECORD-NAME "qrgen-pos")


(defun qr-command-str (input name / out)
   (strcat QRGEN-PATH " \"" input "\" \"" name "\" " DEFAULT-SIZE))


(defun call (call_str)
  (vl-cmdf "_start" call_str))


(defun qr-generate (input name) 
  (setq call_str (qr-command-str input name))
  (call call_str))


(defun qr-insert (path width point)
  (alert path)
  (if (findfile path)
    (progn
      (setq image (vlax-invoke (vlax-get
                      (vla-get-activelayout (vla-get-activedocument (vlax-get-acad-object))) 'Block)
                      'AddRaster path point width 0.0))
      
      (vla-put-name image REF-NAME)
      (vla-update image)
      (vl-cmdf "-XREF" "R" "*"))
    
    (alert "Not found!")))


(vlr-dwg-reactor  nil '((:vlr-beginsave . qrgen2)))

(defun qrgen2 (reactor params)
    (setq input (datetime)
          imagename DWGNAME
          imgpath (strcat OUTPUT-PATH imagename ".png")
          cmd_string (qr-command-str input imgpath))
  
    (detach-image REF-NAME)
    (vl-cmdf "_delay" 1000)
    (call cmd_string)
    (vl-cmdf "_delay" 3000)
 
    (if (not (setq point (get-pos XRECORD-NAME 10)))
      (progn
        (setq point (getpoint))
        
        (create-xrecord XRECORD-NAME point))) 
    (print point)
    (qr-insert imgpath "20" point))


(defun test2 (reactor params)
    (vl-cmdf "_delay" 3000)
    (print "triggered"))


