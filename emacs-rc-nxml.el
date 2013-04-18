(require 'nxml-mode)

;; based on alex ott nxml mode

(fset 'xml-mode 'nxml-mode)

(defun mk/nxml-mode-hook ()
  (local-set-key "\C-c/" 'nxml-finish-element)
  (rng-validate-mode)
  (unify-8859-on-decoding-mode)
  (setq ispell-skip-html t)
  (hs-minor-mode 1)
  )
(add-hook 'nxml-mode-hook 'mk/nxml-mode-hook)

(add-to-list
 'auto-mode-alist
 (cons (concat "\\."
               (regexp-opt
                '("xml" "xsd" "sch" "rng" "xslt" "svg" "rss" "rdf") t) "\\'")
       'nxml-mode))
(push '("<\\?xml" . nxml-mode) magic-mode-alist)

(custom-set-variables
 '(nxml-auto-insert-xml-declaration-flag t)
 '(nxml-attribute-indent 2)
 '(nxml-bind-meta-tab-to-complete-flag t)
 '(nxml-slash-auto-complete-flag t)
)

(add-to-list 'hs-special-modes-alist
             '(nxml-mode
               "\\|<[^/>]&>\\|<[^/][^>]*[^/]>"
               ""
               nil))

