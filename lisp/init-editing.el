(defun xah-comment-dwim ()
  "Like `comment-dwim', but toggle comment if cursor is not at end of line.

    URL `http://ergoemacs.org/emacs/emacs_toggle_comment_by_line.html'
    Version 2016-10-25"
  (interactive)
  (if (region-active-p)
      (comment-dwim nil)
    (let (($lbp (line-beginning-position))
          ($lep (line-end-position)))
      (if (eq $lbp $lep)
          (progn
            (comment-dwim nil))
        (if (eq (point) $lep)
            (progn
              (comment-dwim nil))
          (progn
            (comment-or-uncomment-region $lbp $lep)
            (forward-line )))))))

(set-default 'indent-tabs-mode nil)
(setq tab-width 2)
(electric-pair-mode 1)
(global-subword-mode 1)
(delete-selection-mode 1)
(save-place-mode 1)
(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)
(setq make-backup-files nil)
(setq auto-save-default nil)
(global-auto-revert-mode 1)
(setq mouse-yank-at-point t)
(setq require-final-newline t)

(provide 'init-editing)
