;;; tex-config --- Custom config for tex
;;; Commentary:
;;; Code:

(use-package company-auctex
  :defer 1
  :config (company-auctex-init))

(use-package auctex-latexmk
  :defer 1
  :config (setq auctex-latexmk-inherit-TeX-PDF-mode t))

(use-package lsp-latex
  :defer 1
  :hook ((tex-mode . lsp)
	 (latex-mode . lsp)))

;;; tex.el ends here
