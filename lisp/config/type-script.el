(use-package typescript-mode
  :ensure t
  :defer 1
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

(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (tide-hl-identifier-mode +1)
  (company-mode +1))


(add-hook 'typescript-mode-hook #'setup-tide-mode)
