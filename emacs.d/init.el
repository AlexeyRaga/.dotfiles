;; PACKAGE
(require 'package)
(add-to-list 'package-archives
  '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

;;FIX PATH FOR OSX
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

;;APPEARANCE

;; THEMES
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/emacs-color-theme-solarized")
(load-theme 'solarized-dark t)

;; POWERLINE
(add-to-list 'load-path "~/.emacs.d/vendor/emacs-powerline")
(require 'powerline)

;; NO FRILLS
(dolist (mode '(menu-bar-mode tool-bar-mode scroll-bar-mode))
  (when (fboundp mode) (funcall mode -1)))
(setq inhibit-startup-screen t)

;; NO JUNK
(setq auto-save-file-name-transforms `((".*" ,temporary-file-directory t))
      backup-directory-alist `((".*" . ,temporary-file-directory)))

;; ERGO-EMACS
(require 'ergoemacs-mode)
(setq ergoemacs-theme nil) ;; Uses Standard Ergoemacs keyboard theme
(setq ergoemacs-keyboard-layout "us") ;; Assumes QWERTY keyboard layout
(ergoemacs-mode 1)

(global-set-key "\C-d" "\M-7\M-c\C-q\C-j\C-v")

(global-set-key (kbd "<f3>") 'bs-show)
(global-set-key (kbd "<f12>") 'bs-cycle-next)
(global-set-key (kbd "M-<f12>") 'next-buffer)
(global-set-key (kbd "<f11>") 'bs-cycle-previous)

(require 'sr-speedbar)
(global-set-key (kbd "<f2>") 'sr-speedbar-toggle)

;; IDO
(mapc (lambda (ext)
        (push ext completion-ignored-extensions))
      '(
	".dat" ".bak" ".zip" ".gz" ".dmg" ".apk" ".bz2" ".rar" ".tar"
	".pdf" ".mobi" ".epub"
        ".dvi" ".djvu" ".ps"
        ".mov" ".mp4" ".ogv" ".mp3" ".ogg"
        ".doc" ".docx" ".ods" ".odt" ".pps" ".ppt" ".pptx" ".xls" ".xslx"
	".class" ".hi" ".dyn_hi" ".p_hi" ".o"
	".DC_Store"
        ))

(setq ido-enable-flex-matching t
      ido-enable-regexp t
      ido-use-filename-at-point 'guess
      ido-everywhere t
      ido-ignore-extensions t
      ido-file-extensions-order '(".hs" ".scala" ".org" ".txt" ".py" ".emacs" ".xml" ".el" ".ini" ".cfg" ".cnf"))

(eval-after-load "ido"
  '(progn
     ;(setq ido-ignore-buffers (append ido-ignore-buffer '("\\` " "\\`\\*.*\\*" "_region_")))
     (setq ido-ignore-directories (append ido-ignore-directories '("^auto/$" "\\.prv/" "_region_")))
     (setq ido-ignore-files (append ido-ignore-files '("^auto/$" "_region_" "Minibuf" "DS_Store", "TAGS")))
     (fset 'ido-directory-too-big-p #'ignore)))

(ido-mode 1)

;;SNIPPENTS
(require 'yasnippet)
(yas-global-mode 1)

;;HASKELL
(setenv "PATH" (concat "/Users/alexey/Library/Haskell/bin:" (getenv "PATH")))
(add-to-list 'exec-path "/Users/alexey/Library/Haskell/bin")

;;(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
(add-hook 'haskell-mode-hook 'turn-on-hi2)
(eval-after-load 'haskell-mode
          '(define-key haskell-mode-map [f8] 'haskell-navigate-imports))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-ghc-show-info t)
 '(delete-selection-mode t)
 '(haskell-process-auto-import-loaded-modules t)
 '(haskell-process-log t)
 '(haskell-process-suggest-remove-import-lines t)
 '(haskell-process-type (quote cabal-repl))
 '(haskell-tags-on-save t)
 '(org-CUA-compatible nil)
 '(org-replace-disputed-keys nil)
 '(recentf-mode t)
 '(shift-select-mode nil))

(eval-after-load 'haskell-mode '(progn
  (define-key haskell-mode-map (kbd "C-c C-l") 'haskell-process-load-or-reload)
  (define-key haskell-mode-map (kbd "C-c C-z") 'haskell-interactive-switch)
  (define-key haskell-mode-map (kbd "C-c C-n C-t") 'haskell-process-do-type)
  (define-key haskell-mode-map (kbd "C-c C-n C-i") 'haskell-process-do-info)
  (define-key haskell-mode-map (kbd "C-c C-n C-c") 'haskell-process-cabal-build)
  (define-key haskell-mode-map (kbd "C-c C-n c") 'haskell-process-cabal)
  (define-key haskell-mode-map (kbd "C-g t") 'ghc-insert-template-or-signature)
  (define-key haskell-mode-map (kbd "C-g i") 'ghc-try-initial-code-from-signature)
  (define-key haskell-mode-map (kbd "C-g a") 'ghc-auto)
  (define-key haskell-mode-map (kbd "C-g s") 'ghc-case-split)
  (define-key haskell-mode-map (kbd "C-g SPC") 'ghc-check-insert-from-warning)
  (define-key haskell-mode-map (kbd "M-<f9>") 'haskell-compile)
  (define-key haskell-mode-map (kbd "SPC") 'haskell-mode-contextual-space)))
(eval-after-load 'haskell-cabal '(progn
  (define-key haskell-cabal-mode-map (kbd "C-c C-z") 'haskell-interactive-switch)
  (define-key haskell-cabal-mode-map (kbd "C-c C-k") 'haskell-interactive-mode-clear)
  (define-key haskell-cabal-mode-map (kbd "C-c C-c") 'haskell-process-cabal-build)
  (define-key haskell-cabal-mode-map (kbd "C-c c") 'haskell-process-cabal)))

(eval-after-load 'haskell-mode
  '(define-key haskell-mode-map (kbd "C-c C-o") 'haskell-compile))
(eval-after-load 'haskell-cabal
  '(define-key haskell-cabal-mode-map (kbd "C-c C-o") 'haskell-compile))

(autoload 'ghc-init "ghc" nil t)
(autoload 'ghc-debug "ghc" nil t)
(add-hook 'haskell-mode-hook (lambda () (ghc-init)))

(require 'company)
(add-hook 'haskell-mode-hook 'company-mode)
(add-to-list 'company-backends 'company-ghc)

(require 'rainbow-delimiters)
(add-hook 'haskell-mode-hook 'rainbow-delimiters-mode)

(require 'haskell-yas)

;;(yas/load-directory "~/.emacs.d/el-get/haskell-mode/snippets/haskell-mode")

;;(setq-default yas-prompt-functions '(yas-ido-prompt yas-dropdown-prompt))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
