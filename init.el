(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))
(straight-use-package 'el-patch)
(straight-use-package 'use-package)
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)
(global-display-line-numbers-mode t)
(add-hook 'text-mode-hook
           (lambda ()
             (variable-pitch-mode 1)))
(add-hook 'text-mode-hook
           (lambda ()
             (variable-pitch-mode 1)))
(set-face-attribute 'default nil :family "DejaVu Sans Mono" :height 110)
(set-face-attribute 'fixed-pitch nil :family "DejaVu Sans Mono")
(set-face-attribute 'variable-pitch nil :family "IBM Plex Serif")

;; (use-package poet-theme
;;   :straight t
;;   :config
;;   (load-theme 'poet-dark T))
(use-package tron-legacy-theme
  :straight t
  :config
  (load-theme 'tron-legacy t))

(use-package exec-path-from-shell
  :straight t
  :config
  (when (daemonp)
    (exec-path-from-shell-initialize)))

(use-package org-bullets
  :straight t
  :config
  (add-hook 'org-mode-hook 'org-bullets-mode)
  (add-hook 'org-mode-hook 'org-indent-mode))

(org-babel-do-load-languages
 'org-babel-load-languages
 '((C . t)
   (emacs-lisp . t)
   (python .t )))

(use-package projectile
  :straight t
  :bind-keymap
  ("C-c p" . projectile-command-map))

(use-package company
  :straight t
  :config
  (global-company-mode))


(org-babel-do-load-languages
 'org-babel-load-languages
 '((C . t)
   (emacs-lisp . t)
   (python .t )))

(use-package projectile
  :straight t
  :bind-keymap
  ("C-c p" . projectile-command-map))

(use-package company
  :straight t
  :config
  (global-company-mode))


(org-babel-do-load-languages
 'org-babel-load-languages
 '((C . t)
   (emacs-lisp . t)
   (python .t )))

(use-package projectile
  :straight t
  :bind-keymap
  ("C-c p" . projectile-command-map))

(use-package company
  :straight t
  :config
  (global-company-mode))

(use-package magit
  :straight t)

(use-package vterm
    :straight t)

(use-package lsp-mode
  :straight t)

(use-package lsp-dart
  :straight t
  :hook (dart-mode . lsp))
(use-package hover
  :straight t)


(use-package go-mode
  :straight t)

(defun lsp-go-install-save-hooks ()
  (add-hook 'before-save-hook #'lsp-format-buffer t t)
  (add-hook 'before-save-hook #'lsp-organize-imports t t))
(add-hook 'go-mode-hook #'lsp-go-install-save-hooks)
(lsp-register-custom-settings
 '(("gopls.completeUnimported" t t)
   ("gopls.staticcheck" t t)))

;; Start LSP Mode and YASnippet mode
(add-hook 'go-mode-hook #'lsp-deferred)
(add-hook 'go-mode-hook #'yas-minor-mode)




;; Optional packages
(use-package yasnippet
  :ensure t
  :config (yas-global-mode)) ;; snipets
(use-package company :ensure t) ;; Auto-complete

(org-babel-do-load-languages
 'org-babel-load-languages
 '((C . t)
   (emacs-lisp . t)
   (python .t )))

(use-package projectile
  :straight t
  :bind-keymap
  ("C-c p" . projectile-command-map))

(use-package company
  :straight t
  :config
  (global-company-mode))

(use-package helm
  :straight t
  :config
  (require 'helm-config)
  (global-set-key (kbd "M-x") 'helm-M-x)
  (global-set-key (kbd "C-x C-f") 'helm-find-files)
  (global-set-key (kbd "C-x b") 'helm-mini)
  (global-set-key (kbd "C-c y") 'helm-show-kill-ring)
  (global-set-key (kbd "C-x C-r") 'helm-recentf)
  (define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)
  (define-key helm-map (kbd "C-i") 'helm-execute-persistent-action)
  (define-key helm-map (kbd "C-z") 'helm-select-action)
  (when (executable-find "curl")
    (setq helm-google-suggest-use-curl-p t))
  (setq helm-split-window-in-side-p t
	helm-move-to-line-cycle-in-source t
	helm-ff-search-library-in-sexp t
	helm-scroll-amount 8
	helm-ff-file-name-history-use-recentf t
	helm-echo-input-in-header-line t)
  (setq helm-autoresize-max-height 0)
  (setq helm-autoresize-min-height 20)
  (setq helm-M-x-fuzzy-match t)
  (setq helm-buffers-fuzzy-matching t
	helm-recentf-fuzzy-match t)
  (helm-autoresize-mode 1))

;; emacs remove backup files
(setq backup-directory-alist '(("." . "~/.emacs.d/backup"))
  backup-by-copying t    ; Don't delink hardlinks
  version-control t      ; Use version numbers on backups
  delete-old-versions t  ; Automatically delete excess backups
  kept-new-versions 20   ; how many of the newest versions to keep
  kept-old-versions 5    ; and how many of the old
  )

;; emacs remove autosave
(setq backup-directory-alist
    `(("." . ,(concat user-emacs-directory "backups"))))

;; (use-package eglot
;;   :straight t
;;   :config
;;   (add-to-list 'eglot-server-programs '((c++-mode c-mode) "clangd"))
;;   (add-hook 'c-mode-hook 'eglot-ensure)
;;   (add-hook 'c++-mode-heook 'eglot-ensure))

(require 'lsp)
(add-hook 'c++-mode-hook 'c-mode-hook 'lsp)

(setq tramp-default-method "ssh")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("28a104f642d09d3e5c62ce3464ea2c143b9130167282ea97ddcc3607b381823f" default)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
