(use-package js2-mode
  :defer 1
  :mode "\\.js\\'"
  :after (lsp-mode)
  :custom
  (js-indent-level          2)
  (js2r-prefer-let-over-var t))

(use-package vue-mode
  :defer 1
  :mode "\\.vue\\'"
  :config (add-hook 'vue-mode-hook #'lsp))
