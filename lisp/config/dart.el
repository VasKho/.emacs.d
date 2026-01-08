;;; dart-config --- Config for dart development -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package lsp-dart
  :defer t
  :hook (dart-mode . lsp)
  :custom (lsp-dart-outline nil))

(use-package dart-mode
  :defer t
  :mode "\\.dart\\'")

;;; dart.el ends here
