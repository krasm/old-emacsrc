
(require 'auto-complete-config)
(ac-config-default)
(setq ac-auto-start nil)
(define-key ac-mode-map [(meta return)] 'auto-complete)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dicts")
(add-to-list 'ac-dictionary-directories "~/prj/dotfiles/emacsrc/packages/auto-complete-1.3.1/dict")
(global-auto-complete-mode t)
; start auto compl after 2 characters
(setq ac-auto-start 2)
; case sensitivity is important when finding matches
(setq ac-ignore-case nil)
