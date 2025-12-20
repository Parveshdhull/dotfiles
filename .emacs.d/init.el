(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;; Set the load path to include custom lisp directory
(add-to-list 'load-path "~/.emacs.d/lisp/")

;; Load individual configuration files
(load "packages.el")
(load "config.el")
(load "cleanup.el")
(load "custom-functions.el")
(load "dev.el")
(load "dired-config.el")
(load "keybindings.el")
(load "ui.el")

;; Custom packages
(load "sublima.el")
