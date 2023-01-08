(use-package treemacs
  :ensure t
  :init
  (with-eval-after-load 'winum
    (define-key winum-keymap (kbd "M-0") #'treemacs-select-window))
  :config
  (progn
    (setq treemacs-collapse-dirs                   (if treemacs-python-executable 3 0)
          treemacs-deferred-git-apply-delay        0.5
          treemacs-directory-name-transformer      #'identity
          treemacs-display-in-side-window          t
          treemacs-eldoc-display                   'simple
          treemacs-file-event-delay                5000
          treemacs-file-extension-regex            treemacs-last-period-regex-value
          treemacs-file-follow-delay               0.2
          treemacs-file-name-transformer           #'identity
          treemacs-follow-after-init               t
          treemacs-expand-after-init               t
          treemacs-find-workspace-method           'find-for-file-or-pick-first
          treemacs-git-command-pipe                ""
          treemacs-goto-tag-strategy               'refetch-index
          treemacs-header-scroll-indicators        '(nil . "^^^^^^")
          treemacs-hide-dot-git-directory          t
          treemacs-indentation                     2
          treemacs-indentation-string              " "
          treemacs-is-never-other-window           t
          treemacs-max-git-entries                 5000
          treemacs-missing-project-action          'ask
          treemacs-move-forward-on-expand          nil
          treemacs-no-png-images                   t
          treemacs-no-delete-other-windows         t
          treemacs-project-follow-cleanup          nil
          treemacs-persist-file                    (expand-file-name ".cache/treemacs-persist" user-emacs-directory)
          treemacs-position                        'left
          treemacs-read-string-input               'from-minibuffer
          treemacs-recenter-distance               0.1
          treemacs-recenter-after-file-follow      nil
          treemacs-recenter-after-tag-follow       nil
          treemacs-recenter-after-project-jump     'always
          treemacs-recenter-after-project-expand   'on-distance
          treemacs-litter-directories              '("/node_modules" "/.venv" "/.cask")
          treemacs-show-cursor                     nil
          treemacs-show-hidden-files               t
          treemacs-silent-filewatch                nil
          treemacs-silent-refresh                  nil
          treemacs-sorting                         'alphabetic-asc
          treemacs-select-when-already-in-treemacs 'move-back
          treemacs-space-between-root-nodes        t
          treemacs-tag-follow-cleanup              t
          treemacs-tag-follow-delay                1.5
          treemacs-text-scale                      nil
          treemacs-user-mode-line-format           nil
          treemacs-user-header-line-format         nil
          treemacs-wide-toggle-width               70
          treemacs-width                           35
          treemacs-width-increment                 1
          treemacs-width-is-initially-locked       t
          treemacs-workspace-switch-cleanup        nil
	  treemacs-hide-gitignored-files-mode      nil
	  treemacs-follow-mode                     t
	  treemacs-filewatch-mode                  t
	  treemacs-fringe-indicator-mode           'always)

    (when treemacs-python-executable
      (treemacs-git-commit-diff-mode t))

    (pcase (cons (not (null (executable-find "git")))
                 (not (null treemacs-python-executable)))
      (`(t . t)
       (treemacs-git-mode 'deferred))
      (`(t . _)
       (treemacs-git-mode 'simple)))

    ;; Treemacs theme config
    (treemacs-create-theme "treemacs-icons-theme"
      :config
      (progn
	(treemacs-create-icon :icon ""   :fallback " "   :extensions (root-open))
	(treemacs-create-icon :icon ""   :fallback " "   :extensions (root-closed))
	(treemacs-create-icon :icon ""   :fallback " "   :extensions (dir-open))
	(treemacs-create-icon :icon ""   :fallback " "   :extensions (dir-closed))
	(treemacs-create-icon :icon ""   :fallback " "   :extensions ("md"))
	(treemacs-create-icon :icon ""   :fallback " "   :extensions ("Dockerfile" ".dockerignore"))
	(treemacs-create-icon :icon ""   :fallback " "   :extensions ("el" "elc" "cl" "lisp"))
	(treemacs-create-icon :icon ""   :fallback " "   :extensions ("sh"))
	(treemacs-create-icon :icon ""   :fallback " "   :extensions (".gitignore" ".gitkeep"))
	(treemacs-create-icon :icon ""   :fallback " "   :extensions ("c"))
	(treemacs-create-icon :icon ""   :fallback " "   :extensions ("cpp"))
	(treemacs-create-icon :icon ""   :fallback " "   :extensions ("h" "hpp"))
	(treemacs-create-icon :icon ""   :fallback " "   :extensions ("py" "pyc"))
	(treemacs-create-icon :icon ""   :fallback "ﳑ "   :extensions ("go"))
	(treemacs-create-icon :icon ""   :fallback " "   :extensions ("xml"))
	(treemacs-create-icon :icon ""   :fallback " "   :extensions ("yml" "yaml"))
	(treemacs-create-icon :icon ""   :fallback " "   :extensions ("png" "jpg" "jpeg" "svg"))
	(treemacs-create-icon :icon ""   :fallback " "   :extensions ("mp3" "m4a" "ogg" "webm"))
	(treemacs-create-icon :icon ""   :fallback " "   :extensions ("tar" "tar.gz" "tar.xz" "rar" "zip"))
	(treemacs-create-icon :icon ""   :fallback " "   :extensions ("pdf"))
	(treemacs-create-icon :icon ""   :fallback " "   :extensions ("txt"))
	(treemacs-create-icon :icon ""   :fallback " "   :extensions ("LICENSE"))
	(treemacs-create-icon :icon ""   :fallback " "   :extensions (fallback))))
	
    (treemacs-load-theme "treemacs-icons-theme"))
      
  :bind
  (:map global-map
        ("M-0"       . treemacs-select-window)))

(use-package treemacs-magit
  :after (treemacs magit)
  :ensure t)
    
