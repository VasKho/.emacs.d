;;; tex-config --- Custom config for tex
;;; Commentary:
;;; Code:

(use-package auctex-latexmk
  :defer 1
  :custom (auctex-latexmk-inherit-TeX-PDF-mode t))

(use-package lsp-latex
  :defer 1
  :hook ((tex-mode . lsp)
	 (latex-mode . lsp)))

;;; tex.el ends here
