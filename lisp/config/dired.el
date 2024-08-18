;;; dired-config --- Custom config for dired-mode
;;; Commentary:
;;; Code:

(use-package dired-subtree
  :custom
  (dired-subtree-use-backgrounds nil))

(use-package dired
  :straight (:type built-in)
  :after (dired-subtree)

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
    (let ((prev-buffer (current-buffer))
	  (target (dired-file-name-at-point)))
      (if (directory-name-p target)
	  (dired-find-alternate-file)
	(progn
	  (find-file-other-window target)
	  (with-current-buffer prev-buffer
	    (kill-buffer-and-window))))))

  :bind
  (("M-0" . dired-toggle))

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
