;;; company-config --- Custom config for company-mode
;;; Commentary:
;;; Code:

(use-package company
  :defer 1
  :defines company-backends
  :functions company-tng-mode global-company-mode

  :custom
  (company-idle-delay 0.0)
  (company-tooltip-idle-delay 0.0)
  (company-tooltip-align-annotations t)
  (company-selection-wrap-around t)

  :config
  (company-tng-mode)
  (global-company-mode t))

(use-package company-c-headers
  :defer 1
  :config (add-to-list 'company-backends 'company-c-headers))

(use-package company-shell
  :defer 1
  :config (add-to-list 'company-backends '(company-shell company-shell-env company-fish-shell company-capf)))

(provide 'company-config)
;;; company-mode.el ends here
