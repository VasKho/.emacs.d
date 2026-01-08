;;; magit-config --- Custom config for magit -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package magit
  :custom (magit-auto-revert-mode nil)
  :bind ("C-x g" . magit-status))

;;; magit.el ends here
