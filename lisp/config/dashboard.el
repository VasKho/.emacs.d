(use-package dashboard
  :ensure t
  :config
  (setq
   dashboard-set-navigator            t
   dashboard-center-content           t
   dashboard-image-banner-max-height  550
   dashboard-week-agenda              t
   dashboard-banner-logo-title        nil
   dashboard-startup-banner           (concat user-emacs-directory "banners/dashboard-banner.png")
   dashboard-set-init-info            t
   dashboard-footer-messages          '("Do you like amazing sex, stick your finger in my ass ")
   dashboard-footer-icon              "")
  (setq initial-buffer-choice              (lambda () (dashboard-refresh-buffer) (get-buffer-create "*dashboard*")))
  (setq dashboard-items '((recents  . 3) (agenda . 5)))
  (setq dashboard-item-names
	'(("Recent Files:" . " Recently opened files:")
          ("Agenda for the coming week:" . " Agenda:")))
  ;; format (<icon> <caption> <tooltip> <press-callback> ? <before-icon> <after-caption>)
  (setq dashboard-navigator-buttons
        `(;; First line
	  (("" " Homepage" "Open homepage in browser"
	    (lambda (&rest _) (browse-url "https://github.com/VasKho/.emacs.d"))
	    nil "" ""))
	  ;; Empty line
	  (("" "" "" nil nil "" ""))
	  (("" " Open file" "Find file with GUI interface"
	    (lambda (&rest _) (call-interactively 'find-file))
	    nil "" "                 C-x C-f"))
	  (("" " File explorer" "Open file explorer"
	    (lambda (&rest _) (treemacs))
	    nil "" "                 M-0"))
	  (("" " Command" "Execute command"
	    (lambda (&rest _) (call-interactively 'execute-extended-command))
	    nil "" "                       M-x"))
	  (("" " Open workspace" "Select workspace in file explorer"
	    (lambda (&rest _) (switch-ws))
	    nil "" "          C-c C-w s"))))

  (defun dashboard-insert-custom ()
    (dashboard-insert-center
     (propertize (format "\nRiced by vaslch0, %s\n" (format-time-string "%Y"))
			 'face 'font-lock-comment-face)))
  (advice-add #'dashboard-insert-footer :after #'dashboard-insert-custom)
  (dashboard-setup-startup-hook)
  
  :custom-face
  (dashboard-heading ((t (:foreground "#8ec07c" :weight bold))))
  (dashboard-items-face ((t (:foreground "#fb4934" :weight bold)))))
