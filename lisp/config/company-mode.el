(use-package company
  :ensure t
  :defer 1
  :config
  (setq company-idle-delay 0.0)
  (setq company-tooltip-idle-delay 0.0)
  (setq company-tooltip-align-annotations t)
  (setq company-selection-wrap-around t)
  (company-tng-configure-default)
  (global-company-mode t))

(use-package company-c-headers
  :ensure t
  :defer 1
  :config (add-to-list 'company-backends 'company-c-headers))

(use-package company-shell
  :ensure t
  :defer 1
  :config (add-to-list 'company-backends '(company-shell company-shell-env company-fish-shell)))
