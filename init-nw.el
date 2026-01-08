;;; init-nw-config --- Init file for my emacs config in nw mode -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(defun efs/display-startup-time ()
  "Print startup time with GC."
  (message "Emacs loaded in %s with %d garbage collections."
           (format "%.2f seconds"
                   (float-time
										(time-subtract after-init-time before-init-time)))
           gcs-done))

(add-hook 'emacs-startup-hook #'efs/display-startup-time)

(setq custom-file "~/.emacs.d/custom.el")

;; Don't show startup message
(setq inhibit-startup-message t)
(setq initial-scratch-message "")
(setq initial-major-mode 'text-mode)

;; Disable toolbar, menubar and scrollbar
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

;; Show line numbers
(global-display-line-numbers-mode t)
(setq-default display-line-numbers-type 'relative)

;; Disable backup
(setq backup-inhibited t)
;; Disable auto save
(setq auto-save-default nil)
;; Use spaces instead of tabs
(setq indent-tabs-mode t)

;; Tab width
(setq-default tab-width 2)

;; Delete trailing whitespaces on save
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(setq-default default-directory (getenv "HOME"))

;; Font setup
(defvar hack-font "Hack Nerd Font:pixelsize=17:foundry=SRC:weight=normal:slant=normal:width=normal:spacing=100:scalable=true")
(add-to-list 'default-frame-alist `(font . ,hack-font))
(set-face-attribute 'default t :font hack-font)

(set-face-attribute 'default nil :font hack-font)
(set-face-attribute 'mode-line nil :font hack-font)
(set-frame-font hack-font nil t)

;; Open links in Firefox
(setq browse-url-generic-program (executable-find "librewolf"))
(load-file custom-file)

;; Load plugins
(load-file "~/.emacs.d/lisp/config/rust.el")
(load-file "~/.emacs.d/lisp/config/js.el")
(load-file "~/.emacs.d/lisp/config/comment-toggle.el")
(load-file "~/.emacs.d/lisp/config/dummyparens.el")
(load-file "~/.emacs.d/lisp/config/keymap.el")
(load-file "~/.emacs.d/lisp/config/company-mode.el")
(load-file "~/.emacs.d/lisp/config/flycheck.el")
(load-file "~/.emacs.d/lisp/config/other.el")
(load-file "~/.emacs.d/lisp/config/docker.el")
(load-file "~/.emacs.d/lisp/config/type-script.el")
(load-file "~/.emacs.d/lisp/config/cc.el")
(load-file "~/.emacs.d/lisp/config/python.el")
(load-file "~/.emacs.d/lisp/config/kotlin.el")

(dolist (element (cdr (cdr (directory-files "~/.emacs.d/straight/build/" :full-name))))
  (add-to-list 'load-path element))

(load-file "~/.emacs.d/straight/build/company/company-autoloads.el")
(load-file "~/.emacs.d/straight/build/company-c-headers/company-c-headers-autoloads.el")
(load-file "~/.emacs.d/straight/build/company-shell/company-shell-autoloads.el")
(load-file "~/.emacs.d/straight/build/flycheck/flycheck-autoloads.el")
(load-file "~/.emacs.d/straight/build/dummyparens/dummyparens-autoloads.el")
(load-file "~/.emacs.d/straight/build/go-mode/go-mode-autoloads.el")
(load-file "~/.emacs.d/straight/build/dart-mode/dart-mode-autoloads.el")
(load-file "~/.emacs.d/straight/build/typst-ts-mode/typst-ts-mode-autoloads.el")
(load-file "~/.emacs.d/straight/build/kotlin-mode/kotlin-mode-autoloads.el")
(load-file "~/.emacs.d/straight/build/rainbow-mode/rainbow-mode-autoloads.el")
(load-file "~/.emacs.d/straight/build/markdown-mode/markdown-mode-autoloads.el")
(load-file "~/.emacs.d/straight/build/xclip/xclip-autoloads.el")
(load-file "~/.emacs.d/straight/build/fish-mode/fish-mode-autoloads.el")
(load-file "~/.emacs.d/straight/build/yuck-mode/yuck-mode-autoloads.el")
(load-file "~/.emacs.d/straight/build/docker-compose-mode/docker-compose-mode-autoloads.el")

(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'dired-find-alternate-file 'disabled nil)

(provide 'init)
;;; init-nw.el ends here
