;;; init-config --- Init file for my emacs config
;;; Commentary:
;;; Code:

;; Add melpa to package repos
(require 'package)
(package-initialize)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/") t)

;; (when (not (package-installed-p 'use-package))
;;   (package-refresh-contents)
;;   (package-install 'use-package))

(load-file "~/.emacs.d/lisp/core.el")

(setq custom-file "~/.emacs.d/custom.el")

;; Load plugins
(load-file "~/.emacs.d/lisp/config/vertico.el")
(load-file "~/.emacs.d/lisp/config/nerd-icons.el")
(load-file "~/.emacs.d/lisp/config/ws-selector.el")
(load-file "~/.emacs.d/lisp/config/keymap.el")
(load-file "~/.emacs.d/lisp/config/dashboard.el")
(load-file "~/.emacs.d/lisp/config/lsp.el")
(load-file "~/.emacs.d/lisp/config/doom-theme.el")
(load-file "~/.emacs.d/lisp/config/magit.el")
(load-file "~/.emacs.d/lisp/config/dired.el")
(load-file "~/.emacs.d/lisp/config/company-mode.el")
(load-file "~/.emacs.d/lisp/config/treesitter.el")
(load-file "~/.emacs.d/lisp/config/flycheck.el")
(load-file "~/.emacs.d/lisp/config/org.el")
(load-file "~/.emacs.d/lisp/config/dummyparens.el")
(load-file "~/.emacs.d/lisp/config/comment-toggle.el")
(load-file "~/.emacs.d/lisp/config/modeline.el")
(load-file "~/.emacs.d/lisp/config/ace-window.el")
(load-file "~/.emacs.d/lisp/config/rust.el")
(load-file "~/.emacs.d/lisp/config/slime.el")
(load-file "~/.emacs.d/lisp/config/type-script.el")
(load-file "~/.emacs.d/lisp/config/docker.el")
(load-file "~/.emacs.d/lisp/config/other.el")
(load-file "~/.emacs.d/lisp/config/restclient.el")

(load-file custom-file)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'dired-find-alternate-file 'disabled nil)

(provide 'init)
;;; init.el ends here
