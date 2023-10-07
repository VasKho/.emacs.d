(defun translate-keystrokes-ru->en ()
  "Make emacs output english characters, regardless whether the OS keyboard is english or russian"
  (cl-flet ((make-key-stroke (prefix char)
	      (eval `(kbd ,(if (and (string-match "^C-" prefix)
				    (string-match "[A-Z]" (string char)))
			       (concat "S-" prefix (string (downcase char)))
			     (concat prefix (string char)))))))
    (let ((case-fold-search nil)
          (keys-pairs (cl-mapcar 'cons
				 "йцукенгшщзхъфывапролджэячсмитьбюЙЦУКЕНГШЩЗХЪФЫВАПРОЛДЖ\ЭЯЧСМИТЬБЮ№"
				 "qwertyuiop[]asdfghjkl;'zxcvbnm,.QWERTYUIOP{}ASDFGHJKL:\"ZXCVBNM<>#"))
          (prefixes '(""    "s-"    "M-"    "M-s-"
		      "C-"  "C-s-"  "C-M-"  "C-M-s-")))
      (mapc (lambda (prefix)
	      (mapc (lambda (pair)
		      (define-key key-translation-map
				  (make-key-stroke prefix (car pair))
				  (make-key-stroke prefix (cdr pair))))
		    keys-pairs))
	    prefixes))))

(defun literal-insert ()
  (interactive)
  (insert-char last-input-event 1))

(define-minor-mode literal-insert-mode
  "Make emacs output characters corresponging to the OS keyboard,
 ignoring the key-translation-map"
  :keymap (let ((new-map (make-sparse-keymap))
                (english-chars "qwertyuiop[]asdfghjkl;'zxcvbnm,.QWERTYUIOP{}ASDFGHJKL:\"ZXCVBNM<>#"))
            (mapc (lambda (char)
                    (define-key new-map (string char)
				'literal-insert))
                  english-chars)
            new-map))

(define-globalized-minor-mode global-literal-mode
  literal-insert-mode
  (lambda ()
    (translate-keystrokes-ru->en)
    (literal-insert-mode 1)))

(global-literal-mode 1)
