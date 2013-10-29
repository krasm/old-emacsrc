
(require 'auto-complete-config)
(ac-config-default)
(setq ac-auto-start nil)
(define-key ac-mode-map [(meta return)] 'auto-complete)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dicts")
(global-auto-complete-mode t)
