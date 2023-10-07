;;; slime-config --- Custom config for slime
;;; Commentary:
;;; Code:

(use-package slime
  :ensure t
  :pin melpa
  :defer 1
  :config
  (setq inferior-lisp-program "ros -Q run")
  (slime-setup '(slime-fancy slime-company))
  (add-hook
   'slime-mode-hook
   (lambda ()
     (unless (slime-connected-p) (save-excursion (slime)))
     (add-to-list 'company-backends
		  '(company-slime
		    :with company-capf
		    :with company-dabbrev-code
		    :with company-keywords
		    :with company-files))
     (dolist (h '(slime-mode-hook slime-repl-mode-hook sldb-mode-hook))
       (remove-hook h 'slime-company-maybe-enable))
     (slime-company-disable))))

(use-package slime-company
  :ensure t
  :after (slime company)
  :config
  (setq slime-company-completion 'simple)
  (setq slime-company-after-completion nil)
  (setq slime-company-display-flags nil)
  (setq slime-company-complete-in-comments-and-strings t))

(provide 'slime-config)
;;; slime.el ends here
