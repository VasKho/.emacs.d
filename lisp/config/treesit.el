;;; treesit-config --- Custom config for tree-sitter -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package treesit
  :straight (:type built-in)
  :init
  (defun treesit-ensure-grammar (grammar-specifier)
    "Install grammar with `GRAMMAR-SPECIFIER`."
    (when (not (treesit-language-available-p (car grammar-specifier)))
      (add-to-list 'treesit-language-source-alist grammar-specifier)
      (treesit-install-language-grammar (car grammar-specifier))))

  (treesit-ensure-grammar
   '(c "https://github.com/tree-sitter/tree-sitter-c"))
  (treesit-ensure-grammar
   '(cpp "https://github.com/tree-sitter/tree-sitter-cpp"))
  (treesit-ensure-grammar
   '(cmake "https://github.com/uyha/tree-sitter-cmake"))
  (treesit-ensure-grammar
   '(rust "https://github.com/tree-sitter/tree-sitter-rust"))
  (treesit-ensure-grammar
   '(javascript "https://github.com/tree-sitter/tree-sitter-javascript"))
  (treesit-ensure-grammar
   '(typst "https://github.com/uben0/tree-sitter-typst"))
  (treesit-ensure-grammar
   '(dockerfile "https://github.com/camdencheek/tree-sitter-dockerfile"))
  (treesit-ensure-grammar
   '(typescript "https://github.com/tree-sitter/tree-sitter-typescript" "master" "typescript/src"))
  (treesit-ensure-grammar
   '(tsx "https://github.com/tree-sitter/tree-sitter-typescript" "master" "tsx/src"))
  (treesit-ensure-grammar
   '(python "https://github.com/tree-sitter/tree-sitter-python")))

(provide 'treesit-config)
;;; treesit.el ends here
