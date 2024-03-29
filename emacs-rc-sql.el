;; SQL and oracle configuration
(require 'plsql)
(setq auto-mode-alist
      (append '(("\\.(point)ls\\'" . plsql-mode) ("\\.pkg\\'" . plsql-mode)
 		("\\.pks\\'" . plsql-mode) ("\\.pkb\\'" . plsql-mode)
 		("\\.sql\\'" . plsql-mode) ("\\.PLS\\'" . plsql-mode) 
 		("\\.PKG\\'" . plsql-mode) ("\\.PKS\\'" . plsql-mode)
 		("\\.PKB\\'" . plsql-mode) ("\\.SQL\\'" . plsql-mode)
 		("\\.prc\\'" . plsql-mode) ("\\.fnc\\'" . plsql-mode)
 		("\\.trg\\'" . plsql-mode) ("\\.vw\\'" . plsql-mode)
 		("\\.PRC\\'" . plsql-mode) ("\\.FNC\\'" . plsql-mode)
 		("\\.TRG\\'" . plsql-mode) ("\\.VW\\'" . plsql-mode))
 	      auto-mode-alist ))

(require 'sqlplus)
(add-to-list 'auto-mode-alist '("\\.sqp\\'" . sqlplus-mode))
