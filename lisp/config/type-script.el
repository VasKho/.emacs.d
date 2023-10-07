;;; typescript-config --- Custom config for typescript
;;; Commentary:
;;; Code:

(use-package typescript-mode
  :ensure t
  :defer 1
  :init
  (defun setup-tide-mode ()
    (interactive)
    (tide-setup)
    (tide-hl-identifier-mode +1)
    (company-mode +1))
  :hook
  (typescript-mode . setup-tide-mode)
  :config
  (setq typescript-indent-level 2))

(use-package tide
  :ensure t
  :defer 1
  :config
  (setq tide-format-options
	'(:insertSpaceAfterFunctionKeywordForAnonymousFunctions t
	  :placeOpenBraceOnNewLineForFunctions                  nil
	  :indentSize                                           2
          :tabSize                                              2
	  :convertTabsToSpaces                                  t)))

(provide 'typescript-config)
;;; type-script.el ends here
