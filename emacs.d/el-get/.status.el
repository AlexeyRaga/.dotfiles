((auto-complete status "installed" recipe
		(:name auto-complete :website "https://github.com/auto-complete/auto-complete" :description "The most intelligent auto-completion extension." :type github :pkgname "auto-complete/auto-complete" :depends
		       (popup fuzzy)
		       :features
		       (auto-complete auto-complete-config)
		       :post-init
		       (ac-config-default)))
 (el-get status "installed" recipe
	 (:name el-get :website "https://github.com/dimitri/el-get#readme" :description "Manage the external elisp bits and pieces you depend upon." :type github :branch "master" :pkgname "dimitri/el-get" :info "." :compile
		("el-get.*\\.el$" "methods/")
		:load "el-get.el"))
 (fuzzy status "installed" recipe
	(:name fuzzy :website "https://github.com/auto-complete/fuzzy-el" :description "Fuzzy matching utilities for GNU Emacs" :type github :pkgname "auto-complete/fuzzy-el"))
 (ghc-mod status "installed" recipe
	  (:name ghc-mod :description "Happy Haskell programming" :type github :pkgname "kazu-yamamoto/ghc-mod" :load-path "elisp" :post-init
		 (progn
		   (autoload 'ghc-init "ghc" nil t)
		   (defun el-get-ghc-mod-hook nil
		     (ghc-init)
		     (flymake-mode))
		   (add-hook 'haskell-mode-hook 'el-get-ghc-mod-hook))))
 (haskell-mode status "installed" recipe
	       (:name haskell-mode :description "A Haskell editing mode" :type github :pkgname "haskell/haskell-mode" :info "." :build
		      `(("make" ,(format "EMACS=%s" el-get-emacs)
			 "all"))
		      :post-init
		      (progn
			(require 'haskell-mode-autoloads)
			(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
			(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
			(setq haskell-process-type 'cabal-repl haskell-process-args-cabal-repl
			      '("--ghc-option=-ferror-spans"))
			(define-key haskell-mode-map
			  (kbd "C-x C-d")
			  nil)
			(define-key haskell-mode-map
			  (kbd "C-c C-z")
			  'haskell-interactive-switch)
			(define-key haskell-mode-map
			  (kbd "C-c C-l")
			  'haskell-process-load-file)
			(define-key haskell-mode-map
			  (kbd "C-c C-b")
			  'haskell-interactive-switch)
			(define-key haskell-mode-map
			  (kbd "C-c C-t")
			  'haskell-process-do-type)
			(define-key haskell-mode-map
			  (kbd "C-c C-i")
			  'haskell-process-do-info)
			(define-key haskell-mode-map
			  (kbd "C-c M-.")
			  nil)
			(define-key haskell-mode-map
			  (kbd "C-c C-d")
			  nil)
			(define-key haskell-mode-map
			  (kbd "C-c v c")
			  'haskell-cabal-visit-file)
			(defun el-get-ac-haskell-candidates
			  (prefix)
			  (let
			      ((cs
				(haskell-process-get-repl-completions
				 (haskell-process)
				 prefix)))
			    (remove-if
			     (lambda
			       (c)
			       (string= "" c))
			     cs)))
			(ac-define-source haskell
			  '((candidates el-get-ac-haskell-candidates ac-prefix)))
			(defun el-get-haskell-hook nil
			  (add-to-list 'ac-sources 'ac-source-haskell))
			(add-hook 'haskell-mode-hook 'el-get-haskell-hook))
		      :depends
		      (auto-complete)))
 (popup status "installed" recipe
	(:name popup :website "https://github.com/auto-complete/popup-el" :description "Visual Popup Interface Library for Emacs" :type github :submodule nil :pkgname "auto-complete/popup-el"))
 (structured-haskell-mode status "installed" recipe
			  (:name structured-haskell-mode :depends haskell-mode :type github :pkgname "chrisdone/structured-haskell-mode" :features shm :load-path "elisp")))
