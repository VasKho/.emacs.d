;;; igrep-config --- Config for igrep package
;;; Commentary:
;;; Code:

(use-package igrep
  :straight (igrep :type git :host github :repo "VasKho/igrep")
  :bind ("M-s M-r" . igrep))

(provide 'igrep-config)
;;; igrep.el ends here
