(use-package flycheck
  :ensure t
  :defer 1
  :config
  (progn
    (global-flycheck-mode)
    (setq flycheck-checker-error-threshold 600)))
