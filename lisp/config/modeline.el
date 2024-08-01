;;; modeline --- Create custom modeline with nerd-icons
;;; Commentary:
;;; Library for modeline build in powerline style
;;; Package-Requires: (nerd-icons)
;;; Code:

(require 'nerd-icons)

(defun modeline--custom-logo (fg bg sep-bg)
  "Print logo with FG, BG and SEP-BG as colors."
  (format
   "%s%s%s%s"
   (propertize " " 'face `(:background ,bg :box nil) 'display '(space :width 0.8))
   (propertize
    (format "%s" (nerd-icons-flicon "nf-linux-gnu_guix"))
    'face `(:family ,(nerd-icons-flicon-family) :foreground ,fg :background ,bg :box nil))
   (propertize " " 'face `(:background ,bg :box nil) 'display '(space :width 1.2))
   (propertize
    (nerd-icons-powerline "nf-pl-left_hard_divider")
    'face `(:family ,(nerd-icons-powerline-family) :foreground ,bg :background ,sep-bg :box nil))))

(defun modeline--custom-buffer-name (fg bg)
  "Print buffer size and name with FG and BG."
  (propertize " %I %b " 'face `(:foreground ,fg :background ,bg :box nil)))

(defun modeline--custom-buffer-modified (fg bg)
  "Print icon with FG and BG when buffer is modified."
  (when (buffer-modified-p)
    (propertize
     (format "%s " (nerd-icons-faicon "nf-fa-pencil_square"))
     'face `(:family ,(nerd-icons-faicon-family) :foreground ,fg :background ,bg :box nil))))

(defun modeline--custom-buffer-ro (fg bg)
  "Print icons with FG and BG when buffer is read-only."
  (when buffer-read-only
    (propertize
     (format "%s " (nerd-icons-faicon "nf-fa-lock"))
     'face `(:family ,(nerd-icons-faicon-family) :foreground ,fg :background ,bg :box nil))))

(defun modeline--custom-git (fg bg style-nil)
  "Print git branch if directory is under version control.
Uses FG, BG, STYLE-NIL as text colors."
  (if-let (vc vc-mode)
      (format
       "%s%s%s%s%s%s"
       (propertize
	(nerd-icons-powerline "nf-pl-left_hard_divider")
	'face `(:family ,(nerd-icons-powerline-family) :foreground ,fg :background ,bg :box nil))
       (propertize " " 'face `(:background ,bg :box nil) 'display '(space :width 0.7))
       (propertize
	(nerd-icons-mdicon "nf-md-git")
	'face `(:family ,(nerd-icons-mdicon-family) :foreground ,fg :background ,bg :box nil))
       (propertize " " 'face `(:background ,bg :box nil))
       (propertize
	(substring vc 5)
	'face `(:foreground ,fg :background ,bg :box nil))
       (propertize
	(nerd-icons-powerline "nf-ple-right_half_circle_thick")
	'face `(:family ,(nerd-icons-powerline-family) :foreground ,bg :background ,style-nil :box nil)))
    (propertize
     (nerd-icons-powerline "nf-pl-left_hard_divider")
     'face `(:family ,(nerd-icons-powerline-family) :foreground ,fg :background ,style-nil :box nil))))

(defun modeline--custom-mode (fg bg style-nil)
  "Print current mode with FG, BG and STYLE-NIL."
  (format
   "%s%s%s%s"
   (propertize
    (nerd-icons-powerline "nf-ple-lower_right_triangle")
    'face `(:family ,(nerd-icons-powerline-family) :foreground ,bg :background ,style-nil :box nil))
   (propertize " " 'face `(:background ,bg :box nil))
   (propertize
    "%m "
    'face `(:foreground ,fg :background ,bg :box nil))
   (propertize
    (nerd-icons-powerline "nf-ple-upper_left_triangle")
    'face `(:family ,(nerd-icons-powerline-family) :foreground ,bg :background ,style-nil :box nil))))

(defun modeline--custom-icon-for-mode (style-nil sep-bg)
  "Print icon for mode with STYLE-NIL and SEP-BG."
  (format
   "%s%s%s%s"
   (propertize " " 'face '(:box nil) 'display '(space :width 0.6))
   (propertize
    (nerd-icons-icon-for-mode major-mode)
    'face '(:box nil))
   (propertize " " 'face `(:background ,style-nil :box nil) 'display '(space :align-to (- ,(length "%p") right)))
   (propertize
    (nerd-icons-powerline "nf-ple-lower_right_triangle")
    'face `(:family ,(nerd-icons-powerline-family) :foreground ,sep-bg :background ,style-nil :box nil))))

(defun modeline--custom-progress (fg bg)
  "Print current position in buffer with FG and BG."
  (format
   "%s%s%s"
   (propertize " " 'face `(:background ,bg :box nil) 'display '(space :width 1.6))
   (propertize
    "%p"
    'face `(:foreground ,fg :background ,bg :box nil))
   (propertize " " 'face `(:background ,bg :box nil) 'display '(space :align-to right-margin))))

(defun modeline--make-separator (right theme-bg)
  "Print empty space to make right aligned separator.
RIGHT is a list of right segments.  THEME-BG is a separator color."
  (let ((right-length (string-width (format-mode-line right))))
    (append
     `(,(propertize
	 " "
	 'face `(:background ,theme-bg :box nil)
	 'display `(space :align-to (- right ,right-length))))
     right)))

(setq-default
 mode-line-format
 '(:eval
   (list
    (modeline--custom-logo "#d41cc1" "#d6bbb4" "#ebcdc5")
    '(:eval
      (list
       (modeline--custom-buffer-name "#427b58" "#ebcdc5")
       (modeline--custom-buffer-modified "#fe8019" "#ebcdc5")
       (modeline--custom-buffer-ro "#9d0006" "#ebcdc5")
       (modeline--custom-git "#ebcdc5" "#a6286b" "#ebcdc5")))
    (modeline--make-separator
     (list
      (modeline--custom-mode "#282828" "#d3869b" "#ebcdc5")
      (modeline--custom-icon-for-mode "#ebcdc5" "#bdae93")
      (modeline--custom-progress "#282828" "#bdae93"))
     "#ebcdc5"))))

(provide 'modeline)
;;; modeline.el ends here
