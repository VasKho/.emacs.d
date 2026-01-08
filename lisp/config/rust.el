;;; rust-config --- Custom config for rustic -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package rust-ts-mode
  :defer t
  :after (treesit)
  :mode "\\.rs\\'"
  :custom
  (rust-ts-mode-indent-offset 2)
  (lsp-rust-analyzer-cargo-watch-command "clippy")
  (lsp-rust-analyzer-server-display-inlay-hints t)
  (lsp-rust-analyzer-display-lifetime-elision-hints-enable "skip_trivial")
  (lsp-rust-analyzer-display-chaining-hints t)
  (lsp-rust-analyzer-display-lifetime-elision-hints-use-parameter-names nil)
  (lsp-rust-analyzer-display-closure-return-type-hints t)
  (lsp-rust-analyzer-display-parameter-hints nil)
  (lsp-rust-analyzer-display-reborrow-hints nil))

(add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-ts-mode))

(provide 'rust-config)
;;; rust.el ends here
