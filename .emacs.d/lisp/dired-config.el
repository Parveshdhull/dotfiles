;; https://www.reddit.com/r/emacs/comments/cgbpvl/opening_media_files_straight_from_gnu_emacs_dired/
(defun rcd/dired-view ()
  "View files, either as HTML or media"
  (interactive)
  (let* ((files (dired-get-marked-files))
         (how-many (length files))
         (extensions (mapcar 'file-name-extension files))
         (extensions (mapcar 'downcase extensions)))
    (if (> how-many 1)
            (xdg-open-files files)
          (xdg-open (car files) t))))

(defun xdg-open (file &optional async)
  "Open FILE with xdg-open. If ASYNC is non-nil, open asynchronously without showing output buffer."
  (let ((command "xdg-open"))
    (if async
        (start-process "xdg-open" nil command file)
      (shell-command (format "%s '%s'" command file)))))

(defun xdg-open-files (files)
  "Open list of FILES with xdg-open, waiting for each."
  (dolist (file files)
    (xdg-open file)))

;; Ensure dired is loaded before setting keybinding
(with-eval-after-load 'dired
  (define-key dired-mode-map (kbd "V") 'rcd/dired-view))

;; Automatically kill the previous dired buffer when opening a new one to avoid clutter
(setq dired-kill-when-opening-new-dired-buffer t)
