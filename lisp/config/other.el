;;; other-config --- Config for several little custom modes
;;; Commentary:
;;; Code:

(use-package markdown-mode
  :defer 1)

(use-package rainbow-mode
  :defer 1
  :functions rainbow-mode
  :defines rainbow-mode

  :config
  (define-globalized-minor-mode global-rainbow-mode
    rainbow-mode (lambda () (rainbow-mode 1)))
  (global-rainbow-mode 1))

(use-package yuck-mode
  :defer 1)

(use-package xclip
  :defer 1
  :functions xclip-mode
  :config (xclip-mode 1))

(provide 'other-config)
;;; other.el ends here
