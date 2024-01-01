;;; cc-config --- Custom config for C-like languages
;;; Commentary:
;;; Code:

(use-package cc-mode
  :defer 1
  :after (lsp-mode)
  :hook ((c-mode . lsp)
	 (c++-mode . lsp)))

(provide 'cc-config)
;;; cc.el ends here
