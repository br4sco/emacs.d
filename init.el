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

(use-package editorconfig
  :diminish
  (editorconfig-mode)
  :config
  (editorconfig-mode 1))
