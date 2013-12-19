
(add-to-list 'load-path "~/prj/dotfiles/emacsrc")
(add-to-list 'load-path "~/prj/dotfiles/emacsrc/packages")
(add-to-list 'load-path "~/prj/dotfiles/emacsrc/packages/auto-complete-1.3.1")
(add-to-list 'load-path "~/prj/dotfiles/emacsrc/packages/lua-mode")
(add-to-list 'load-path "~/prj/dotfiles/emacsrc/packages/python-mode")
(add-to-list 'load-path "~/prj/dotfiles/emacsrc/packages/yasnippet")
(add-to-list 'load-path "~/prj/dotfiles/emacsrc/packages/scala-mode2")
(add-to-list 'load-path "~/prj/dotfiles/emacsrc/packages/feature-mode/feature-mode-0.4")
(add-to-list 'load-path "~/prj/dotfiles/emacsrc/packages/color-theme-6.6.0")

(setq lintnode-location "~/prj/dotfiles/emacsrc/packages/lintnode")
(push lintnode-location load-path)
(push "~/prj/dotfiles/emacsrc/packages/org-mode/lisp" load-path)
(push "~/prj/dotfiles/emacsrc/packages/js2-mode" load-path)

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

;; lua
(load-library "emacs-rc-lua")

;; java script and json
(load-library "emacs-rc-js")

;; yasnippet
;;(load-library "emacs-rc-yasnippet")

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


;; SQL support
(load-library "emacs-rc-sql")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cedet-java-jdk-root (getenv "JAVA_HOME"))
 '(ede-project-directories (quote ("/home/a521286/prj/misc/rtc-hib" "/home/a521286/erc/trunk")))
 '(nxml-attribute-indent 2)
 '(nxml-auto-insert-xml-declaration-flag t)
 '(nxml-bind-meta-tab-to-complete-flag t)
 '(nxml-slash-auto-complete-flag t)
 '(rng-schema-locating-files (quote ("~/.schemas/schemas.xml" "/usr/share/emacs/24.2/etc/schema/schemas.xml")))
 '(semanticdb-javap-classpath (concat (getenv "JAVA_HOME") "/jre/lib/rt.jar"))
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Monaco" :foundry "unknown" :slant normal :weight normal :height 98 :width normal)))))
(put 'downcase-region 'disabled nil)
