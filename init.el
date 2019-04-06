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

(use-package magit
  :config
  (setq magit-completing-read-function 'magit-ido-completing-read))

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

(use-package yasnippet
  :init
  (yas-global-mode 1)
  :custom
  (yas-snippet-dirs '("~/.emacs.d/snippets"))
  :diminish (yas-minor-mode)
  :config
  (setq yas-prompt-functions
        (cons 'yas-ido-prompt
              (cl-delete 'yas-ido-prompt yas-prompt-functions)))
  :bind
  ("M-/" . company-yasnippet))

(use-package company
  :diminish
  (company-mode)
  :custom
  (company-dabbrev-downcase nil)
  (company-idle-delay t)
  (company-minimum-prefix-length 2)
  (company-selection-wrap-around t)
  (company-require-match nil)
  (company-dabbrev-ignore-case nil)
  (company-transformers '(company-sort-by-occurrence))
  (company-show-numbers t)
  :config
  (global-company-mode 1)

  (let ((map company-active-map))
    (mapc (lambda (x) (define-key map (format "%d" x)
                        `(lambda () (interactive) (company-complete-number ,x))))
          (number-sequence 0 9))))
 
(use-package bash-completion
  :init (bash-completion-setup))

(use-package pdf-tools
  :config (pdf-tools-install))

(use-package editorconfig
  :diminish
  (editorconfig-mode)
  :config
  (editorconfig-mode 1))
