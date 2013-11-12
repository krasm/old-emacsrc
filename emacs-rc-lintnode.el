(require 'flymake-jslint)
;; Make sure we can find the lintnode executable
;; JSLint can be... opinionated
(setq lintnode-jslint-excludes (list 'nomen 'undef 'plusplus 'onevar 'white))
;; Start the server when we first open a js file and start checking
(add-hook 'js2-mode-hook
          (lambda ()
            (lintnode-hook))
)
