(eval-after-load 'info
  '(progn (info-initialize)
          (add-to-list 'Info-directory-list (concat conf-dir "/packages/magit"))))
(require 'magit)
