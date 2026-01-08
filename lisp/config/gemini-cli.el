;;; gemini-cli --- Config for Gemini CLI util -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package vterm
  :defer t)

(use-package projectile
  :defer t)

(use-package popup
  :defer t)

(use-package gemini-cli
  :defer t
  :straight (:type git :host github :repo "linchen2chris/gemini-cli.el" :branch "main"
                   :files ("*.el" (:exclude "demo.gif")))
  :bind-keymap
  ("C-c c" . gemini-cli-command-map)
  :custom
  (gemini-cli-terminal-backend 'vterm))

(provide 'gemini-cli-config)
;;; gemini-cli.el ends here
