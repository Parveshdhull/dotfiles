(scroll-bar-mode -1)     ;; Disable visual scrollbar
(tool-bar-mode -1)       ;; Disable the toolbar
(tooltip-mode -1)        ;; Disable tooltips
(menu-bar-mode -1)       ;; Disable the menu bar
(set-fringe-mode 10)     ;; Give some breathing room

;; Set font
(defun set-iosevka-comfy-font ()
  (set-face-attribute 'default nil :font "Iosevka Comfy" :height 220))
(add-hook 'server-after-make-frame-hook #'set-iosevka-comfy-font)

;; Set ANSI color faces and names
(setq ansi-color-faces-vector
      [default default default italic underline success warning error])
(setq ansi-color-names-vector
      ["black" "red3" "ForestGreen" "yellow3" "blue" "magenta3" "DeepSkyBlue" "gray50"])

;; Set emoji set
(setq emojify-emoji-set "twemoji-v2")
