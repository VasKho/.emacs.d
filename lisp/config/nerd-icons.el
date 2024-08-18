;;; nerd-icons-config --- Custom config for nerd-icons and nerd-icons-dired.
;;; Commentary:
;;; Code:

(defvar regex-alist
      '(("^TAGS$" nerd-icons-octicon "nf-oct-tag" :face nerd-icons-blue)
	("^TODO$" nerd-icons-octicon "nf-oct-checklist" :face nerd-icons-lyellow)
	("^LICENSE$" nerd-icons-octicon "nf-oct-book" :face nerd-icons-blue)
	("^readme" nerd-icons-octicon "nf-oct-book" :face nerd-icons-lcyan)
	("nginx$" nerd-icons-devicon "nf-dev-nginx" :face nerd-icons-dgreen)
	("^Makefile$" nerd-icons-sucicon "nf-seti-makefile" :face nerd-icons-dorange)
	("^CMakeLists.txt$" nerd-icons-sucicon "nf-seti-makefile" :face nerd-icons-red)
	("^CMakeCache.txt$" nerd-icons-sucicon "nf-seti-makefile" :face nerd-icons-blue)
	("^meson.build$" nerd-icons-sucicon "nf-seti-makefile" :face nerd-icons-purple)
	("^meson_options.txt$" nerd-icons-sucicon "nf-seti-makefile" :face nerd-icons-purple)
	("^\\.?Dockerfile" nerd-icons-sucicon "nf-seti-docker" :face nerd-icons-blue)
	("^Brewfile$" nerd-icons-faicon "nf-fa-beer" :face nerd-icons-lsilver)
	("^stack.*.json$" nerd-icons-devicon "nf-dev-aws" :face nerd-icons-orange)
	("^serverless\\.yml$" nerd-icons-faicon "nf-fa-bolt" :face nerd-icons-yellow)
	("~$" nerd-icons-octicon "nf-oct-lock" :face nerd-icons-maroon)
	("^mix.lock$" nerd-icons-sucicon "nf-seti-elixir" :face nerd-icons-lyellow)
	("^Gemfile\\(\\.lock\\)?$" nerd-icons-octicon "nf-oct-ruby" :face nerd-icons-red)
	("_?test\\.rb$" nerd-icons-octicon "nf-oct-ruby" :face nerd-icons-red)
	("_?test_helper\\.rb$" nerd-icons-octicon "nf-oct-ruby" :face nerd-icons-dred)
	("_?spec\\.rb$" nerd-icons-octicon "nf-oct-ruby" :face nerd-icons-red)
	("_?spec_helper\\.rb$" nerd-icons-octicon "nf-oct-ruby" :face nerd-icons-dred)
	("-?spec\\.ts$" nerd-icons-mdicon "nf-md-language_typescript" :face nerd-icons-blue)
	("-?test\\.ts$" nerd-icons-mdicon "nf-md-language_typescript" :face nerd-icons-blue)
	("-?spec\\.js$" nerd-icons-mdicon "nf-md-language_javascript" :face nerd-icons-lpurple)
	("-?test\\.js$" nerd-icons-mdicon "nf-md-language_javascript" :face nerd-icons-lpurple)
	("-?spec\\.jsx$" nerd-icons-mdicon "nf-md-react" :face nerd-icons-blue-alt)
	("-?test\\.jsx$" nerd-icons-mdicon "nf-md-react" :face nerd-icons-blue-alt)
	("^MERGE_" nerd-icons-octicon "nf-oct-git_merge" :face nerd-icons-red)
	("^COMMIT_EDITMSG" nerd-icons-octicon "nf-oct-git_commit" :face nerd-icons-red)
	("stylelint" nerd-icons-sucicon "nf-seti-stylelint" :face nerd-icons-lyellow)
	("^package.json$" nerd-icons-devicon "nf-dev-npm" :face nerd-icons-red)
	("^package.lock.json$" nerd-icons-devicon "nf-dev-npm" :face nerd-icons-dred)
	("^yarn\\.lock" nerd-icons-sucicon "nf-seti-yarn" :face nerd-icons-blue-alt)
	("\\.npmignore$" nerd-icons-devicon "nf-dev-npm" :face nerd-icons-dred)
	("^bower.json$" nerd-icons-devicon "nf-dev-bower" :face nerd-icons-lorange)
	("^gulpfile" nerd-icons-devicon "nf-dev-gulp" :face nerd-icons-lred)
	("^gruntfile" nerd-icons-devicon "nf-dev-grunt" :face nerd-icons-lyellow)
	("^webpack" nerd-icons-mdicon "nf-md-webpack" :face nerd-icons-lblue)
	("^go.mod$" nerd-icons-sucicon "nf-seti-config" :face nerd-icons-blue-alt)
	("^go.work$" nerd-icons-sucicon "nf-seti-config" :face nerd-icons-blue-alt)
	("Jenkinsfile\\'" nerd-icons-devicon "nf-dev-groovy" :face nerd-icons-cyan-alt)
	("bookmark" nerd-icons-octicon "nf-oct-bookmark" :face nerd-icons-lpink)
	("^\\*scratch\\*$" nerd-icons-faicon "nf-fa-sticky_note" :face nerd-icons-lyellow)
	("^\\*scratch.*" nerd-icons-faicon "nf-fa-sticky_note" :face nerd-icons-yellow)
	("^\\*new-tab\\*$" nerd-icons-mdicon "nf-md-star" :face nerd-icons-cyan)
	("Cask\\'" nerd-icons-sucicon "nf-custom-emacs" :face nerd-icons-blue)
	("Eask\\'" nerd-icons-sucicon "nf-custom-emacs" :face nerd-icons-blue)
        ("\\.bash.*" nerd-icons-devicon "nf-dev-terminal" :face nerd-icons-dpink)
	("\\.zsh.*" nerd-icons-devicon "nf-dev-terminal" :face nerd-icons-lgreen)
	("\\.git.*" nerd-icons-mdicon "nf-md-git" :face nerd-icons-cyan-alt)
	(".*\\.tar$" nerd-icons-faicon "nf-fa-file_zip_o" :face nerd-icons-lmaroon)
	(".*\\.tar\\..*" nerd-icons-faicon "nf-fa-file_zip_o" :face nerd-icons-lmaroon)
	(".*\\.desktop" nerd-icons-octicon "nf-oct-device_desktop" :face nerd-icons-lsilver)
	(".*\\.lisp" nerd-icons-mdicon "nf-md-code_parentheses" :face nerd-icons-lgreen)
	(".*\\.cl" nerd-icons-mdicon "nf-md-code_parentheses" :face nerd-icons-lgreen)))

