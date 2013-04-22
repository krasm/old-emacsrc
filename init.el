(add-to-list 'load-path "~/prj/dotfiles/emacsrc")
(add-to-list 'load-path "~/prj/dotfiles/emacsrc/packages")
(add-to-list 'load-path "~/prj/dotfiles/emacsrc/packages/auto-complete-1.3.1")
(add-to-list 'load-path "~/prj/dotfiles/emacsrc/packages/python")
(add-to-list 'load-path "~/prj/dotfiles/emacsrc/packages/pymacs")

;; misc stuff
(load-library "emacs-rc-misc")

;; color theme
(load-library "emacs-rc-color-theme")

;; emacs server
(load-library "emacs-rc-server")

;; nxml-mode
(load-library "emacs-rc-nxml")

;; autocomplete-mode
(load-library "emacs-rc-autocomplete")

;; python-mode
(load-library "emacs-rc-python")

;; java stuff
(load-library "emacs-rc-java")

;; org mode
(load-library "emacs-rc-org")

;; lua
;;(load-library "emacs-rc-lua")

;; java script and json
(load-library "emacs-rc-js")

;; cedet 
(load-library "emacs-rc-cedet")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ede-project-directories (quote ("/home/a521286/erc/trunk")))
 '(nxml-attribute-indent 2)
 '(nxml-auto-insert-xml-declaration-flag t)
 '(nxml-bind-meta-tab-to-complete-flag t)
 '(nxml-slash-auto-complete-flag t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Monaco" :foundry "unknown" :slant normal :weight normal :height 98 :width normal)))))
