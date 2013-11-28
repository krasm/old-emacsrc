;; stuff which did not fit any other place

;; display column and time in status bar
(column-number-mode t)
(setq display-time-day-and-date t
                display-time-24hr-format t)
(display-time)

(setq ispell-program-name "aspell")
(require 'ispell)

(require 'recentf)
(recentf-mode 1)

(setq inhibit-startup-screen t)

;; global key bindings
(global-set-key "\C-xg" 'goto-line)
(global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<down>") 'shrink-window)
(global-set-key (kbd "S-C-<up>") 'enlarge-window)
(global-set-key "\M-?" 'help-command)
(global-set-key "\C-h" 'delete-backward-char)
(global-set-key "\M-\C-h" 'delete-horizontal-space)

;; speedbar
(require 'sr-speedbar)

;; stolen from emacs wiki
(defun delete-horizontal-space-forward () ; adapted from `delete-horizontal-space'
  "*Delete all spaces and tabs after point."
  (interactive "*")
  (delete-region (point) (progn (skip-chars-forward " \t") (point))))

(global-set-key "\C-xd" 'delete-horizontal-space-forward)

;; transpose windows
(defun rotate-windows ()
  "Rotate your windows"
  (interactive)
  (cond
   ((not (> (count-windows) 1))
    (message "You can't rotate a single window!"))
   (t
    (let ((i 1)
          (num-windows (count-windows)))
      (while  (< i num-windows)
        (let* ((w1 (elt (window-list) i))
               (w2 (elt (window-list) (+ (% i num-windows) 1)))
               (b1 (window-buffer w1))
               (b2 (window-buffer w2))
               (s1 (window-start w1))
               (s2 (window-start w2)))
          (set-window-buffer w1 b2)
          (set-window-buffer w2 b1)
          (set-window-start w1 s2)
          (set-window-start w2 s1)
          (setq i (1+ i))))))))
(global-set-key "\C-xt" 'rotate-windows)

(defun toggle-window-split ()
  (interactive)
  (if (= (count-windows) 2)
      (let* ((this-win-buffer (window-buffer))
	          (next-win-buffer (window-buffer (next-window)))
		       (this-win-edges (window-edges (selected-window)))
		            (next-win-edges (window-edges (next-window)))
			         (this-win-2nd (not (and (<= (car this-win-edges)
							      (car next-win-edges))
							      (<= (cadr this-win-edges)
								   (cadr next-win-edges)))))
				      (splitter
				             (if (= (car this-win-edges)
						         (car (window-edges (next-window))))
						   'split-window-horizontally
					       'split-window-vertically)))
	(delete-other-windows)
	(let ((first-win (selected-window)))
	    (funcall splitter)
	      (if this-win-2nd (other-window 1))
	        (set-window-buffer (selected-window) this-win-buffer)
		  (set-window-buffer (next-window) next-win-buffer)
		    (select-window first-win)
		      (if this-win-2nd (other-window 1))))))

(define-key ctl-x-4-map "t" 'toggle-window-split)

(defun toggle-fullscreen ()
  "Toggle full screen on X11"
  (interactive)
  (when (eq window-system 'x)
    (set-frame-parameter
     nil 'fullscreen
     (when (not (frame-parameter nil 'fullscreen)) 'fullboth))))

(global-set-key [f11] 'toggle-fullscreen)


;; rename buffer and file opened in emacs
;; source: http://steve.yegge.googlepages.com/my-dot-emacs-file
(defun rename-file-and-buffer (new-name)
  "Renames both current buffer and file it's visiting to NEW-NAME."
  (interactive "sNew name: ")
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (if (not filename)
        (message "Buffer '%s' is not visiting a file!" name)
      (if (get-buffer new-name)
          (message "A buffer named '%s' already exists!" new-name)
        (progn
          (rename-file name new-name 1)
          (rename-buffer new-name)
          (set-visited-file-name new-name)
          (set-buffer-modified-p nil))))))

(global-set-key "\M-\C-?" 'delete-horizontal-space)
(global-set-key "\C-xn" 'other-window)

(defun other-window-backward (&optional n)
  "Select Nth previous window."
  (interactive "p")
  (other-window (- (or n 1)))
)
(global-set-key "\C-xp" 'other-window-backward)
