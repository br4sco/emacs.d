(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

(setq ido-default-file-method 'selected-window)
(setq ido-default-buffer-method 'selected-window)
(setq ido-enable-flex-matching nil)
(setq ido-create-new-buffer 'always)

(ido-mode 1)
(winner-mode 1)

(provide 'init-navigation)
