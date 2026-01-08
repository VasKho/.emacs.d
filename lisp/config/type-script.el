;;; typescript-config --- Custom config for typescript -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package typescript-ts-mode
  :defer t
  :after (treesit)
  :mode ("\\.ts\\'" "\\.tsx\\'")
  :custom
  (lsp-clients-typescript-prefer-use-project-ts-server t)
  (lsp-typescript-format-insert-space-after-comma-delimiter t)
  (lsp-typescript-format-insert-space-after-function-keyword-for-anonymous-functions t))

(add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-ts-mode))
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . typescript-ts-mode))

(provide 'typescript-config)
;;; type-script.el ends here
