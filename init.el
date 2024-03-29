(defconst conf-dir "~/prj/dotfiles/emacsrc")

(add-to-list 'load-path conf-dir)
(add-to-list 'load-path (concat conf-dir "/packages"))
(add-to-list 'load-path (concat conf-dir "/packages/git-modes"))
(add-to-list 'load-path (concat conf-dir "/packages/auto-complete-1.3.1"))
(add-to-list 'load-path (concat conf-dir "/packages/lua-mode"))
(add-to-list 'load-path (concat conf-dir "/packages/python-mode"))
(add-to-list 'load-path (concat conf-dir "/packages/yasnippet"))
(add-to-list 'load-path (concat conf-dir "/packages/scala-mode2"))
(add-to-list 'load-path (concat conf-dir "/packages/feature-mode/feature-mode-0.4"))
(add-to-list 'load-path (concat conf-dir "/packages/color-theme-6.6.0"))
(add-to-list 'load-path (concat conf-dir "/packages/org/lisp"))
(add-to-list 'load-path (concat conf-dir "/packages/magit"))


(push (concat conf-dir "/packages/lintnode") load-path)
(push (concat conf-dir "/packages/org-mode/lisp") load-path)
(push (concat conf-dir "/packages/js2-mode") load-path)

;; misc stuff
(load-library "emacs-rc-misc")

;; color theme
(if (< emacs-major-version 24)
    (load-library "emacs-rc-color-theme")
  (load-theme 'misterioso t))

;; emacs server
(load-library "emacs-rc-server")

;; nxml-mode
(load-library "emacs-rc-nxml")

;; autocomplete-mode
(load-library "emacs-rc-autocomplete")


;; add line to buffer to indicate end of lines
(load-library "emacs-rc-fill-column-indicator.el")

;; python-mode
;;(load-library "emacs-rc-python")

;; java stuff
(load-library "emacs-rc-java")

;; org mode
(load-library "emacs-rc-org")

;; cc-mode 
(load-library "emacs-rc-cc-mode")


;; lua
(load-library "emacs-rc-lua")

;; java script and json
(load-library "emacs-rc-js")

;; yasnippet
(load-library "emacs-rc-yasnippet")

;; ido mode
(load-library "emacs-rc-ido")

;; cedet 
;;(load-library "emacs-rc-cedet")

;; cucumber mode 
(load-library "emacs-rc-cucumber")

;; ediff mode
(load-library "emacs-rc-ediff")

;; mutt support
(load-library "emacs-rc-ediff")

;; scala mode 
(if (>= emacs-major-version 24)
    (load-library "emacs-rc-scala"))

;; java script mode
(load-library "emacs-rc-lintnode")
(load-library "emacs-rc-jscomint")

;; magit
(load-library "emacs-rc-magit")

;; SQL support
;; quick hack - on my chrome book
;; I do not need sqlplus, and on chrome 
;; I'm running emacs n console
(if (display-images-p)
    (load-library "emacs-rc-sql")
  )

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(display-time-mode t)
 '(nxml-attribute-indent 2)
 '(nxml-auto-insert-xml-declaration-flag t)
 '(nxml-bind-meta-tab-to-complete-flag t)
 '(nxml-slash-auto-complete-flag t)
 '(org-agenda-files nil)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'downcase-region 'disabled nil)
