;;; init.el --- Where all the magic begins
;;
;;; Commentary:
;; This file loads Org-mode and then loads the rest of the Emacs initialization from Emacs Lisp
;; embedded in the literate Org-mode file: readme.org
;;
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-use-package 'use-package)
(setq straight-use-package-by-default t)

(setq emacs-dir (file-name-directory (or (buffer-file-name) load-file-name)))

;; load up Org-mode and Org-babel
(require 'org)
(require 'ob-tangle)

;; load up all literate org-mode files in this directory
;; (mapc #'org-babel-load-file (directory-files emacs-dir t "\\.org$"))
(org-babel-load-file (expand-file-name "emacs.org" user-emacs-directory))

;;; init.el ends here
