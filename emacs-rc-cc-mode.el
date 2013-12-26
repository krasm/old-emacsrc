(require 'cc-mode)

(defconst my-cc-style
  '("stroustrup"
    (c-offsets-alist . ((innamespace . 0)))))

(c-add-style "my-cc-style" my-cc-style)

(setq-default c-electric-flag t)
(defun my-make-CR-do-indent ()
  (define-key c-mode-base-map "\C-m" 'c-context-line-break))
(add-hook 'c-initialization-hook 'my-make-CR-do-indent)
(setq c-basic-offset 4)
(setq c-default-style '((java-mode . "java")
			(awk-mode . "awk")
			(other . "my-cc-style")))
