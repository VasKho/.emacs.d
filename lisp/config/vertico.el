;;; vertico-config --- Custom config for vertio
;;; Commentary:
;;; Code:

(use-package vertico
  :ensure t
  :defer 1
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
  :ensure t
  :defer 1
  :config
  (vertico-posframe-mode 1)
  (setq vertico-posframe-border-width 2
	vertico-posframe-width  120
	vertico-posframe-height 30))

(provide 'vertico-config)
;;; vertico.el ends here
