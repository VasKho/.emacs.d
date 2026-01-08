;;; dummyparens-config --- Custom config for dummyparens -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package dummyparens
  :defer 1
  :functions global-dummyparens-mode
  :custom
  (dp-pairs
   '(("(" ")" nil)
     ("[" "]" nil)
     ("{" "}" nil)
     ("\"" "\"" nil)))
  :config
  (global-dummyparens-mode t))

(provide 'dummyparens-config)
;;; dummyparens.el ends here
