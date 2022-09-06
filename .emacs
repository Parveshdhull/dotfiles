(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["black" "red3" "ForestGreen" "yellow3" "blue" "magenta3" "DeepSkyBlue" "gray50"])
 '(custom-safe-themes
   '("e6df46d5085fde0ad56a46ef69ebb388193080cc9819e2d6024c9c6e27388ba9" default))
 '(emojify-emoji-set "twemoji-v2")
 '(font-use-system-font nil)
 '(initial-major-mode 'org-mode)
 '(major-mode 'org-mode)
 '(org-agenda-files
   '("/home/parvesh_monu/Desktop/ArchFiles/Extras/Text Files/0 - Pinned/todo"))
 '(org-support-shift-select 'always)
 '(package-selected-packages
   '(exwm list-packages-ext javap-mode gradle-mode groovy-mode cider-hydra helm-cider json-mode go-mode slime company flycheck-clj-kondo paredit cider clojure-mode hydra auto-complete zenburn-theme org-bullets emojify project use-package counsel))
 '(show-paren-mode t)
 '(tooltip-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "DejaVu Sans Mono" :foundry "PfEd" :slant normal :weight normal :height 152 :width normal)))))


;; Set Default Theme
(load-theme 'zenburn t)


;; Packages Archives
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)


;; maximize on start
(add-to-list 'default-frame-alist '(fullscreen . maximized))


