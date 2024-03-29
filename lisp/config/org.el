;;; org-config --- Custom config for notes with org-mode
;;; Commentary:
;;; Code:

(use-package org
  :straight (:type built-in)
  :defer 1
  :config
  (setq org-startup-indented             t
        org-pretty-entities              t
        org-hide-emphasis-markers        nil
        org-startup-with-inline-images   t
        org-image-actual-width           '(600)
	org-confirm-babel-evaluate       nil)
  (plist-put org-format-latex-options :scale 2)
  (org-display-inline-images)
  :hook (org-mode . org-superstar-mode))

(use-package org-superstar
  :defer 1
  :after (org))

(use-package org-roam
  :custom
  (org-roam-directory (file-truename "~/Documents/org-roam"))
  :bind (("C-c n l" . org-roam-buffer-toggle)
         ("C-c n f" . org-roam-node-find)
         ("C-c n g" . org-roam-graph)
         ("C-c n i" . org-roam-node-insert)
         ("C-c n c" . org-roam-capture))
  :config
  (require 'org-roam-export)
  (require 'org-roam-protocol)
  (setq org-roam-node-display-template (concat "${title:*} " (propertize "${tags:10}" 'face 'org-tag)))
  (org-roam-db-autosync-mode))

(use-package org-roam-ui
  :straight
  (:host github :repo "org-roam/org-roam-ui" :branch "main" :files ("*.el" "out"))
  :after org-roam
  :config
  (setq org-roam-ui-sync-theme t
        org-roam-ui-follow t
        org-roam-ui-update-on-save t
        org-roam-ui-open-on-start nil))

(provide 'org-config)
;;; org.el ends here
