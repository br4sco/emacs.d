(require 'dired-x)

(setq dired-listing-switches "-alh --group-directories-first")
(setq dired-dwim-target t)
(setq dired-isearch-filenames t)
(setq dired-clean-up-buffers-too t)
(setq dired-recursive-copies 'always)
(setq dired-recursive-deletes 'always)
(setq dired-omit-files "^\\..+$")

(add-hook 'dired-mode-hook (lambda () (dired-omit-mode 1)))

(provide 'init-dired)