(use-package nerd-icons
  :custom (nerd-icons-font-family "Hack Nerd Font")
  :defines nerd-icons-dir-icon-alist nerd-icons-extension-icon-alist nerd-icons-regexp-icon-alist nerd-icons-mode-icon-alist
  :functions nerd-icons-match-to-alist nerd-icons-devicon
  :config
  (defun nerd-icons-icon-for-dir (dir &rest arg-overrides)
    (let* ((dirname (file-name-base (directory-file-name dir)))
           (icon (nerd-icons-match-to-alist dirname nerd-icons-dir-icon-alist))
           (args (cdr icon)))
      (when arg-overrides (setq args (append `(,(car args)) arg-overrides (cdr args))))
      (if (file-remote-p dir)
          (apply #'nerd-icons-devicon "nf-dev-terminal" (cdr args))
	(apply (car icon) args))))

  (setq nerd-icons-extension-icon-alist
	(append nerd-icons-extension-icon-alist
		'(("djvu" nerd-icons-mdicon "nf-md-book_open" :face nerd-icons-green)
		  ("torrent" nerd-icons-faicon "nf-fa-magnet" :face all-the-icons-lgreen)
		  ("iso" nerd-icons-faicon "nf-fae-disco" :face all-the-icons-blue))))
  (setq nerd-icons-regexp-icon-alist regex-alist)
  (setq nerd-icons-dir-icon-alist '(("\\.?.*" nerd-icons-sucicon "nf-custom-folder_oct")))
  (setq nerd-icons-mode-icon-alist
	(append nerd-icons-mode-icon-alist
		'((common-lisp-mode nerd-icons-mdicon "nf-md-code_parentheses" :face nerd-icons-lgreen)
		  (lisp-mode nerd-icons-mdicon "nf-md-code_parentheses" :face nerd-icons-lgreen)
		  (slime-repl-mode nerd-icons-mdicon "nf-md-code_parentheses" :face nerd-icons-lgreen)))))

(use-package nerd-icons-dired
  :after (nerd-icons)
  :hook
  (dired-mode . nerd-icons-dired-mode))

(provide 'nerd-icons-config)
;;; nerd-icons.el ends here
