;;; typescript-config --- Custom config for typescript
;;; Commentary:
;;; Code:

(use-package typescript-mode
  :defer 1
  :after (lsp-mode)
  :hook (typescript-mode . lsp)

  :functions lsp-ensure-server lsp-install-server
  :init
  (when (lsp-ensure-server 'ts-ls)
    (lsp-install-server nil 'ts-ls))

  :custom
  (typescript-indent-level 2)

  (lsp-clients-typescript-prefer-use-project-ts-server t)
  (lsp-typescript-format-insert-space-after-comma-delimiter t)
  (lsp-typescript-format-insert-space-after-function-keyword-for-anonymous-functions t))

(provide 'typescript-config)
;;; type-script.el ends here
