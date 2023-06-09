(setq inhibit-startup-message t)  ; Disable the welcome screen
(setq visible-bell nil)           ; Disable the visual bell

(menu-bar-mode 1)     ; Keep the menu bar
(tool-bar-mode -1)    ; Disable the toolbar
(scroll-bar-mode -1)  ; Disable the visiblescrollbar

(column-number-mode)
(global-display-line-numbers-mode t)  ; Enable the line numbers

;; Instruct Emacs to write auto-save files to a different dir
(setq auto-save-file-name-transforms
          `((".*" ,(concat user-emacs-directory "auto-save/") t))) 

;; Disable line numbers for some modes
(dolist (mode '(org-mode-hook
                term-mode-hook
		shell-mode-hook
                eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

;; Indent org documents by heading
(setq org-startup-indented t)
(setq org-indent-indentation-per-level 2)

;; Fonts
(set-face-attribute 'default nil :font "Fira Code" :height 140)


;; Make ESC quit prompts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)


;; Initialize package sources
(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; Initialize use-package on non-Linux platforms
(unless (package-installed-p 'use-package)
   (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t);; Initialize use-package on non-Linux platforms

;; Install command-log-mode
(use-package command-log-mode)

;; Use Ivy
(use-package ivy
  :diminish
  :bind (("C-s" . swiper)
         :map ivy-minibuffer-map
         ("TAB" . ivy-alt-done)	
         ("C-l" . ivy-alt-done)
         ("C-j" . ivy-next-line)
         ("C-k" . ivy-previous-line)
         :map ivy-switch-buffer-map
         ("C-k" . ivy-previous-line)
         ("C-l" . ivy-done)
         ("C-d" . ivy-switch-buffer-kill)
         :map ivy-reverse-i-search-map
         ("C-k" . ivy-previous-line)
         ("C-d" . ivy-reverse-i-search-kill))
  :config
  (ivy-mode 1))

;; Use counsel
(use-package counsel
  :bind (("M-x" . counsel-M-x)
	 ("C-x b" . counsel-ibuffer)
	 ("C-x C-f" . counsel-find-file)
	 :map minibuffer-local-map
	 ("C-r" . 'counsel-minibuffer-history))
  :config
  (setq ivy-initial-inputs-alist nil)) ;; Don't start searches with ^

;; use doom-modeline
(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))

;; use doom-themes
(use-package doom-themes)

(use-package all-the-icons)

;; Set theme
(load-theme 'doom-dracula t)

;; use rainbow-delimiters
(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

;; use which-key
(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 1))

;; use ivy-rich
(use-package ivy-rich
  :init
  (ivy-rich-mode 1))

;; use general
(use-package general)

(general-define-key
 "C-M-j" 'counsel-switch-buffer)

;; do we want to use evil?

;; use-projectile
(use-package projectile
  :diminish projectile-mode
  :config (projectile-mode)
  :custom ((projectil-completion-system 'ivy))
  :bind-keymap
  ("C-c p" . projectile-command-map)
  :init
  (when (file-directory-p "~/Projects")
    (setq projectile-project-search-path '("~/Projects")))
  (setq projectile-switch-project-action #'projectile-dired))

;; (use-package counsel-projectile
;;   :config (counsel-projectile-mode))

;; use magit
(use-package magit)

;; use Org-Roam
(use-package org-roam
  :ensure t
  :custom
  (org-roam-directory "~/my-org-roam/org-roam")
  :bind (("C-c n l" . org-roam-buffer-toggle)
	 ("C-c n f" . org-roam-node-find)
	 ("C-c n i" . org-roam-node-insert))
  :config
  (org-roam-setup))

;; rust-mode
;; (require 'rust-mode)


;; LateX Rules
(setq org-latex-toc-command "\\tableofcontents \\clearpage")

;; --- End --- 

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files nil)
 '(package-selected-packages
   '(magit rust-mode projectile general all-the-icons doom-themes ivy-rich which-key rainbow-delimiters doom-modeline counsel ivy command-log-mode use-package spacemacs-theme simple-httpd org-roam nano-theme f)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

