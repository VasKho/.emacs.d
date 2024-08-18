;;; js-config --- Config for JS development
;;; Commentary:
;;; Code:

(use-package js2-mode
  :defer 1
  :functions lsp-ensure-server lsp-install-server

  :mode (("\\.js$" . js2-mode))
  :after (lsp-mode)
  :hook (js2-mode . lsp)
  :init
  (when (lsp-ensure-server 'ts-ls)
    (lsp-install-server nil 'ts-ls))

  :custom
  (js2-highlight-level 3)
  (js2-prefer-let-over-var t)
  (js-indent-level 2)

  (lsp-javascript-display-return-type-hints t)
  (lsp-javascript-display-variable-type-hints t)
  (lsp-javascript-format-insert-space-after-comma-delimiter t)
  (lsp-javascript-format-insert-space-after-function-keyword-for-anonymous-functions t))

(provide 'js-config)
;;; js.el ends here
