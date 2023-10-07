;;; comment-toggle --- Simple library to toggle comments
;;; Commentary:
;;; Code:

(defun line-comment-toggle (&optional arg)
  "Used to toggle comments on line.
ARG is used in inner `comment-dwim' call, so refer to its documentation."
  (interactive "*P")
  (if (region-active-p)
      (comment-dwim arg)
    (let ((line-beg (line-beginning-position))
          (line-end (line-end-position)))
      (if (eq line-beg line-end)
          (comment-dwim nil)
        (progn
          (comment-or-uncomment-region line-beg line-end)
          (forward-line))))))

(global-set-key (kbd "M-;") 'line-comment-toggle)

(provide 'line-comment-toggle)
;;; comment-toggle.el ends here
