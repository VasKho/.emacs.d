;;; flycheck-config --- Custom config for flycheck
;;; Commentary:
;;; Code:

(use-package flycheck
  :defer 1
  :functions global-flycheck-mode

  :custom
  (flycheck-checker-error-threshold 600)

  :config (global-flycheck-mode))

(provide 'flycheck-config)
;;; flycheck.el ends here
