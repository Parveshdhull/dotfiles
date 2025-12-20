;; Enable clojure linter
(require 'flycheck-clj-kondo)
(add-hook 'clojure-mode-hook   #'flycheck-mode)
(add-hook 'clojurescript-mode-hook  #'flycheck-mode)

;; Enable line numbers
(add-hook 'prog-mode-hook 'display-line-numbers-mode)

;; Enable hs-minor-mode (hide/show) in programming buffers
(add-hook 'prog-mode-hook 'hs-minor-mode)

;; Indent
(setq js-indent-level 2)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(add-hook 'nix-mode-hook 'my-nix-mode-hook)
