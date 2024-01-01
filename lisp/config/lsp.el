;;; lsp-config --- Custom config for lsp-mode
;;; Commentary:
;;; Code:

(use-package lsp-mode
  :commands lsp
  :defer 1
  :custom
  (lsp-eldoc-hook nil)
  (lsp-eldoc-render-all t)
  (lsp-idle-delay 0.6))

;;; lsp.el ends here
