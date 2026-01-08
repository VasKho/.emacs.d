;;; docker-config --- Custom config for docker modes -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package dockerfile-ts-mode
  :defer t
  :mode "Dockerfile"
  :custom
  (dockerfile-use-buildkit t)
  (dockerfile-mode-command "docker")
  (dockerfile-enable-auto-indent t))

(use-package docker-compose-mode
  :defer t
  :mode "docker-compose.ya?ml")

(use-package docker
  :bind ("C-x d" . docker)
  :custom
  (docker-command          "docker")
  (docker-compose-command  "docker compose")
  (docker-container-shell-file-name "/bin/bash"))

(provide 'docker-config)
;;; docker.el ends here
