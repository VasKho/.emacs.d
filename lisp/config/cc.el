;;; cc-config --- Custom config for C-like languages -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package c-ts-mode
  :defer t
  :after (treesit))

(use-package cmake-ts-mode
  :defer t
  :after (treesit)
  :mode "CMakeLists.txt")

(add-to-list 'major-mode-remap-alist '(c++-mode . c++-ts-mode))
(add-to-list 'major-mode-remap-alist '(c-mode . c-ts-mode))

(provide 'cc-config)
;;; cc.el ends here
