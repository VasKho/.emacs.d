;;; lsp-config --- Custom config for lsp-mode -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package lsp-mode
  :defer t
  :functions lsp-ensure-server
  :hook
  ((rust-ts-mode . lsp)
   (go-mode . lsp)
   (js-ts-mode . (lambda () (lsp-ensure-server 'ts-ls) (lsp)))
   (typescript-ts-mode . (lambda () (lsp-ensure-server 'ts-ls) (lsp)))
   (c-ts-mode . lsp)
   (c++-ts-mode . lsp)
   (python-ts-mode . lsp)
   (kotlin-mode . (lambda () (lsp-ensure-server 'kotlin-ls) (lsp))))
  :custom
  (lsp-eldoc-hook nil)
  (lsp-eldoc-render-all t)
  (lsp-idle-delay 0.6))

;;; lsp.el ends here
