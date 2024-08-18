;;; dummyparens-config --- Custom config for dummyparens
;;; Commentary:
;;; Code:

(use-package dummyparens
  :defer 1
  :functions global-dummyparens-mode
  :defines dp-pairs

  :config
  (global-dummyparens-mode t)
  (setq dp-pairs
	'(("(" ")" nil)
	  ("[" "]" nil)
	  ("{" "}" nil)
	  ("\"" "\"" nil))))

(provide 'dummyparens-config)
;;; dummyparens.el ends here
