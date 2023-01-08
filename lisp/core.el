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
(setq display-line-numbers-type 'relative)

;; Set default folder
(setq default-directory (getenv "PWD"))

;; Disable backup
(setq backup-inhibited t)
;; Disable auto save
(setq auto-save-default nil)


;; Font setup
(defvar hack-font "Hack Nerd Font:pixelsize=15:foundry=SRC:weight=normal:slant=normal:width=normal:spacing=100:scalable=true")
(add-to-list 'default-frame-alist '(font . "Hack Nerd Font:pixelsize=15:foundry=SRC:weight=normal:slant=normal:width=normal:spacing=100:scalable=true"))
(set-face-attribute 'default t :font "Hack Nerd Font:pixelsize=15:foundry=SRC:weight=normal:slant=normal:width=normal:spacing=100:scalable=true")

(set-face-attribute 'default nil :font "Hack Nerd Font:pixelsize=15:foundry=SRC:weight=normal:slant=normal:width=normal:spacing=100:scalable=true")
(set-frame-font hack-font nil t)

;; Open links in Firefox
(setq browse-url-generic-program (executable-find "firefox"))
