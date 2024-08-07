;;; core-config --- Custom config for core emacs functionality
;;; Commentary:
;;; Code:

;; Don't show startup message
(setq inhibit-startup-message t)

;; Disable toolbar, menubar and scrollbar
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

;; Highlight current line
(global-hl-line-mode t)

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
(setq tab-width 2)

;; Setup custom theme
(setq custom-theme-directory "~/.emacs.d/lisp/config/")
(load-theme 'pink-rose t)

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
(setq browse-url-generic-program (executable-find "firefox"))

(provide 'core-config)
;;; core.el ends here
