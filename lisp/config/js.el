;;; js-config --- Config for JS development -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package js
  :defer t
  :after (treesit)
  :custom
  (js-indent-level 2)
  (lsp-javascript-display-return-type-hints t)
  (lsp-javascript-display-variable-type-hints t)
  (lsp-javascript-format-insert-space-after-comma-delimiter t)
  (lsp-javascript-format-insert-space-after-function-keyword-for-anonymous-functions t))

(use-package svelte-mode
  :defer t
  :mode "\\.svelte\\'"
  :hook
  (svelte-mode
   .
   (lambda ()
     (lsp-ensure-server 'svelte-ls)
     (lsp)))
  :custom
  (svelte-basic-offset 2)
  (svelte-display-submode-name t))

(use-package vue-mode
  :defer t
  :mode "\\.vue\\'"
  :hook
  (vue-mode
   .
   (lambda ()
     (lsp-ensure-server 'vue-semantic-server)
     (lsp))))

(add-to-list 'major-mode-remap-alist '(javascript-mode . js-ts-mode))

(provide 'js-config)
;;; js.el ends here
