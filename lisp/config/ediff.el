;;; ediff-config --- Custom config for ediff -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package ediff
  :straight (:type built-in)
  :defer t
  :config
  (defun kill-ediff-buffers ()
    (kill-buffer ediff-buffer-A)
    (kill-buffer ediff-buffer-B)
    (kill-buffer ediff-buffer-C)
    (kill-buffer ediff-error-buffer)
    (kill-buffer ediff-diff-buffer)
    (kill-buffer ediff-fine-diff-buffer)
    (kill-buffer ediff-registry-buffer))
  :hook (ediff-quit . 'kill-ediff-buffers))

(provide 'ediff-config)
;;; ediff.el ends here
