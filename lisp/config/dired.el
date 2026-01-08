;;; dired-config --- Custom config for dired-mode
;;; Commentary:
;;; Code:

(use-package dired-subtree
  :after (nerd-icons-dired)
  :custom (dired-subtree-use-backgrounds nil)
  :config
  (advice-add 'dired-subtree-toggle
							:after (lambda () (nerd-icons-dired-mode 1))))

(use-package dired
  :defer 1
  :straight (:type built-in)

  :hook ((dired-mode . dired-omit-mode)
				 (dired-mode . dired-hide-details-mode))
  :custom (dired-listing-switches "-lah")

  :config
  (defun dired-toggle ()
    "Toggle dired buffer."
    (interactive)
    (if (eq major-mode 'dired-mode)
	(kill-buffer-and-window)
      (if (fboundp 'ws-selector-get-working-directory)
	  (if buffer-file-name
	      (dired-jump-other-window)
	      (dired-other-window (ws-selector-get-working-directory)))
	(dired-jump-other-window))))

  (defun dired-toggle-save-focus ()
    "Toggle dired buffer saving focus on previous window."
    (interactive)
    (if (eq major-mode 'dired-mode)
	(kill-buffer-and-window)
      (let ((prev-window (selected-window)))
	(if (fboundp 'ws-selector-get-working-directory)
	    (if buffer-file-name
		(dired-jump-other-window)
	      (dired-other-window (ws-selector-get-working-directory)))
	  (dired-jump-other-window))
	(select-window prev-window))))

  (defun dired-up-dir ()
    "Set root directory of dired to parent directory."
    (interactive)
    (let ((prev-buffer (current-buffer))
	  (new-directory (file-name-directory (directory-file-name (dired-current-directory)))))
      (dired new-directory)
      (kill-buffer prev-buffer)))

  (defun dired-open-at-point ()
    "Open file in other window or enter directory in the current buffer."
    (interactive)
    (let ((prev-window (selected-window))
	  (target (dired-file-name-at-point)))
      (if (directory-name-p target)
	  (dired-find-alternate-file)
	(progn
	  (find-file-other-window target)
	  (select-window prev-window)
	  (kill-buffer-and-window)))))

  :bind
  (("M-0" . dired-toggle)
   ("C-M-0" . dired-toggle-save-focus))

  (:map global-map ("C-x C-j" . nil))

  (:map dired-mode-map
	("<return>" . dired-open-at-point)
	("RET" . dired-open-at-point)
	("-" . nil)
	("+" . nil)
	("." . nil)
	("!" . nil)
	("^" . nil)
	("o" . nil)
	("c" . nil)
	("TAB" . dired-subtree-toggle)
	("c d" . dired-create-directory)
	("c f" . dired-create-empty-file)
	("C-M-u" . dired-up-dir)))

(provide 'dired-config)
;;; dired.el ends here
