(use-package dummyparens
  :ensure t
  :defer 1
  :config
  (global-dummyparens-mode t)
  (setq dp-pairs
	'(("(" ")" nil)
          ("[" "]" nil)
          ("{" "}" nil)
          ("\"" "\"" nil))))
