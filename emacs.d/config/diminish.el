(require 'company)
(eval-after-load "company"
   '(diminish 'company-mode "Cmp"))

(require 'paredit)
(eval-after-load "paredit"
  '(diminish 'paredit-mode))

(require 'magit)
(eval-after-load "magit"
  '(diminish 'magit-auto-revert-mode))

;; Major modes

(add-hook 'emacs-lisp-mode-hook 
  (lambda()
    (setq mode-name "el"))) 
