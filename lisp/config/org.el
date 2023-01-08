(use-package org
  :ensure t
  :defer 1
  :config
  (setq org-startup-indented             t
        org-pretty-entities              t
        org-hide-emphasis-markers        t
        org-startup-with-inline-images   t
        org-image-actual-width           '(600))
  (plist-put org-format-latex-options :scale 2)
  (org-display-inline-images))
