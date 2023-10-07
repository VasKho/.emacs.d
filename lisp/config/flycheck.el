;;; flycheck-config --- Custom config for flycheck
;;; Commentary:
;;; Code:

(use-package flycheck
  :defer 1
  :config
  (progn
    (global-flycheck-mode)
    (setq flycheck-checker-error-threshold 600)))

(provide 'flycheck-config)
;;; flycheck.el ends here
