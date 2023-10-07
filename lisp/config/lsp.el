;;; lsp-config --- Custom config for lsp-mode
;;; Commentary:
;;; Code;

(use-package lsp-mode
  :commands lsp
  :defer 1
  :custom
  ;; what to use when checking on-save. "check" is default, I prefer clippy
  (lsp-eldoc-hook nil)
  (lsp-eldoc-render-all t)
  (lsp-idle-delay 0.6)
  ;; enable / disable the hints as you prefer:
  ;; :config
  ;; (add-hook 'lsp-mode-hook 'lsp-ui-mode)
  )

(use-package lsp-latex
  :defer 1)

;;; lsp.el ends here
