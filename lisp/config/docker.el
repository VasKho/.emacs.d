;;; docker-config --- Custom config for docker modes
;;; Commentary:
;;; Code:

(use-package dockerfile-mode
  :defer 1
  :config
  (setq dockerfile-mode-command "docker")
  (setq dockerfile-enable-auto-indent nil))

(use-package docker-compose-mode
  :defer 1)

(use-package docker
  :defer 1
  :bind ("C-x d" . docker)
  :config
  (setq docker-command          "docker"
	docker-compose-command  "docker compose"
	docker-container-shell-file-name "/bin/bash"))

(provide 'docker-config)
;;; docker.el ends here
