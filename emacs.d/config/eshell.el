(setq eshell-visual-commands
      '("less" "tmux" "htop" "top" "bash" "zsh" "fish"))

(setq eshell-visual-subcommands
      '(("git" "log" "l" "diff" "show")))

;; C-d on an empty line in the shell terminates the process.
;; C-d again kills the eshell buffer.
(defun comint-delchar-or-eof-or-kill-buffer (arg)
  (interactive "p")
  (if (null (get-buffer-process (current-buffer)))
      (kill-buffer)
    (comint-delchar-or-maybe-eof arg)))

(defun my-clear ()
  (interactive)
  (let ((comint-buffer-maximum-size 0))
    (comint-truncate-buffer)))

(defun clear-shell-hook ()
      (local-set-key (kbd "C-cl") 'my-clear))

    (add-hook 'shell-mode-hook 'clear-shell-hook)

(add-hook 'shell-mode-hook
          (lambda ()
            (define-key shell-mode-map
              (kbd "C-d") 'comint-delchar-or-eof-or-kill-buffer)))

(setq eshell-cmpl-cycle-completions nil)
