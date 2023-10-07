;;; company-config --- Custom config for company-mode
;;; Commentary:
;;; Code:

(use-package company
  :defer 1
  :config
  (setq company-idle-delay 0.0)
  (setq company-tooltip-idle-delay 0.0)
  (setq company-tooltip-align-annotations t)
  (setq company-selection-wrap-around t)
  (company-tng-mode)
  (global-company-mode t))

(use-package company-c-headers
  :defer 1
  :config (add-to-list 'company-backends 'company-c-headers))

(use-package company-shell
  :defer 1
  :config (add-to-list 'company-backends '(company-shell company-shell-env company-fish-shell)))

(provide 'company-config)
;;; company-mode.el ends here
