;;; ws-selector-config --- Simple workspace management per buffers.
;;; Commentary:
;;; Code:

(use-package ws-selector
  :straight (ws-selector :type git :host github :repo "VasKho/ws-selector.el")
  :custom
  (ws-selector-workdir-indent 4)
  (ws-selector-selection-alist
   '(("Home" . "~/")
     ("Configs" . "~/.config")
     ("Emacs" . "~/.emacs.d")
     ("Projects" . "~/Documents")
     ("Work" . "~/ostis/source")
     ("Study" . "~/Study")))
  :bind ("C-c C-w s" . ws-selector-select-workspace))

(provide 'ws-selector-config)
;;; ws-selector.el ends here
