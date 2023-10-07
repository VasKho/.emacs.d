;;; dired-config --- Custom config for dired-mode
;;; Commentary:
;;; Code:

(require 'cl-lib)
(require 'nerd-icons-dired)

(use-package dired
  :hook (dired-mode . dired-omit-mode))

(use-package dired-sidebar
  :ensure t
  :bind (("M-0" . dired-sidebar-toggle))
  :config
  (push 'toggle-window-split dired-sidebar-toggle-hidden-commands)
  (push 'rotate-windows dired-sidebar-toggle-hidden-commands)
  (setq dired-sidebar-use-term-integration t)
  (setq dired-sidebar-close-sidebar-on-file-open t)

  (defun dired--set-root-directory (path)
    "Set Dired root directory to PATH."
    (dired-sidebar-with-no-dedication
     (let ((name (dired-sidebar-buffer-name path)))
       (if (dired-sidebar-buffer-exists-p name)
           (switch-to-buffer name)
	 (progn
	   (find-alternate-file path)
	   (dired-sidebar-mode)))
       (dired-sidebar-update-state (current-buffer)))))

  (defun dired-sidebar-toggle ()
    "Toggle dired-sidebar."
    (interactive)
    (if (dired-sidebar-showing-sidebar-p)
	(progn
	  (dired-sidebar-hide-sidebar)
	  (cl-loop for buff in dired-buffers do (kill-buffer (cdr buff))))
      (let ((buffer (dired-sidebar-get-or-create-buffer (ws-selector-get-working-directory))))
	(dired-sidebar-show-sidebar buffer)
	(pop-to-buffer (dired-sidebar-buffer)))))

  (defun dired-sidebar-subtree-toggle ()
    "Toggle subtree in dired-sidebar with nerd icons."
    (interactive)
    (dired-subtree-toggle)
    (nerd-icons-dired--refresh))

  (defun dired-up-dir ()
    "Set root directory of Dired sidebar to parent directory."
    (interactive)
    (ws-selector--set-frame-working-directory
     (selected-frame)
     (file-name-directory (directory-file-name (dired-current-directory))))
    (dired--set-root-directory (ws-selector-get-working-directory)))

  (defun dired-enter-dir ()
    "Set root directory of Dired sidebar to directory at point."
    (interactive)
    (when (directory-name-p (dired-file-name-at-point))
      (ws-selector--set-frame-working-directory
       (selected-frame)
       (dired-get-filename))
      (dired--set-root-directory (ws-selector-get-working-directory))))
  
  :bind
  (:map dired-sidebar-mode-map
	("<return>" . nil)
	("-" . nil)
	("+" . nil)
	("." . nil)
	("!" . nil)
	("^" . nil)
	("o" . nil)
	("c d" . dired-create-directory)
	("c f" . dired-create-empty-file)
	("M-H" . dired-up-dir)
	("M-L" . dired-enter-dir)))

(provide 'dired-config)
;;; dired.el ends here
