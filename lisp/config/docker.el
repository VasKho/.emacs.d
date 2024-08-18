;;; docker-config --- Custom config for docker modes
;;; Commentary:
;;; Code:

(use-package dockerfile-mode
  :defer 1
  :custom
  (dockerfile-use-buildkit t)
  (dockerfile-mode-command "docker")
  (dockerfile-enable-auto-indent t))

(use-package docker-compose-mode
  :defer 1)

(use-package docker
  :defer 1
  :bind ("C-x d" . docker)
  :custom
  (docker-command          "docker")
  (docker-compose-command  "docker compose")
  (docker-container-shell-file-name "/bin/bash"))

(provide 'docker-config)
;;; docker.el ends here
