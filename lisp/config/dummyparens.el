;;; dummyparens-config --- Custom config for dummyparens
;;; Commentary:
;;; Code:

(use-package dummyparens
  :ensure t
  :defer 1
  :init
  :config
  (global-dummyparens-mode t)
  (setq dp-pairs
	'(("(" ")" nil)
	  ("[" "]" nil)
	  ("{" "}" nil)
	  ("\"" "\"" nil))))

(provide 'dummyparens-config)
;;; dummyparens.el ends here
