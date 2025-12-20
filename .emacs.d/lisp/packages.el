;; Package list
(setq package-selected-packages
      '(;; Programming Modes
        nix-mode          ;; Major mode for editing Nix expressions
        javap-mode        ;; Major mode for editing Java class files
        gradle-mode       ;; Major mode for editing Gradle build files
        json-mode         ;; Major mode for editing JSON files
        go-mode           ;; Major mode for editing Go programming language files
        clojure-mode      ;; Major mode for editing Clojure code
        ;; Development Tools
        flycheck-clj-kondo ;; Flycheck checker for Clojure using clj-kondo
        project           ;; Built-in package for project management
        use-package       ;; Macro for simplifying package management and configuration
        counsel           ;; Ivy-enhanced versions of common Emacs commands
        ;; Org Mode Enhancements
        org-bullets       ;; Enhances Org mode headings with Unicode bullets
        emojify           ;; Allows insertion and display of emojis in Emacs
        ;; Misc
        transpose-frame
        ))

;; Initialize package sources
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))

;; activate all the packages (in particular autoloads)
(package-initialize)

;; fetch the list of packages available
(unless package-archive-contents
  (package-refresh-contents))

; install the missing packages
(dolist (package package-selected-packages)
  (unless (package-installed-p package)
    (package-install package)))

;; Enable ivy-mode
(use-package ivy
  :ensure t
  :config
  (ivy-mode 1))

;; Text completion framework for various languages
(use-package company
  :ensure t
  :config
  (global-company-mode 1))

;; Set Default theme
(use-package zenburn-theme
  :ensure t
  :config
  (load-theme 'zenburn t))
