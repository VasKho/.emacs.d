;;; ace-window-config --- Custom config for ace-window
;;; Commentary:
;;; Code:

(use-package ace-window
  :defer 1
  :config (global-set-key (kbd "M-o") 'ace-window))

(provide 'ace-window-config)
;;; ace-window.el ends here
