;;; dashboard-config --- Custom dashboard config
;;; Commentary:
;;; Code:

(use-package dashboard
  :after (nerd-icons)
  :functions
  dashboard-refresh-buffer dashboard-insert-center dashboard-insert-footer dashboard-insert-custom dashboard-setup-startup-hook
  nerd-icons-faicon nerd-icons-codicon nerd-icons-octicon

  :init
  (defvar dashboard-footer
    (concat
     (nerd-icons-faicon "nf-fa-mars")
     " Do you like amazing sex, stick your finger in my ass "
     (nerd-icons-faicon "nf-fa-mars")))

  (defvar dashboard-recent
    (concat
     (propertize (nerd-icons-codicon "nf-cod-debug_restart") 'face '(:height 1.2))
     " Recently opened files:"))

  (defvar dashboard-homepage
    (concat
     (propertize (nerd-icons-faicon "nf-fa-github_alt") 'face '(:height 1.2))
     (propertize " " 'display '(space :width 1.2))))

  (defvar dashboard-search
    (propertize (nerd-icons-octicon "nf-oct-search") 'face '(:height 1.1)))

  (defvar dashboard-exec-command
    (propertize (nerd-icons-octicon "nf-oct-terminal") 'face '(:height 1.1)))

  (defvar dashboard-file-explorer
    (propertize (nerd-icons-octicon "nf-oct-file_directory") 'face '(:height 1.1)))

  (defun dashboard-insert-custom ()
    (dashboard-insert-center
     (propertize (format "\nRiced by vaslch0, %s\n" (format-time-string "%Y"))
		 'face 'font-lock-comment-face)))

  :custom
  (dashboard-center-content t)
  (dashboard-image-banner-max-height 550)
  (dashboard-week-agenda nil)
  (dashboard-startup-banner (concat user-emacs-directory "banners/dashboard-banner.png"))
  (dashboard-footer-messages `(,dashboard-footer))
  (dashboard-footer-icon "")
  (dashboard-items '((recents  . 3)))
  (dashboard-item-names `(("Recent Files:" . ,dashboard-recent)))

  (dashboard-startupify-list
   '(dashboard-insert-banner
     dashboard-insert-newline
     dashboard-insert-init-info
     dashboard-insert-newline
     dashboard-insert-newline
     dashboard-insert-navigator
     dashboard-insert-items
     dashboard-insert-footer))

  ;; format (<icon> <caption> <tooltip> <press-callback> ? <before-icon> <after-caption>)
  (dashboard-navigator-buttons
   `(;; First line
     ((,dashboard-homepage "Homepage" "Open homepage in browser"
			   (lambda (&rest _) (browse-url "https://github.com/VasKho/.emacs.d"))
			   nil "" ""))
     ((,dashboard-search " Open file" "Find file with GUI interface"
			 (lambda (&rest _) (call-interactively 'find-file))
			 nil "" "                 C-x C-f"))
     ((,dashboard-file-explorer " File explorer" "Open file explorer"
				(lambda (&rest _) (dired-sidebar-toggle))
				nil "" "                 M-0"))
     ((,dashboard-exec-command " Command" "Execute command"
			       (lambda (&rest _) (call-interactively 'execute-extended-command))
			       nil "" "                       M-x"))
     ((,dashboard-file-explorer " Open workspace" "Select workspace in file explorer"
				(lambda (&rest _) (ws-selector-select-workspace))
				nil "" "          C-c C-w s"))))

  :config
  (setq initial-buffer-choice (lambda () (dashboard-refresh-buffer) (get-buffer-create "*dashboard*")))

  (advice-add #'dashboard-insert-footer :after #'dashboard-insert-custom)
  (dashboard-setup-startup-hook)

  :custom-face
  (dashboard-heading ((t (:foreground "#8ec07c" :weight bold))))
  (dashboard-items-face ((t (:foreground "#fb4934" :weight bold))))
  (dashboard-footer-face ((t (:inherit font-lock-comment-face)))))

(provide 'dashboard-config)
;;; dashboard.el ends here
