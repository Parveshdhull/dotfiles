;; Set major modes
(setq initial-major-mode 'org-mode)
(setq-default major-mode 'org-mode)

;; Support for shift selection in org mode
(setq org-support-shift-select 'always)

;; Ivy customization settings
(setq ivy-dynamic-exhibit-delay-ms 250)  ;; Delay for dynamic exhibit updates
(setq ivy-ignore-buffers '("\\` " "\\`\\*"))  ;; Ignore empty and special buffers

;;; backup/autosave
(defvar backup-dir (expand-file-name "~/.emacs.d/backup/"))
(defvar autosave-dir (expand-file-name "~/.emacs.d/autosave/"))
(setq backup-directory-alist (list (cons ".*" backup-dir)))
(setq auto-save-list-file-prefix autosave-dir)
(setq auto-save-file-name-transforms `((".*" ,autosave-dir t)))

;; Enable emojis and bullets and hi-lock-mode
(add-hook 'org-mode-hook (lambda () (emojify-mode 1)))
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
(add-hook 'org-mode-hook (lambda () (hi-lock-mode 1)))

;; Undo Window Changes C-c left or right
(winner-mode 1)

;; Don't show *Buffer list* when opening multiple files at the same time.
(setq inhibit-startup-buffer-menu t)

;; Show only one active window when opening multiple files at the same time.
(add-hook 'window-setup-hook 'delete-other-windows)

;; No more typing the whole yes or no. Just y or n will do.
(fset 'yes-or-no-p 'y-or-n-p)

;; Truncate long lines instead of wrapping them
(setq-default truncate-lines t)

;; No annoying bell sound
(setq visible-bell t)
(setq ring-bell-function 'ignore)

;; Force project search to open vertical
(add-to-list 'display-buffer-alist
             '("*xref*" . (display-buffer-below-selected)))

;; Enable the dired-find-alternate-file command
(put 'dired-find-alternate-file 'disabled nil)

;; Auto save buffers on focus out
(add-hook 'focus-out-hook #'(lambda () (save-some-buffers t)))

;; Send the files to your trash and not permanently delete them
(setq delete-by-moving-to-trash t)

;; Show small documentation in echo area
(global-eldoc-mode)
