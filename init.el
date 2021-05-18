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


(add-to-list 'custom-theme-load-path "~/.emacs.d/color/")
(load-theme 'tron t)

(use-package benchmark-init
  :straight t
  :config
  (add-hook 'after-init-hook 'benchmark-init/deactivate))

(use-package exec-path-from-shell
  :straight t
  :config
  (exec-path-from-shell-copy-envs '("PATH" "JAVA_HOME")))

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

(use-package undo-tree
  :straight t
  :config
  (global-undo-tree-mode))

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


(use-package meghanada
  :straight t
  :config
  (add-hook 'java-mode-hook
          (lambda ()
            ;; meghanada-mode on
            (meghanada-mode t)
            (flycheck-mode +1)
            (setq c-basic-offset 2)
            ;; use code format
            (add-hook 'before-save-hook 'meghanada-code-beautify-before-save))))


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

(use-package counsel
  :straight t)

(use-package swiper
  :straight t)

(use-package ivy
  :straight t
  :config
  (ivy-mode)
  (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t)
  ;; enable this if you want `swiper' to use it
  ;; (setq search-default-mode #'char-fold-to-regexp)
  (global-set-key "\C-s" 'swiper)
  (global-set-key (kbd "C-c C-r") 'ivy-resume)
  (global-set-key (kbd "<f6>") 'ivy-resume)
  (global-set-key (kbd "M-x") 'counsel-M-x)
  (global-set-key (kbd "C-x C-f") 'counsel-find-file)
  (global-set-key (kbd "<f1> f") 'counsel-describe-function)
  (global-set-key (kbd "<f1> v") 'counsel-describe-variable)
  (global-set-key (kbd "<f1> o") 'counsel-describe-symbol)
  (global-set-key (kbd "<f1> l") 'counsel-find-library)
  (global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
  (global-set-key (kbd "<f2> u") 'counsel-unicode-char)
  (global-set-key (kbd "C-c g") 'counsel-git)
  (global-set-key (kbd "C-c j") 'counsel-git-grep)
  (global-set-key (kbd "C-c k") 'counsel-ag)
  (global-set-key (kbd "C-x l") 'counsel-locate)
  (global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
  (define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history))

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

(require 'lsp)
(add-hook 'c++-mode-hook 'c-mode-hook 'lsp)

(setq tramp-default-method "ssh")

(use-package hackernews
  :straight t
  :config
  (autoload 'hackernews "hackernews" nil t))

(setq lsp-prefer-flymake nil)
