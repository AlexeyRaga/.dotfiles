;; enable purescript smart indentation and purscheck whenever a
;; purescript file is loaded into emacs
;(require 'purescript-mode-autoloads)
(add-hook 'purescript-mode-hook 'turn-on-purescript-indentation)
;(add-hook 'purescript-mode-hook 'flycheck-mode)