(setq company-slime-backs
      '(company-slime :with company-capf
		      :with company-dabbrev-code
		      :with company-keywords
		      :with company-files))

(use-package slime-company
  :ensure t
  :after (slime company)
  :config
  (setq
   slime-company-completion                         'simple
   slime-company-after-completion                   nil
   slime-company-display-flags                      nil
   slime-company-complete-in-comments-and-strings   t))

(use-package slime
  :ensure t
  :pin melpa
  :defer 1
  :config
  (setq inferior-lisp-program "ros -Q run")
  (slime-setup '(slime-fancy slime-company))
  (add-hook 'slime-mode-hook
	    (lambda ()
	      (unless (slime-connected-p)
		(save-excursion (slime)))
	      (add-to-list 'company-backends company-slime-backs)
	    (dolist (h '(slime-mode-hook slime-repl-mode-hook sldb-mode-hook))
	      (remove-hook h 'slime-company-maybe-enable))
	    (slime-company-disable))))
