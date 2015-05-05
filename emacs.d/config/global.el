;; No splash screen please ... jeez
(setq inhibit-startup-message t)

;; Shorten confirmation prompts
(defalias 'yes-or-no-p 'y-or-n-p)

;; custom place to save customizations
(setq custom-file "~/.emacs.d/custom.el")
(when (file-exists-p custom-file) (load custom-file))

;; Auto refresh buffers
(global-auto-revert-mode 1)

;; Also auto refresh dired, but be quiet about it
(setq global-auto-revert-non-file-buffers t)
(setq auto-revert-verbose nil)

;; Make dired less verbose
(require 'dired-details)
(setq-default dired-details-hidden-string "--- ")
(dired-details-install)

;; For winners
(winner-mode)

;; fully redraw the display before processing queued input events.
(setq redisplay-dont-pause t)

;; Autofill comments
(setq comment-auto-fill-only-comments t)

;;; Enable better defaults
(global-font-lock-mode 1)
(show-paren-mode 1)
(line-number-mode 1)
(column-number-mode 1)
(size-indication-mode 1)
(transient-mark-mode 1)
(delete-selection-mode 1)
;; (set-auto-saves)

;;; Default mode settings
(setq default-major-mode 'text-mode)
(setq-default indent-tabs-mode nil)
(setq-default cursor-type 'bar)

;;; Hooks
(add-hook 'text-mode-hook 'auto-fill-mode)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;;; Auto-loads
                                        ;
;; Haskell
(add-to-list 'auto-mode-alist (cons "\\.hs\\'" 'haskell-mode))
(add-to-list 'auto-mode-alist (cons "\\.cabal\\'" 'haskell-cabal-mode))
(add-to-list 'auto-mode-alist '("\\.hcr\\'" . haskell-core-mode))

;; Asciidoc
(add-to-list 'auto-mode-alist '("\\.adoc\\'" . adoc-mode))

;;; Environment settings
(set-language-environment "UTF-8")

;;; Uniquify
(setq uniquify-buffer-name-style (quote post-forward-angle-brackets))

;;; Enable some global modes
(global-discover-mode 1)

;;; YaSnipet
;(require 'yasnippet)
;(yas-global-mode 1

(global-set-key (kbd "s-<f12>") 'bs-show)
(global-set-key (kbd "<f12>") 'bs-cycle-next)
(global-set-key (kbd "M-<f12>") 'next-buffer)
(global-set-key (kbd "<f11>") 'bs-cycle-previous)