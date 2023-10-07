;;; restclient-config --- Custom config for restclient
;;; Commentary:
;;; Code:

(use-package restclient
  :defer 1)

(use-package company-restclient
  :defer 1
  :custom (restclient-log-request nil)
  :config
  (add-to-list 'company-backends 'company-restclient))

(provide 'restclient-config)
;;; restclient.el ends here
