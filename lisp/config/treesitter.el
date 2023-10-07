;;; tree-sitter-config --- Custom config for tree-sitter
;;; Commentary:
;;; Code:

(use-package tree-sitter
  :ensure t
  :defer 1
  :config
  (global-tree-sitter-mode)
  (add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode))

(use-package tree-sitter-langs
  :ensure t
  :defer 1)

(provide 'tree-sitter-config)
;;; treesitter.el ends here
