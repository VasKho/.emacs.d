;;; doom-themes-config --- Custom config for doom themes
;;; Commentary:
;;; Code:

(use-package doom-themes
  :ensure t
  :config
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t)
  (load-theme 'doom-gruvbox t)
  (doom-themes-visual-bell-config))

(provide 'doom-themes-config)
;;; doom-theme.el ends here
