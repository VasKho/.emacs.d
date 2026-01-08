;;; other-config --- Config for several little custom modes -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package markdown-mode
  :defer t
  :mode "\\.md\\'")

(use-package rainbow-mode
  :defer 3
  :functions rainbow-mode
  :defines rainbow-mode

  :config
  (define-globalized-minor-mode global-rainbow-mode
    rainbow-mode (lambda () (rainbow-mode 1)))
  (global-rainbow-mode 1))

(use-package yuck-mode
  :defer t
  :mode "\\.yuck\\'")

(use-package xclip
  :defer 1
  :functions xclip-mode
  :config (xclip-mode 1))

(use-package fish-mode
  :defer t
  :mode "\\.fish\\'")

(provide 'other-config)
;;; other.el ends here
