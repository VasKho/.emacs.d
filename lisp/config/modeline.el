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
   (propertize " " 'face `(:background ,bg) 'display '(space :width 0.8))
   (propertize
    (format "%s" (nerd-icons-flicon "nf-linux-gnu_guix"))
    'face `(:family ,(nerd-icons-flicon-family) :foreground ,fg :background ,bg))
   (propertize " " 'face `(:background ,bg) 'display '(space :width 1.2))
   (propertize
    (nerd-icons-powerline "nf-pl-left_hard_divider")
    'face `(:family ,(nerd-icons-powerline-family) :foreground ,bg :background ,sep-bg))))

(defun modeline--custom-buffer-name (fg bg)
  "Print buffer size and name with FG and BG."
  (propertize " %I %b " 'face `(:foreground ,fg :background ,bg)))

(defun modeline--custom-buffer-modified (fg bg)
  "Print icon with FG and BG when buffer is modified."
  (when (buffer-modified-p)
    (propertize
     (format "%s " (nerd-icons-faicon "nf-fa-pencil_square"))
     'face `(:family ,(nerd-icons-faicon-family) :foreground ,fg :background ,bg))))

(defun modeline--custom-buffer-ro (fg bg)
  "Print icons with FG and BG when buffer is read-only."
  (when buffer-read-only
    (propertize
     (format "%s " (nerd-icons-faicon "nf-fa-lock"))
     'face `(:family ,(nerd-icons-faicon-family) :foreground ,fg :background ,bg))))

(defun modeline--custom-git (fg bg style-nil)
  "Print git branch if directory is under version control.
Uses FG, BG, STYLE-NIL as text colors."
  (if-let (vc vc-mode)
      (format
       "%s%s%s%s%s%s"
       (propertize
	(nerd-icons-powerline "nf-pl-left_hard_divider")
	'face `(:family ,(nerd-icons-powerline-family) :foreground ,fg :background ,bg))
       (propertize " " 'face `(:background ,bg) 'display '(space :width 0.7))
       (propertize
	(nerd-icons-mdicon "nf-md-git")
	'face `(:family ,(nerd-icons-mdicon-family) :foreground ,fg :background ,bg))
       (propertize " " 'face `(:background ,bg))
       (propertize
	(substring vc 5)
	'face `(:foreground ,fg :background ,bg))
       (propertize
	(nerd-icons-powerline "nf-ple-right_half_circle_thick")
	'face `(:family ,(nerd-icons-powerline-family) :foreground ,bg :background ,style-nil)))
    (propertize
     (nerd-icons-powerline "nf-pl-left_hard_divider")
     'face `(:family ,(nerd-icons-powerline-family) :foreground ,fg :background ,style-nil))))

(defun modeline--custom-mode (fg bg style-nil)
  "Print current mode with FG, BG and STYLE-NIL."
  (format
   "%s%s%s%s"
   (propertize
    (nerd-icons-powerline "nf-ple-lower_right_triangle")
    'face `(:family ,(nerd-icons-powerline-family) :foreground ,bg :background ,style-nil))
   (propertize " " 'face `(:background ,bg))
   (propertize
    "%m "
    'face `(:foreground ,fg :background ,bg))
   (propertize
    (nerd-icons-powerline "nf-ple-upper_left_triangle")
    'face `(:family ,(nerd-icons-powerline-family) :foreground ,bg :background ,style-nil))))

(defun modeline--custom-icon-for-mode (style-nil sep-bg)
  "Print icon for mode with STYLE-NIL and SEP-BG."
  (format
   "%s%s%s%s"
   (propertize " " 'display '(space :width 0.6))
   (nerd-icons-icon-for-mode major-mode)
   (propertize " " 'face `(:background ,style-nil) 'display '(space :align-to (- ,(length "%p") right)))
   (propertize
    (nerd-icons-powerline "nf-ple-lower_right_triangle")
    'face `(:family ,(nerd-icons-powerline-family) :foreground ,sep-bg :background ,style-nil))))

(defun modeline--custom-progress (fg bg)
  "Print current position in buffer with FG and BG."
  (format
   "%s%s%s"
   (propertize " " 'face `(:background ,bg) 'display '(space :width 1.6))
   (propertize
    "%p"
    'face `(:foreground ,fg :background ,bg))
   (propertize " " 'face `(:background ,bg) 'display '(space :align-to right-margin))))

(defun modeline--make-separator (right theme-bg)
  "Print empty space to make right aligned separator.
RIGHT is a list of right segments.  THEME-BG is a separator color."
  (let ((right-length (string-width (format-mode-line right))))
    (append
     `(,(propertize
	 " "
	 'face `(:background ,theme-bg)
	 'display `(space :align-to (- right ,right-length))))
     right)))

(setq-default
 mode-line-format
 '(:eval
   (list
    (modeline--custom-logo "#fabd2f" "#3c3836" "#504945")
    '(:eval
      (list
       (modeline--custom-buffer-name "#8ec07c" "#504945")
       (modeline--custom-buffer-modified "#fe8019" "#504945")
       (modeline--custom-buffer-ro "#d5c4a1" "#504945")
       (modeline--custom-git "#504945" "#ebdbb2" "#32302f")))
    (modeline--make-separator
     (list
      (modeline--custom-mode "#504945" "#d3869b" "#32302f")
      (modeline--custom-icon-for-mode "#32302f" "#bdae93")
      (modeline--custom-progress "#282828" "#bdae93"))
     "#32302f"))))

(provide 'modeline)
;;; modeline.el ends here
