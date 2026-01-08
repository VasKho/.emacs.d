;;; tex-config --- Custom config for tex -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package auctex-latexmk
  :defer t
  :after (lsp-latex)
  :custom (auctex-latexmk-inherit-TeX-PDF-mode t))

(use-package lsp-latex
  :defer t
  :mode "\\.tex\\'"
  :hook ((tex-mode . lsp)
				 (latex-mode . lsp)))

(use-package typst-ts-mode
  :after (treesit)
  :mode "\\.typ\\'"
  :straight (:type git :host sourcehut :repo "meow_king/typst-ts-mode" :files (:defaults "*.el"))
  :custom
  (typst-ts-mode-watch-options "--open")
  (typst-ts-compile-options "--font-path ./font")
  (typst-ts-mode-indent-offset 2))

(provide 'tex-config)
;;; tex.el ends here
