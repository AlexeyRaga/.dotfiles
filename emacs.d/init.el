;; First, enter full screen mode.
(set-frame-parameter nil 'fullscreen 'fullboth)

(require 'cl)

;; Add some stuff to PATH and exec-path
(setenv "PATH" (concat (getenv "PATH") ":~/Library/Haskell/bin"))
(setq exec-path (append exec-path '("~/Library/Haskell/bin")))

(setenv "PATH" (concat (getenv "PATH") ":~/.emacs.d/vendor/structured-haskell-mode/.cabal-sandbox/bin"))
(setq exec-path (append exec-path '("~/.emacs.d/vendor/structured-haskell-mode/.cabal-sandbox/bin")))

;; Configs to load
(defvar configs
  '(
    packages
    linum
    global
    path
    backup
    bindings
    company
    diminish
    eshell
    haskell
    ido
    magit
    occur
    paredit
    registers
    neotree
;    weechat
;    weechat-private
    )
  "A list of config files to load.")

;; Load each config file in `configs`.
(loop for name in configs
      do (load (concat (file-name-directory load-file-name)
                       "config/"
                       (symbol-name name) ".el")))

(load-theme 'solarized t)
(powerline-default-theme)

(setq ring-bell-function 'ignore)

;; why not?
;(nyan-mode 1)
(setq nyan-bar-length 16
      nyan-wavy-trail t)
(eshell)
