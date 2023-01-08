(defun modeline--render (left right)
  "Return a string of `window-width' length.
Containing LEFT, and RIGHT aligned respectively."
  (let ((available-width
         (- (window-total-width)
            (+ (length (format-mode-line left))
               (length (format-mode-line right))))))
    (append left
            (list (format (format "%%%ds" available-width) ""))
            right)))

(defun modeline--create-segment (content separator colors)
  (let ((fg (nth 0 colors))
	(bg (nth 1 colors))
	(sep-bg (nth 2 colors)))
    (list
     (if (not (null content))
	 (propertize content 'face `(:foreground ,fg :background ,bg))
       "")
     (if (not (null separator))
	 (propertize separator 'face `(:foreground ,bg :background ,sep-bg))
       ""))))

(defun modeline--get-icon (filename)
  (if (null filename) ""
    (let ((part nil))
      (if (file-name-extension filename)
	  (setq part (file-name-extension filename))
	(setq part (file-name-nondirectory filename)))
      (cond
       ((member part '("el" "elc" "cl" "lisp" "yuck")) " ")
       ((member part '("md")) " ")
       ((member part '("Dockerfile" ".dockerignore")) " ")
       ((member part '("sh")) " ")
       ((member part '("c")) " ")
       ((member part '("cpp")) " ")
       ((member part '("h" "hpp")) " ")
       ((member part '("py" "pyc")) " ")
       ((member part '("go")) "ﳑ ")
       ((member part '("xml" "html")) " ")
       ((member part '("css" "scss")) " ")
       ((member part '("js")) " ")
       ((member part '("ts")) " ")
       ((member part '("yml" "yaml")) " ")
       ((member part '(".gitignore")) " ")
       ((member part '("png" "jpg" "jpeg" "svg")) " ")
       ((member part '("mp3" "m4a" "ogg" "webm")) " ")
       ((member part '("tar" "tar.gz" "tar.xz" "rar" "zip")) " ")
       ((member part '("pdf")) " ")
       ((member part '("txt")) " ")
       ((member part '("LICENSE")) " ")
       ((member part '("org")) " ")
       ((member part '("Makefile")) " ")
       (t " ")))))

(setq-default
 mode-line-format
 '(:eval
   (modeline--render
    (list
     (modeline--create-segment "  " "" '("#fabd2f" "#3c3836" "#504945"))
     '(:eval
       (list
	(modeline--create-segment " %I %b " nil '("#8ec07c" "#504945"))
	(when (buffer-modified-p)
	  (modeline--create-segment " " nil '("#fe8019" "#504945")))
	(when buffer-read-only
	  (modeline--create-segment " " nil '("#d5c4a1" "#504945")))))
     '(:eval
       (if-let (vc vc-mode)
	   (list
	    (modeline--create-segment nil "" '(nil "#504945" "#ebdbb2"))
	    (modeline--create-segment (concat "  " (substring vc 5) " ") "" '("#504945" "#ebdbb2" nil)))
	 (modeline--create-segment nil "" '(nil "#504945" nil)))))
    
    (list
     (modeline--create-segment nil "" '(nil "#d3869b" nil))
     (modeline--create-segment " %m " "  " '("#504945" "#d3869b" "#665c54"))
     '(:eval (modeline--create-segment (modeline--get-icon (buffer-file-name)) " " '("#fabd2f" "#665c54" "#bdae93")))
     (modeline--create-segment " %p " nil '("#282828" "#bdae93"))))))
