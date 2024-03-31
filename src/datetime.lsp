(vl-load-com)
(defun TODAY(fs / date)

  (setq d (rtos (getvar "CDATE") 2 6) ;rtos = Real (number) To String
          yr (substr d 3 2)
          mo (substr d 5 2)
         day (substr d 7 2))
  (if (= fs 1)
    (setq date (strcat day "_" mo "_" yr))
    (setq date (strcat day "/" mo "/" yr))
  )
  date
)


(defun TIME (fs / time)
 
  (setq d (rtos (getvar "CDATE") 2 6)
      hr (substr d 10 2)
      m (substr d 12 2)
      s (substr d 14 2))
  
  (if (< (strlen s) 2) 
    (setq s (strcat "0" s)))
  
  (if (= fs 1)
    (setq time (strcat hr "." m "." s))
    (setq time (strcat hr ":" m ":" s))
  )
   
  time 
)

(defun datetime ( / cdate_val YYYY M D HH MM SS)
  ; Get the current date/time
  (setq cdate_val (rtos (getvar "CDATE") 2 6))

  ; Break up the string into its separate date and time parts
  (setq YYYY (substr cdate_val 1 4)
        M    (substr cdate_val 5 2)
        D    (substr cdate_val 7 2)
        HH   (substr cdate_val 10 2)
        MM   (substr cdate_val 12 2)
        SS   (substr cdate_val 14 2)
  )

  ; Output the current date and time to the Command
  ; prompt or return the formatted output as a string
 

  (strcat M "/" D "/" YYYY "  " HH ":" MM ":" SS)
  )
