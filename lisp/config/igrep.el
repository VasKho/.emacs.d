;;; igrep-config --- Config for igrep package -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package igrep
  :straight (igrep :type git :host github :repo "VasKho/igrep")
  :defer t
  :bind ("M-s M-r" . igrep))

(provide 'igrep-config)
;;; igrep.el ends here
