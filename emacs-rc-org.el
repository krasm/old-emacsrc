
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
(global-set-key "\C-cc" 'org-capture)

;;(setq org-directory "~/private/org")
;;(setq org-mobile-inbox-for-pull "~/private/org/inbox")
;; agenda files 
;;(setq org-agenda-files (list "~/private/org/simple.org"
;;			     "~/private/org/todo.org"))

;; todo lists
(setq org-todo-keywords
      '((sequence "TODO" "FEEDBACK" "VERIFY" | "DONE" "DELEGATED")))

(setq org-log-done 'note)
;; for lua integration
;; update agenda file after changes to org files
(defun th-org-mode-init ()
  (add-hook 'after-save-hook 'th-org-update-agenda-file t t))

(add-hook 'org-mode-hook 'th-org-mode-init)

;; that's the export function
(defun th-org-update-agenda-file (&optional force)
  (interactive)
  (save-excursion
    (save-window-excursion
      (let ((file "~/tmp/org-agenda.txt"))
        (org-agenda-list)
        (org-agenda-write file)))))

;; do it once at startup
(th-org-update-agenda-file t)

;; mobile org
(setq org-mobile-directory "~/Dropbox/MobileOrg")
(setq org-mobile-use-encryption t)
