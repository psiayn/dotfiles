 ;;; melpa package repo
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(require 'use-package)

;; (use-package tron-legacy-theme
;;  :config
;;  (setq tron-legacy-theme-vivid-cursor t)
;;  (load-theme 'tron-legacy t))

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

;; pdf mode
(add-hook 'prog-mode-hook 'linum-mode)

;; challenger-deep
(use-package challenger-deep-theme
  :config
  (load-theme 'challenger-deep t))

(require 'evil)
(evil-mode 1)
(require 'evil-commentary)
(evil-commentary-mode)

(require 'telephone-line)
(setq telephone-line-lhs
      '((evil   . (telephone-line-evil-tag-segment))
        (accent . (telephone-line-vc-segment
                   telephone-line-erc-modified-channels-segment
                   telephone-line-process-segment))
        (nil    . (telephone-line-minor-mode-segment
                   telephone-line-buffer-segment))))
(setq telephone-line-rhs
      '((nil    . (telephone-line-misc-info-segment))
        (accent . (telephone-line-major-mode-segment))
        (evil   . (telephone-line-airline-position-segment))))
(telephone-line-mode 1)

(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)
(global-linum-mode 1)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#1c1e26" "#e95678" "#09f7a0" "#fab795" "#21bfc2" "#6c6f93" "#59e3e3" "#c7c9cb"])
 '(custom-safe-themes
   '("1623aa627fecd5877246f48199b8e2856647c99c6acdab506173f9bb8b0a41ac" "5036346b7b232c57f76e8fb72a9c0558174f87760113546d3a9838130f1cdb74" "d0aa1464d7e55d18ca1e0381627fac40229b9a24bca2a3c1db8446482ce8185e" "74ba9ed7161a26bfe04580279b8cad163c00b802f54c574bfa5d924b99daa4b9" "5b809c3eae60da2af8a8cfba4e9e04b4d608cb49584cb5998f6e4a1c87c057c4" "4f01c1df1d203787560a67c1b295423174fd49934deb5e6789abd1e61dba9552" "3c2f28c6ba2ad7373ea4c43f28fcf2eed14818ec9f0659b1c97d4e89c99e091e" "2f1518e906a8b60fac943d02ad415f1d8b3933a5a7f75e307e6e9a26ef5bf570" "e72f5955ec6d8585b8ddb2accc2a4cb78d28629483ef3dcfee00ef3745e2292f" "79278310dd6cacf2d2f491063c4ab8b129fee2a498e4c25912ddaa6c3c5b621e" "1db4be958a1df556190253eaee2717c554402f93d96ff6ec9e206567d906817e" default))
 '(delete-selection-mode nil)
 '(fci-rule-color "#f9cec3")
 '(global-company-mode t)
 '(jdee-db-active-breakpoint-face-colors (cons "#16161c" "#e95678"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#16161c" "#09f7a0"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#16161c" "#6a6a6a"))
 '(objed-cursor-color "#e95678")
 '(package-selected-packages
   '(telephone-line evil-magit helm lsp-javacomp challenger-deep-theme sbt-mode ox-reveal scala-mode lsp-metals lsp-java rjsx-mode exec-path-from-shell haskell-mode lsp-python-ms w3m pdf-tools lsp-ivy lsp-treemacs lsp-ui lsp-mode rust-mode evil-commentary dashboard page-break-lines treemacs-all-the-icons doom-themes irony vterm zones swiper tron-legacy-theme company-jedi elpy centaur-tabs treemacs-persp treemacs-magit treemacs-icons-dired treemacs-projectile use-package projectile treemacs-evil treemacs evil))
 '(pdf-view-midnight-colors (cons "#c7c9cb" "#1c1e26"))
 '(rustic-ansi-faces
   ["#1c1e26" "#e95678" "#09f7a0" "#fab795" "#21bfc2" "#6c6f93" "#59e3e3" "#c7c9cb"])
 '(vc-annotate-background "#1c1e26")
 '(vc-annotate-color-map
   (list
    (cons 20 "#09f7a0")
    (cons 40 "#59e19c")
    (cons 60 "#a9cc98")
    (cons 80 "#fab795")
    (cons 100 "#f6ab8f")
    (cons 120 "#f39f89")
    (cons 140 "#f09383")
    (cons 160 "#c48788")
    (cons 180 "#987a8d")
    (cons 200 "#6c6f93")
    (cons 220 "#95668a")
    (cons 240 "#bf5e81")
    (cons 260 "#e95678")
    (cons 280 "#c95b74")
    (cons 300 "#a96071")
    (cons 320 "#89656d")
    (cons 340 "#f9cec3")
    (cons 360 "#f9cec3")))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; projectile
(projectile-mode +1)
(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)


;; treemacs
(use-package treemacs
  :ensure t
  :defer t
  :init
  (with-eval-after-load 'winum
    (define-key winum-keymap (kbd "M-0") #'treemacs-select-window))
  :config
  (progn
    (setq treemacs-collapse-dirs                 (if treemacs-python-executable 3 0)
          treemacs-deferred-git-apply-delay      0.5
          treemacs-directory-name-transformer    #'identity
          treemacs-display-in-side-window        t
          treemacs-eldoc-display                 t
          treemacs-file-event-delay              5000
          treemacs-file-extension-regex          treemacs-last-period-regex-value
          treemacs-file-follow-delay             0.2
          treemacs-file-name-transformer         #'identity
          treemacs-follow-after-init             t
          treemacs-git-command-pipe              ""
          treemacs-goto-tag-strategy             'refetch-index
          treemacs-indentation                   2
          treemacs-indentation-string            " "
          treemacs-is-never-other-window         nil
          treemacs-max-git-entries               5000
          treemacs-missing-project-action        'ask
          treemacs-move-forward-on-expand        nil
          treemacs-no-png-images                 nil
          treemacs-no-delete-other-windows       t
          treemacs-project-follow-cleanup        nil
          treemacs-persist-file                  (expand-file-name ".cache/treemacs-persist" user-emacs-directory)
          treemacs-position                      'left
          treemacs-recenter-distance             0.1
          treemacs-recenter-after-file-follow    nil
          treemacs-recenter-after-tag-follow     nil
          treemacs-recenter-after-project-jump   'always
          treemacs-recenter-after-project-expand 'on-distance
          treemacs-show-cursor                   nil
          treemacs-show-hidden-files             t
          treemacs-silent-filewatch              nil
          treemacs-silent-refresh                nil
          treemacs-sorting                       'alphabetic-asc
          treemacs-space-between-root-nodes      t
          treemacs-tag-follow-cleanup            t
          treemacs-tag-follow-delay              1.5
          treemacs-user-mode-line-format         nil
          treemacs-user-header-line-format       nil
          treemacs-width                         35
          treemacs-workspace-switch-cleanup      nil)

    ;; The default width and height of the icons is 22 pixels. If you are
    ;; using a Hi-DPI display, uncomment this to double the icon size.
    ;;(treemacs-resize-icons 44)

    (treemacs-follow-mode t)
    (treemacs-filewatch-mode t)
    (treemacs-fringe-indicator-mode t)
    (pcase (cons (not (null (executable-find "git")))
                 (not (null treemacs-python-executable)))
      (`(t . t)
       (treemacs-git-mode 'deferred))
      (`(t . _)
       (treemacs-git-mode 'simple))))
  :bind
  (:map global-map
        ("M-0"       . treemacs-select-window)
        ("C-x t 1"   . treemacs-delete-other-windows)
        ("C-x t t"   . treemacs)
        ("C-x t B"   . treemacs-bookmark)
        ("C-x t C-t" . treemacs-find-file)
        ("C-x t M-t" . treemacs-find-tag)))

(use-package treemacs-evil
  :after treemacs evil
  :ensure t)

(use-package treemacs-projectile
  :after treemacs projectile
  :ensure t)

(use-package treemacs-icons-dired
  :after treemacs dired
  :ensure t
  :config (treemacs-icons-dired-mode))

(use-package treemacs-magit
  :after treemacs magit
  :ensure t)

(use-package treemacs-persp ;;treemacs-persective if you use perspective.el vs. persp-mode
  :after treemacs persp-mode ;;or perspective vs. persp-mode
  :ensure t
  :config (treemacs-set-scope-type 'Perspectives))

;; centaur-tabs
;; (require 'centaur-tabs)
;; (centaur-tabs-mode t)
;; (global-set-key (kbd "C-<prior>")  'centaur-tabs-backward)
;; (global-set-key (kbd "C-<next>") 'centaur-tabs-forward)
;; (centaur-tabs-headline-match)
;; (setq centaur-tabs-style "bar")
;; (setq centaur-tabs-set-bar 'under)
;; (define-key evil-normal-state-map (kbd "g t") 'centaur-tabs-forward)
;; (define-key evil-normal-state-map (kbd "g T") 'centaur-tabs-backward)


;; company mode and ivy mode
(require 'company)
(global-company-mode)

;; helm time
(require 'helm)
(require 'helm-config)

;; The default "C-x c" is quite close to "C-x C-c", which quits Emacs.
;; Changed to "C-c h". Note: We must set "C-c h" globally, because we
;; cannot change `helm-command-prefix-key' once `helm-config' is loaded.
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-unset-key (kbd "C-x c"))
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "C-x C-f") 'helm-find-files)

(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to run persistent action
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB work in terminal
(define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z

(when (executable-find "curl")
  (setq helm-google-suggest-use-curl-p t))

(setq helm-split-window-in-side-p           t ; open helm buffer inside current window, not occupy whole other window
      helm-move-to-line-cycle-in-source     t ; move to end or beginning of source when reaching top or bottom of source.
      helm-ff-search-library-in-sexp        t ; search for library in `require' and `declare-function' sexp.
      helm-scroll-amount                    8 ; scroll 8 lines other window using M-<next>/M-<prior>
      helm-ff-file-name-history-use-recentf t
      helm-echo-input-in-header-line t)

(defun spacemacs//helm-hide-minibuffer-maybe ()
  "Hide minibuffer in Helm session if we use the header line as input field."
  (when (with-helm-buffer helm-echo-input-in-header-line)
    (let ((ov (make-overlay (point-min) (point-max) nil nil t)))
      (overlay-put ov 'window (selected-window))
      (overlay-put ov 'face
                   (let ((bg-color (face-background 'default nil)))
                     `(:background ,bg-color :foreground ,bg-color)))
      (setq-local cursor-type nil))))


(add-hook 'helm-minibuffer-set-up-hook
          'spacemacs//helm-hide-minibuffer-maybe)

(setq helm-autoresize-max-height 0)
(setq helm-autoresize-min-height 20)
(setq helm-M-x-fuzzy-match t)
(setq helm-buffers-fuzzy-matching t
      helm-recentf-fuzzy-match    t)


(helm-autoresize-mode 1)

(helm-mode 1)


;; irony mode
(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'objc-mode-hook 'irony-mode)

(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

;; setting up dashboard :nezuko_pump:
(require 'dashboard)
(dashboard-setup-startup-hook)
;; Set the title
(setq dashboard-banner-logo-title "Welcome to Inamacs")
;; Set the banner
(setq dashboard-startup-banner "/home/psiayn/.emacs.d/images/ina.png")
;; Value can be
;; 'official which displays the official emacs logo
;; 'logo which displays an alternative emacs logo
;; 1, 2 or 3 which displays one of the text banners
;; "path/to/your/image.png" or "path/to/your/text.txt" which displays whatever image/text you would prefer

;; Content is not centered by default. To center, set
(setq dashboard-center-content t)

;; To disable shortcut "jump" indicators for each section, set
;; (setq dashboard-show-shortcuts nil)

(setq dashboard-items '((recents  . 5)
			(bookmarks . 5)
			(projects . 5)
			(agenda . 5)
			(registers . 5)))

;; rust-mode and lsp
(require 'rust-mode)
(setq lsp-keymap-prefix "s-l")
(require 'lsp-mode)
(add-hook 'rust-mode-hook #'lsp)


;; adding python lsp
(require 'lsp-python-ms)
(setq lsp-python-ms-auto-install-server t)
(add-hook 'python-mode-hook #'lsp)

;; java go brrr
(require 'lsp-java)
(add-hook 'java-mode-hook #'lsp)

;; scala
;; Enable sbt mode for executing sbt commands
(use-package sbt-mode
  :commands sbt-start sbt-command
  :config
  ;; WORKAROUND: https://github.com/ensime/emacs-sbt-mode/issues/31
  ;; allows using SPACE when in the minibuffer
  (substitute-key-definition
   'minibuffer-complete-word
   'self-insert-command
   minibuffer-local-completion-map)
   ;; sbt-supershell kills sbt-mode:  https://github.com/hvesalai/emacs-sbt-mode/issues/152
   (setq sbt:program-options '("-Dsbt.supershell=false"))
)

;; Enable nice rendering of diagnostics like compile errors.
(use-package flycheck
  :init (global-flycheck-mode))

(use-package lsp-mode
  ;; Optional - enable lsp-mode automatically in scala files
  :hook  (scala-mode . lsp)
         (lsp-mode . lsp-lens-mode)
  :config (setq lsp-prefer-flymake nil))

;; Add metals backend for lsp-mode
(use-package lsp-metals
  :config (setq lsp-metals-treeview-show-when-views-received t))

;; Enable nice rendering of documentation on hover
(use-package lsp-ui)

;; Use the Debug Adapter Protocol for running tests and debugging
(use-package posframe
  ;; Posframe is a pop-up tool that must be manually installed for dap-mode
  )
(use-package dap-mode
  :hook
  (lsp-mode . dap-mode)
  (lsp-mode . dap-ui-mode)
  )

;; org reveal.js
(require 'ox-reveal)
(setq Org-Reveal-root "file:///home/psiayn/Downloads/reveal.js-4.1.0")
(setq Org-Reveal-title-slide nil)
