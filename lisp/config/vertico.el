;;; vertico-config --- Custom config for vertio
;;; Commentary:
;;; Code:

(use-package vertico
  :defer 1
  :defines vertico-map
  :functions vertico-mode vertico-multiform-mode

  :custom
  (vertico-cycle t)
  (vertico-count 30)
  (vertico-multiform-commands
   '((kill-buffer grid)
     (t posframe)))

  :config
  (vertico-mode 1)
  (vertico-multiform-mode 1)
  :bind
  (:map vertico-map
	("TAB" . vertico-next)
	("<backtab>" . vertico-previous)
	("C-SPC" . vertico-insert)))

(use-package vertico-posframe
  :defer 1
  :functions vertico-posframe-mode

  :custom
  (vertico-posframe-border-width 2)
  (vertico-posframe-width  120)
  (vertico-posframe-height 30)

  :config
  (vertico-posframe-mode 1))

(provide 'vertico-config)
;;; vertico.el ends here