;; org
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)
(setq org-refile-targets '((org-agenda-files . (:maxlevel . 2))))


;; Short cut keys for files
(global-set-key (kbd "C-c t") 
		(lambda () (interactive) (find-file "/home/parvesh_monu/Desktop/ArchFiles/Extras/Text Files/0 - Pinned/todo")))
(global-set-key (kbd "C-c e") 
		(lambda () (interactive) (find-file "/home/parvesh_monu/Desktop/ArchFiles/Extras/Text Files/0 - Pinned/extra")))
(global-set-key (kbd "C-c l") 
		(lambda () (interactive) (find-file "/home/parvesh_monu/Desktop/ArchFiles/Extras/Text Files/0 - Pinned/linuxExtra")))
(global-set-key (kbd "C-c q") 
		(lambda () (interactive) (find-file "/home/parvesh_monu/Desktop/ArchFiles/Extras/Text Files/12 - Status/current")))
(global-set-key (kbd "C-c r") 
		(lambda () (interactive) (find-file "/home/parvesh_monu/Desktop/ArchFiles/Extras/Text Files/0 - Pinned/reminders")))
(global-set-key (kbd "C-c j") 
		(lambda () (interactive) (find-file "/home/parvesh_monu/Desktop/ArchFiles/Extras/Creds/Backup Codes/Others/TempFiles/EmptyFile.org.gpg")))


;; Org capture
(global-set-key (kbd "C-c c") 'org-capture)
(setq org-default-notes-file "/home/parvesh_monu/Desktop/ArchFiles/Extras/Text Files/0 - Pinned/todo")


;; ivy
(ivy-mode 1)

(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)


(setq ivy-dynamic-exhibit-delay-ms 250)
(setq ivy-ignore-buffers '("\\` " "\\`\\*"))


;;; backup/autosave
(defvar backup-dir (expand-file-name "~/.emacs.d/backup/"))
(defvar autosave-dir (expand-file-name "~/.emacs.d/autosave/"))
(setq backup-directory-alist (list (cons ".*" backup-dir)))
(setq auto-save-list-file-prefix autosave-dir)
(setq auto-save-file-name-transforms `((".*" ,autosave-dir t)))


;; Enable emojis and bullets and hi-lock-mode
(add-hook 'after-init-hook #'global-emojify-mode)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
(add-hook 'org-mode-hook (lambda () (hi-lock-mode 1)))


(defun close-all-buffers ()
(interactive)
  (mapc 'kill-buffer (buffer-list)))

;; Function Keys function
(global-set-key (kbd "<f1>") 'tab-bar-new-tab)
(global-set-key (kbd "<f2>") 'tab-bar-switch-to-prev-tab)
(global-set-key (kbd "<f3>") 'tab-bar-switch-to-next-tab)
(global-set-key (kbd "<f4>") 'tab-bar-close-tab)
(global-set-key (kbd "<f5>") 'flyspell-mode)
(global-set-key (kbd "<f6>") 'visual-line-mode)
(global-set-key (kbd "<f7>") 'sublima-scratch)
(global-set-key (kbd "<f8>") 'previous-buffer)
(global-set-key (kbd "<f9>") 'next-buffer)

(global-set-key (kbd "C-x C-b") 'ibuffer)


;; Smooth jump between buffers
(defcustom my-skippable-buffers '("*Messages*" "*Ibuffer*" "*Help*" "*Shell Command Output*" "*GNU Emacs*" "*Buffer List*")
  "Buffer names ignored by `my-next-buffer' and `my-previous-buffer'."
  :type '(repeat string))

(defun my-change-buffer (change-buffer)
  "Call CHANGE-BUFFER until current buffer is not in `my-skippable-buffers'."
  (let ((initial (current-buffer)))
    (funcall change-buffer)
    (let ((first-change (current-buffer)))
      (catch 'loop
        (while (member (buffer-name) my-skippable-buffers)
          (funcall change-buffer)
          (when (eq (current-buffer) first-change)
            (switch-to-buffer initial)
            (throw 'loop t)))))))

(defun my-next-buffer ()
  "Variant of `next-buffer' that skips `my-skippable-buffers'."
  (interactive)
  (my-change-buffer 'next-buffer))

(defun my-previous-buffer ()
  "Variant of `previous-buffer' that skips `my-skippable-buffers'."
  (interactive)
  (my-change-buffer 'previous-buffer))

(global-set-key [remap next-buffer] 'my-next-buffer)
(global-set-key [remap previous-buffer] 'my-previous-buffer)


;; Auto complete mode
(ac-config-default)
(add-to-list 'ac-modes 'org-mode)
(ac-set-trigger-key "TAB")


;; Org capture templates
(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "/home/parvesh_monu/Desktop/ArchFiles/Extras/Text Files/0 - Pinned/todo" "Tasks")
         "* TODO %?\n  %i" :prepend t)))


(use-package org-protocol
  :demand
  :config
  (add-to-list 'org-capture-templates
               '("p" "T-Links" entry (file+headline "/home/parvesh_monu/Desktop/ArchFiles/Extras/Text Files/0 - Pinned/extra" "T-Links")
                 "** [[%:link][%:description]]\n\t%i" :immediate-finish t :prepend t))
  (add-to-list 'org-capture-templates
               '("L" "Protocol Link" entry (file+headline "/home/parvesh_monu/Desktop/ArchFiles/Extras/Text Files/0 - Pinned/extra" "Links")
                 "** [[%:link][%:description]]" :immediate-finish t :prepend t))
  (add-to-list 'org-capture-templates
               '("x" "Clips" entry (file+headline "/home/parvesh_monu/Desktop/ArchFiles/Extras/Text Files/0 - Pinned/extra" "Clips")
                 "%[~/.emacs.d/.org-popup]" :immediate-finish t :prepend t))
  (add-to-list 'org-capture-templates
               '("z" "T-Clips" entry (file+headline "/home/parvesh_monu/Desktop/ArchFiles/Extras/Text Files/0 - Pinned/extra" "T-Clips")
         "%[~/.emacs.d/.org-popup]" :immediate-finish t :prepend t))
  (add-to-list 'org-capture-templates
               '("l" "Linux" entry (file+headline "/home/parvesh_monu/Desktop/ArchFiles/Extras/Text Files/0 - Pinned/linuxExtra" "Linux")
                 "%[~/.emacs.d/.org-popup]" :immediate-finish t :prepend t))
  (add-to-list 'org-capture-templates
               '("k" "T-Linux" entry (file+headline "/home/parvesh_monu/Desktop/ArchFiles/Extras/Text Files/0 - Pinned/linuxExtra" "T-Linux")
         "%[~/.emacs.d/.org-popup]" :immediate-finish t :prepend t))
  (add-to-list 'org-capture-templates
               '("h" "hExtra" entry (file+headline "/home/parvesh_monu/Desktop/ArchFiles/Extras/Text Files/0 - Pinned/hExtra" "hExtra")
                 "%[~/.emacs.d/.org-popup]" :immediate-finish t :prepend t))
  (add-to-list 'org-capture-templates
               '("j" "T-hExtra" entry (file+headline "/home/parvesh_monu/Desktop/ArchFiles/Extras/Text Files/0 - Pinned/hExtra" "T-hExtra")
         "%[~/.emacs.d/.org-popup]" :immediate-finish t :prepend t)))


;; Undo Window Changes C-c left or right
(winner-mode 1)


;; Cool codes to avoid unwanted buffers
;; Makes *scratch* empty.
(setq initial-scratch-message "")


;; Removes *scratch* from buffer after the mode has been set.
(defun remove-scratch-buffer ()
  (if (get-buffer "*scratch*")
      (kill-buffer "*scratch*")))
(add-hook 'after-change-major-mode-hook 'remove-scratch-buffer)


;; Removes *messages* from the buffer.
(setq-default message-log-max nil)
(kill-buffer "*Messages*")


;; Removes *Completions* from buffer after you've opened a file.
(add-hook 'minibuffer-exit-hook
      '(lambda ()
         (let ((buffer "*Completions*"))
           (and (get-buffer buffer)
                (kill-buffer buffer)))))


;; Don't show *Buffer list* when opening multiple files at the same time.
(setq inhibit-startup-buffer-menu t)

;; Show only one active window when opening multiple files at the same time.
(add-hook 'window-setup-hook 'delete-other-windows)

;; No more typing the whole yes or no. Just y or n will do.
(fset 'yes-or-no-p 'y-or-n-p)

(load "~/.emacs.d/custom/ediff-trees.el")


;; Enable clojure linter
(require 'flycheck-clj-kondo)
(add-hook 'clojure-mode-hook   #'flycheck-mode)
(add-hook 'clojurescript-mode-hook  #'flycheck-mode)


(setq-default truncate-lines t)

(global-company-mode)
(setq inferior-lisp-program "sbcl")

(add-hook 'prog-mode-hook 'display-line-numbers-mode)

;; Allow moving line
(defun move-line-up ()
  "Move up the current line."
  (interactive)
  (transpose-lines 1)
  (forward-line -2)
  (indent-according-to-mode))

(defun move-line-down ()
  "Move down the current line."
  (interactive)
  (forward-line 1)
  (transpose-lines 1)
  (forward-line -1)
  (indent-according-to-mode))

(global-set-key [(meta shift up)]  'move-line-up)
(global-set-key [(meta shift down)]  'move-line-down)


;; Allow line duplication
(defun duplicate-line()
  (interactive)
  (move-beginning-of-line 1)
  (kill-line)
  (yank)
  (open-line 1)
  (next-line 1)
  (yank))

(global-set-key (kbd "C-d") 'duplicate-line)


;; See file full path
(defun show-file-name ()
  "Show the full path file name in the minibuffer."
  (interactive)
  (message (buffer-file-name)))

(global-set-key [f10] 'show-file-name)


;; Enable Highlight for lengthy lines
(require 'whitespace)
(setq whitespace-line-column 80) ;; limit line length
(setq whitespace-style '(face lines-tail))

(add-hook 'prog-mode-hook 'whitespace-mode)


;; Copy file name and position
(defun copy-current-line-position-to-clipboard ()
  "Copy current line in file to clipboard as '</path/to/file>:<line-number>'."
  (interactive)
  (let ((path-with-line-number
         (concat (buffer-file-name) ":" (number-to-string (line-number-at-pos)))))
    (kill-new path-with-line-number)
    (message (concat path-with-line-number " copied to clipboard"))))


(define-key global-map (kbd "M-l") 'copy-current-line-position-to-clipboard)
(global-unset-key (kbd "C-z"))

(put 'dired-find-alternate-file 'disabled nil)

;; Disable Bars
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)

;; Sublima
(load "~/.emacs.d/custom/sublima.el")
