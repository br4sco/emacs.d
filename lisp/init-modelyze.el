(defun modelyze--setup-error-matching ()
  (require 'compile)
  (push 'modelyze compilation-error-regexp-alist)
  (push '(modelyze "^\\(.+\\) \\([0-9]+\\):\\([0-9]+\\)-\\([0-9]+\\):\\([0-9]+\\) error: " 1 2 (3 . 4) 2)
        compilation-error-regexp-alist-alist))

(setq modelyze-keywords '("if" "then" "else" "def" "fun" "match" "with" "include" "type"))
(setq modelyze-errors '("error"))
(setq modelyze-constants '("true" "false"))
(setq modelyze-builtins '("Array" "Map" "Set" "fst" "snd" "sval" "lift" "sym" "dprint" "symstr" "fwrite" "DAESolver" "NLEQSolver"))
(setq modelyze-types '("?" "Bool" "Int" "Real" "String"))

(setq modelyze--errors-regex (regexp-opt modelyze-errors 'symbols))
(setq modelyze--constants-regex (regexp-opt modelyze-constants 'symbols))
(setq modelyze--builtins-regex (regexp-opt modelyze-builtins 'symbols))
(setq modelyze--types-regex (regexp-opt modelyze-types 'words))

(require 'generic-x)
(define-generic-mode 'modelyze-mode
  '("//" ("/*" . "*/"))

  modelyze-keywords

  `((,modelyze--errors-regex . font-lock-warning-face)
    (,modelyze--constants-regex . font-lock-constant-face)
    (,modelyze--builtins-regex . font-lock-builtin-face)
    (,modelyze--types-regex . (1 font-lock-type-face)))

  '("\\.moz$")
  (list 'modelyze--setup-error-matching)
  "A mode for Modelyze files")

(add-hook 'modelyze-mode-hook
          (lambda () (local-set-key (kbd "C-c C-c") #'compile)))

(add-hook 'modelyze-mode-hook
          (lambda ()
            (set (make-local-variable 'compile-command)
                 (format "moz %s" (file-name-nondirectory buffer-file-name)))))

(add-hook 'modelyze-mode-hook #'hs-minor-mode)

(provide 'init-modelyze)
