(require 'cl)
(require 'package)

(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

(defvar my-packages
  '(ace-window
    adoc-mode
    better-defaults
    color-theme-solarized
    company
    company-ghc
    diminish
    dired-details
    discover
    expand-region
    find-file-in-project
    gist
    haskell-mode
    hi2
    hindent
    magit
    multiple-cursors
    neotree
    nyan-mode
    org-present
    ox-asciidoc
    ox-gfm
    ox-pandoc
    ox-reveal
    paredit
    powerline
    prodigy
    rainbow-delimiters
    shm
    smex
    undo-tree
    weechat
    writeroom-mode
    yasnippet)
  "A list of packages to ensure are installed at launch.")

(defun packages-installed-p ()
  "Check if all packages in `packages' are installed."
  (every #'package-installed-p my-packages))

(defun require-package (package)
  "Install PACKAGE unless already installed."
  (unless (memq package my-packages)
    (add-to-list 'packages package))
  (unless (package-installed-p package)
    (package-install package)))

(defun require-packages (packages)
  "Ensure PACKAGES are installed.
Missing packages are installed automatically."
  (mapc #'require-package packages))

(defun install-packages ()
  "Install all packages listed in `packages'."
  (unless (packages-installed-p)
    ;; check for new packages (package versions)
    (message "%s" "Refreshing package database...")
    (package-refresh-contents)
    (message "%s" " done.")
    ;; install the missing packages
    (require-packages my-packages)))

;; run package installation
(install-packages)
