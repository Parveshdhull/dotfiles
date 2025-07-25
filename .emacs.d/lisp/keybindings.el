;; Short cut keys for files
(global-set-key (kbd "C-c t")
		(lambda () (interactive) (find-file "/mnt/data/nebula/sync/sync-box/notes/pinned/todo")))
(global-set-key (kbd "C-c r")
		(lambda () (interactive) (find-file "/mnt/data/nebula/sync/sync-all/notes/pinned/reminders")))

;; Misc
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; Bind Shift+Tab to toggle hiding of code blocks
(global-set-key (kbd "<backtab>") 'hs-toggle-hiding)

;; Function Keys function
(global-set-key (kbd "<f5>") 'flyspell-mode)
(global-set-key (kbd "<f6>") 'visual-line-mode)

;; Custom functions
(global-set-key [f4] 'show-file-name)
(global-set-key [remap next-buffer] 'my-next-buffer)
(global-set-key [remap previous-buffer] 'my-previous-buffer)
(global-set-key [(ctrl shift up)]  'move-line-up)
(global-set-key [(ctrl shift down)]  'move-line-down)
(global-set-key [(ctrl shift i)]  'move-line-up)
(global-set-key [(ctrl shift e)]  'move-line-down)
(global-set-key [(ctrl shift o)]  'my-next-buffer)
(global-set-key [(ctrl shift n)]  'my-previous-buffer)
(global-set-key (kbd "C-d") 'duplicate-line)
(define-key global-map (kbd "M-l") 'copy-current-line-position-to-clipboard)

;; Unset keys
(global-unset-key (kbd "C-z"))
