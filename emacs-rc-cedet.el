;;; emacs-rc-cedet.el ---

(load-file "~/prj/dotfiles/emacsrc/packages/cedet/cedet-devel-load.el")
(load-file "~/prj/dotfiles/emacsrc/packages/cedet/contrib/cedet-contrib-load.el")
(add-to-list 'load-path "~/prj/dotfiles/emacsrc/packages/cedet/lisp/cedet/")
(add-to-list 'load-path "~/prj/dotfiles/emacsrc/packages/cedet/lisp/cedet/semantic")

;;(add-to-list  'Info-directory-list "~/projects/cedet-bzr/doc/info")

(add-to-list 'semantic-default-submodes 'global-semanticdb-minor-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-mru-bookmark-mode)
(add-to-list 'semantic-default-submodes 'global-semanticdb-minor-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-idle-scheduler-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-stickyfunc-mode)
(add-to-list 'semantic-default-submodes 'global-cedet-m3-minor-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-highlight-func-mode)
;;(add-to-list 'semantic-default-submodes 'global-semantic-show-unmatched-syntax-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-highlight-edits-mode)
;;(add-to-list 'semantic-default-submodes 'global-semantic-show-parser-state-mode)

(semantic-load-enable-gaudy-code-helpers)
;; Activate semantic
(semantic-mode t)

(require 'semantic/bovine/c)
(require 'semantic/bovine/clang)

(require 'cedet-files)

;; loading contrib...
(require 'eassist)

;; customisation of modes
(defun alexott/cedet-hook ()
  (local-set-key [(control return)] 'semantic-ia-complete-symbol-menu)
  (local-set-key "\C-c?" 'semantic-ia-complete-symbol)
  ;;
  (local-set-key "\C-c>" 'semantic-comsemantic-ia-complete-symbolplete-analyze-inline)
  (local-set-key "\C-c=" 'semantic-decoration-include-visit)

  (local-set-key "\C-cj" 'semantic-ia-fast-jump)
  (local-set-key "\C-cq" 'semantic-ia-show-doc)
  (local-set-key "\C-cs" 'semantic-ia-show-summary)
  (local-set-key "\C-cp" 'semantic-analyze-proto-impl-toggle)
  (local-set-key (kbd "C-c <left>") 'semantic-tag-folding-fold-block)
  (local-set-key (kbd "C-c <right>") 'semantic-tag-folding-show-block)
  (add-to-list 'ac-sources 'ac-source-semantic)
  )
(add-hook 'semantic-init-hooks 'alexott/cedet-hook)
(add-hook 'c-mode-common-hook 'alexott/cedet-hook)
(add-hook 'lisp-mode-hook 'alexott/cedet-hook)
(add-hook 'scheme-mode-hook 'alexott/cedet-hook)
(add-hook 'emacs-lisp-mode-hook 'alexott/cedet-hook)
(add-hook 'erlang-mode-hook 'alexott/cedet-hook)
(add-hook 'java-mode-common-hook 'alexott/cedet-hook)

(defun alexott/c-mode-cedet-hook ()
 ;; (local-set-key "." 'semantic-complete-self-insert)
 ;; (local-set-key ">" 'semantic-complete-self-insert)
  (local-set-key "\C-ct" 'eassist-switch-h-cpp)
  (local-set-key "\C-xt" 'eassist-switch-h-cpp)
  (local-set-key "\C-ce" 'eassist-list-methods)
  (local-set-key "\C-c\C-r" 'semantic-symref)

  (add-to-list 'ac-sources 'ac-source-gtags)
  )
(add-hook 'c-mode-common-hook 'alexott/c-mode-cedet-hook)

(when (cedet-gnu-global-version-check t)
  (semanticdb-enable-gnu-global-databases 'c-mode t)
  (semanticdb-enable-gnu-global-databases 'c++-mode t))

(when (cedet-ectag-version-check t)
  (semantic-load-enable-primary-ectags-support))

(setq semantic-idle-scheduler-idle-time 7)

;; SRecode
(global-srecode-minor-mode 1)

;; EDE
(global-ede-mode t)
(ede-enable-generic-projects)

;; helper for boost setup...
defun c++-setup-boost (boost-root)
(when (file-accessible-directory-p boost-root)
  (let ((cfiles (cedet-files-list-recursively boost-root "\\(config\\|user\\)\\.hpp")))
    (dolist (file cfiles)
      (add-to-list 'semantic-lex-c-preprocessor-symbol-file file)))))


;; my functions for EDE
(defun alexott/ede-get-local-var (fname var)
  "fetch given variable var from :local-variables of project of file fname"
  (let* ((current-dir (file-name-directory fname))
         (prj (ede-current-project current-dir)))
    (when prj
      (let* ((ov (oref prj local-variables))
            (lst (assoc var ov)))
        (when lst
          (cdr lst))))))

;; setup compile package
(require 'compile)
(setq compilation-disable-input nil)
(setq compilation-scroll-output t)
(setq mode-compile-always-save-buffer-p t)

(defun alexott/compile ()
  "Saves all unsaved buffers, and runs 'compile'."
  (interactive)
  (save-some-buffers t)
  (let* ((fname (or (buffer-file-name (current-buffer)) default-directory))
	 (current-dir (file-name-directory fname))
         (prj (ede-current-project current-dir)))
    (if prj
	(project-compile-project prj)
	(compile compile-command))))
(global-set-key [f9] 'alexott/compile)

;;
(defun alexott/gen-std-compile-string ()
  "Generates compile string for compiling CMake project in debug mode"
  (let* ((current-dir (file-name-directory
                       (or (buffer-file-name (current-buffer)) default-directory)))
         (prj (ede-current-project current-dir))
         (root-dir (ede-project-root-directory prj)))
    (concat "cd " root-dir "; make -j2")))

;;
(defun alexott/gen-cmake-debug-compile-string ()
  "Generates compile string for compiling CMake project in debug mode"
  (let* ((current-dir (file-name-directory
                       (or (buffer-file-name (current-buffer)) default-directory)))
         (prj (ede-current-project current-dir))
         (root-dir (ede-project-root-directory prj))
         (subdir "")
         )
    (when (string-match root-dir current-dir)
      (setf subdir (substring current-dir (match-end 0))))
    (concat "cd " root-dir "Debug/" "; make -j3")))

;;; Projects

;; ;; cpp-tests project definition
;; (when (file-exists-p "~/projects/lang-exp/cpp/CMakeLists.txt")
;;   (setq cpp-tests-project
;; 	(ede-cpp-root-project "cpp-tests"
;; 			      :file "~/projects/lang-exp/cpp/CMakeLists.txt"
;; 			      :system-include-path '("/home/ott/exp/include"
;; 						     boost-base-directory)
;; 			      :compile-command "cd Debug && make -j2"
;; 			      )))

;; (when (file-exists-p "~/projects/squid-gsb/README")
;;   (setq squid-gsb-project
;; 	(ede-cpp-root-project "squid-gsb"
;; 			      :file "~/projects/squid-gsb/README"
;; 			      :system-include-path '("/home/ott/exp/include"
;; 						     boost-base-directory)
;; 			      :compile-command "cd Debug && make -j2"
;; 			      )))

;; Setup JAVA....
(require 'semantic/db-javap)
(custom-set-variables                       
 '(cedet-java-jdk-root (getenv "JAVA_HOME"))
 '(semanticdb-javap-classpath (concat (getenv "JAVA_HOME") "/jre/lib/rt.jar"))
)

(require 'flymake)
(add-hook 'java-mode-hook 'flymake-mode-on)

(defun my-java-flymake-init ()
  (list "javac" (list (flymake-init-create-temp-buffer-copy
		       'flymake-create-temp-with-folder-structure))))

(add-to-list 'flymake-allowed-file-name-masks '("\\.java$" my-java-flymake-init flymake-simple-cleanup))

(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(ac-config-default)

;; setup projcets 
(load "~/.emacs.d/cedet.projects")
