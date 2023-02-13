(defun line-comment-toggle (&optional arg)
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
