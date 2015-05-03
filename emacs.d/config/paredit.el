(defun add-hooks (modes func)
  (dolist (mode modes)
    (add-hook (intern (concat (symbol-name mode) "-hook")) func)))

(setq my-lisp-modes
      '(scheme-mode emacs-lisp-mode lisp-modee))

(defun add-lisp-hook (func)
  (add-hooks my-lisp-modes func))

;; Paredit for all lisps
(autoload 'paredit-mode "paredit.el" nil t)
(add-lisp-hook (lambda ()
                 (paredit-mode 1)))
