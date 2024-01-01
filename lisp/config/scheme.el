;;; scheme-config --- Custom config for slime
;;; Commentary:
;;; Code:

(use-package geiser-guile
  :straight (geiser-guile :type git :host gitlab :repo "emacs-geiser/guile")
  :defer 1)

(provide 'scheme-config)
;;; slime.el ends here
