(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "C-x C-m") 'execute-extended-command)
(global-set-key (kbd "M-;") 'xah-comment-dwim)
(global-set-key (kbd "M-/") 'hippie-expand)

(define-key shell-mode-map (kbd "C-l") 'comint-clear-buffer)

(provide 'init-keybindings)
