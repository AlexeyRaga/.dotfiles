;; Show previously opened buffers in ido-switch-buffer
(setq ido-use-virtual-buffers t)

(setq smex-save-file (concat user-emacs-directory ".smex-items"))
(smex-initialize)

(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

(mapc (lambda (ext)
        (push ext completion-ignored-extensions))
      '(".dat" ".bak" ".zip" ".gz" ".dmg" ".apk" ".bz2" ".rar" ".tar"
        ".pdf" ".mobi" ".epub"
        ".dvi" ".djvu" ".ps"
        ".mov" ".mp4" ".ogv" ".mp3" ".ogg"
        ".doc" ".docx" ".ods" ".odt" ".pps" ".ppt" ".pptx" ".xls" ".xslx"
        ".class" ".hi" ".dyn_hi" ".p_hi" ".o"
        ".DC_Store"
       ))
