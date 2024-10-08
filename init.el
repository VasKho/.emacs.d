;;; init-config --- Init file for my emacs config
;;; Commentary:
;;; Code:

(when (boundp 'straight-repository-branch)
  (setq straight-repository-branch "develop"))

;; Install straight.el
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 6))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
	(url-retrieve-synchronously
	 "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
	 'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(when (fboundp 'straight-use-package)
  (straight-use-package 'use-package))

;; Configure use-package to use straight.el by default
(use-package straight
  :custom
  (straight-use-package-by-default t))
(setq use-package-compute-statistics t)
(setq custom-file "~/.emacs.d/custom.el")

(load-file "~/.emacs.d/lisp/core.el")

;; Load plugins
(load-file "~/.emacs.d/lisp/config/nerd-icons.el")
(load-file "~/.emacs.d/lisp/config/dashboard.el")
(load-file "~/.emacs.d/lisp/config/modeline.el")
(load-file "~/.emacs.d/lisp/config/vertico.el")
(load-file "~/.emacs.d/lisp/config/comment-toggle.el")
(load-file "~/.emacs.d/lisp/config/dummyparens.el")
(load-file "~/.emacs.d/lisp/config/ws-selector.el")
(load-file "~/.emacs.d/lisp/config/dired.el")
(load-file "~/.emacs.d/lisp/config/ace-window.el")
(load-file "~/.emacs.d/lisp/config/org.el")
(load-file "~/.emacs.d/lisp/config/keymap.el")
(load-file "~/.emacs.d/lisp/config/lsp.el")
(load-file "~/.emacs.d/lisp/config/magit.el")
(load-file "~/.emacs.d/lisp/config/company-mode.el")
(load-file "~/.emacs.d/lisp/config/flycheck.el")
(load-file "~/.emacs.d/lisp/config/other.el")
(load-file "~/.emacs.d/lisp/config/rust.el")
(load-file "~/.emacs.d/lisp/config/js.el")
(load-file "~/.emacs.d/lisp/config/slime.el")
(load-file "~/.emacs.d/lisp/config/type-script.el")
(load-file "~/.emacs.d/lisp/config/docker.el")
(load-file "~/.emacs.d/lisp/config/restclient.el")
(load-file "~/.emacs.d/lisp/config/tex.el")
(load-file "~/.emacs.d/lisp/config/cc.el")
(load-file "~/.emacs.d/lisp/config/igrep.el")
(load-file "~/.emacs.d/lisp/config/ediff.el")


(load-file custom-file)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'dired-find-alternate-file 'disabled nil)

(provide 'init)
;;; init.el ends here
