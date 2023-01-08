;; (defun line-comment-toggle ()
;;   (interactive)
;;   (if (region-active-p)
;;       (comment-dwim 'plain)
;;     (let (($lbp (line-beginning-position))
;;           ($lep (line-end-position)))
;;       (if (eq $lbp $lep)
;;           (progn
;;             (comment-dwim nil))
;;         (if (eq (point) $lep)
;;             (progn
;;               (comment-dwim nil))
;;           (progn
;;             (comment-or-uncomment-region $lbp $lep)
;;             (forward-line )))))))

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
