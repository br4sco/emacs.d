(add-to-list 'load-path (concat user-emacs-directory "lisp/"))

(require 'init-packages)
(require 'init-misc)
(require 'init-appearance)
(require 'init-editing)
(require 'init-dired)
(require 'init-navigation)
(require 'init-tramp)
(require 'init-compile)
(require 'init-modelyze)
(require 'init-keybindings)

(use-package diminish)
(use-package bind-key)

(use-package exec-path-from-shell
  :config
  (exec-path-from-shell-initialize))

(use-package ido-completing-read+
  :config
  (ido-ubiquitous-mode 1))

(use-package amx
  :config
  (amx-mode)
  :bind
  ("C-x C-m" . amx))

(use-package projectile
  :diminish
  (projectile-mode)
  :custom
  (projectile-tags-command "ctags -Re -f \"%s\" %s \"%s\"")
  (projectile-use-git-grep t)
  :bind
  (([remap projectile-replace] . projectile-replace-regexp)
   ([remap projectile-run-term] . terminal-here-project-launch))
  :config
  (projectile-mode 1)
  (define-key projectile-mode-map (kbd "C-x p") 'projectile-command-map))

(use-package ibuffer-projectile
  :init (add-hook 'ibuffer-hook #'ibuffer-projectile-set-filter-groups))

(use-package editorconfig
  :diminish
  (editorconfig-mode)
  :config
  (editorconfig-mode 1))
