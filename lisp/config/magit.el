;;; magit-config --- Custom config for magit
;;; Commentary:
;;; Code:

(use-package magit
  :defer 1
  :functions magit-auto-revert-mode

  :config
  (magit-auto-revert-mode 0)
  :bind ("C-x g" . magit-status))

;;; magit.el ends here
