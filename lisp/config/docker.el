;;; docker-config --- Custom config for docker modes
;;; Commentary:
;;; Code:

(use-package dockerfile-mode
  :ensure t
  :defer 1
  :config (setq dockerfile-mode-command "docker"))

(use-package docker-compose-mode
  :ensure t
  :defer 1)

(use-package docker
  :ensure t
  :defer 1
  :bind ("C-x d" . docker)
  :config
  (setq docker-command          "docker"
	docker-compose-command  "docker compose"
	docker-container-shell-file-name "/bin/bash"))

(provide 'docker-config)
;;; docker.el ends here
