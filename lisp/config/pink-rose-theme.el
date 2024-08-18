;;; pink-rose-theme.el --- Theme
;;; Commentary:
;;; Code:

(deftheme pink-rose)

(let ((class '((class color) (min-colors 89)))
      (fg1 "#353535")
      (fg2 "#454545")
      (fg3 "#555555")
      (fg4 "#656565")
      (fg6 "#282828")
      (bg1 "#ffdfd6")
      (bg2 "#ebcdc5")
      (bg3 "#d6bbb4")
      (bg4 "#c2a9a3")
      (bg5 "#fdf0ed")
      (builtin "#79740e")
      (keyword "#9d0006")
      (const   "#941387")
      (comment "#808080")
      (func    "#43768c")
      (str     "#006100")
      (type    "#b85107")
      (var     "#353535")
      (selection "#dfdfdf")
      (warning   "#e00000")
      (warning2  "#ab5b00")
      (unspec   (when (>= emacs-major-version 29) 'unspecified)))

  (custom-theme-set-faces
   'pink-rose

   `(default ((,class (:background ,bg5 :foreground ,fg1))))
   `(cursor ((,class (:background ,fg4))))
   `(isearch ((,class (:bold t :foreground ,fg3 :background ,bg2))))
   `(isearch-fail ((,class (:bold t :foreground ,warning :background ,bg2))))
   `(highlight ((,class (:foreground ,fg3 :background ,bg3))))
   `(lazy-highlight ((,class (:foreground ,fg2 :background ,bg3))))
   `(fringe ((,class (:background ,bg1 :foreground ,fg4))))
   `(line-number ((t (:inherit fringe))))
   `(line-number-current-line ((t (:inherit fringe :foreground ,fg6 :weight bold))))
   `(hl-line ((,class (:background ,bg1))))
   `(region ((,class (:background ,selection))))
   `(mode-line ((,class (:box nil :bold t :foreground ,fg4 :background ,bg2))))
   `(mode-line-inactive ((,class (:foreground ,var :background ,bg2 :weight normal))))
   `(mode-line-emphasis ((,class (:foreground ,fg1))))
   `(vertical-border ((,class (:foreground ,fg3))))
   `(font-lock-comment-face ((,class (:foreground ,comment))))
   `(font-lock-doc-face ((,class (:foreground ,comment :slant italic))))
   `(font-lock-keyword-face ((,class (:bold ,class :foreground ,keyword))))
   `(font-lock-preprocessor-face ((,class (:foreground ,const))))
   `(font-lock-constant-face ((,class (:foreground ,const))))
   `(font-lock-string-face ((,class (:foreground ,str))))
   `(font-lock-variable-name-face ((,class (:foreground ,var))))
   `(font-lock-builtin-face ((,class (:foreground ,builtin))))
   `(font-lock-negation-char-face ((,class (:foreground ,const))))
   `(font-lock-reference-face ((,class (:foreground ,const))))
   `(font-lock-function-name-face ((,class (:foreground ,func))))
   `(font-lock-type-face ((,class (:foreground ,type))))
   `(font-lock-warning-face ((,class (:foreground ,warning :background ,bg2))))
   `(minibuffer-prompt ((,class (:bold t :foreground ,keyword))))
   `(link ((,class (:foreground ,const :underline t))))

   `(company-scrollbar-bg ((,class (:background ,bg3))))
   `(company-scrollbar-fg ((,class (:foreground ,keyword))))
   `(company-tooltip ((,class (:foreground ,fg2 :background ,bg2 :bold t))))
   `(company-tooltip-annotation ((,class (:background ,bg3 :foreground ,fg3))))
   `(company-tooltip-selection ((,class (:inherit 'company-tooltip-annotation))))
   `(company-tooltip-common ((,class (:underline t))))
   `(company-tooltip-common-selection ((,class (:foreground ,const :underline t))))
   `(company-preview ((,class (:background ,bg1 :foreground ,var))))
   `(company-preview-common ((,class (:foreground ,bg2 :foreground ,fg3))))
   `(company-preview-search ((,class (:foreground ,type :background ,bg1))))
   `(company-template-field ((,class (:inherit region))))
   `(company-echo-common ((,class (:foreground ,bg1 :background ,fg1))))

   `(css-proprietary-property ((,class (:foreground ,const))))
   `(css-property             ((,class (:foreground ,const))))
   `(css-selector             ((,class (:foreground ,type))))

   `(font-latex-bold-face ((,class (:foreground ,type))))
   `(font-latex-italic-face ((,class (:foreground ,var :italic t))))
   `(font-latex-string-face ((,class (:foreground ,str))))
   `(font-latex-match-reference-keywords ((,class (:foreground ,const))))
   `(font-latex-match-variable-keywords ((,class (:foreground ,var))))

   `(flycheck-error ((,class (:foreground ,warning))))
   `(flycheck-warning ((,class (:foreground ,warning2))))

   `(magit-item-highlight ((,class :background ,bg3)))
   `(magit-section-heading        ((,class (:foreground ,keyword :weight bold))))
   `(magit-hunk-heading           ((,class (:background ,bg3))))
   `(magit-section-highlight      ((,class (:background ,bg2))))
   `(magit-hunk-heading-highlight ((,class (:background ,bg3))))
   `(magit-diff-context-highlight ((,class (:background ,bg3 :foreground ,fg3))))
   `(magit-diffstat-added   ((,class (:foreground ,type))))
   `(magit-diffstat-removed ((,class (:foreground ,var))))
   `(magit-process-ok ((,class (:foreground ,func :weight bold))))
   `(magit-process-ng ((,class (:foreground ,warning :weight bold))))
   `(magit-branch ((,class (:foreground ,const :weight bold))))
   `(magit-log-author ((,class (:foreground ,fg3))))
   `(magit-hash ((,class (:foreground ,fg2))))
   `(magit-diff-file-header ((,class (:foreground ,fg2 :background ,bg3))))

   `(sh-quoted-exec ((t (:inherit font-lock-string-face))))
   `(sh-heredoc ((t (:inherit font-lock-string-face))))

   `(dired-directory ((,class (:foreground ,const))))
   `(vertico-posframe ((,class (:backgrond ,fg6))))
   `(completions-common-part ((,class (:foreground ,const))))
   `(show-paren-match ((,class (:foreground ,warning :background ,bg2))))))

;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'pink-rose)

;; Local Variables:
;; no-byte-compile: t
;; End:

;;; pink-rose-theme.el ends here
