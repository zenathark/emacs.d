(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("2a998a3b66a0a6068bcb8b53cd3b519d230dd1527b07232e54c8b9d84061d48d" "c11421683c971b41d154b1a4ef20a2c800537b72fefa618b50b184bbfe6b48a0" "4f0f2f5ec60a4c6881ba36ffbfef31b2eea1c63aad9fe3a4a0e89452346de278" "705f3f6154b4e8fac069849507fd8b660ece013b64a0a31846624ca18d6cf5e1" "4904daa168519536b08ca4655d798ca0fb50d3545e6244cefcf7d0c7b338af7e" "8122f00211dbaf973fbe5831f808af92387c8fc1a44f0c6bcc9b22c16997c9dd" default)))
 '(flycheck-racket-executable "/usr/local/bin/racket")
 '(package-selected-packages
   (quote
    (literate-coffee-mode coffee-mode litterate-coffee-mode sass-mode gold-mode js2-mode web-mode lorem-ipsum smeargle orgit git-timemachine git-messenger git-link gitconfig-mode gitattributes-mode gitignore-mode evil-magit cider-eval-sexp-fu eval-sexp-fu counsel ivy-smex smex swiper xcscope aggressive-indent auto-highlight-symbol clean-aindent-mode popwin popup company-statistics company yasnippet powerline base16-theme sublimity smooth-scroll company-auctex ahk-mode cider clojure-mode paredit clang-format cmake-mode evil-search-highlight-persist evil-matchit evil-org-mode flycheck-ycmd vi-tilde-fringe volatile-highlights define-word expand-region google-translate highlight-parentheses highlight-numbers highlight-indentation indent-guide open-junk-file rainbow-delimiters ace-window ace-link electric-indent-mode page-break-lines fill-column-indicator exec-path-from-shell srefactor helm-gtags helm-cscope company-c-headers disaster stickyfunc-enhance stickyfunc-enhace helm cmake-font-lock whitespace-cleanup-mode use-package smartparens racket-mode pyenv-mode key-chord irony-eldoc hlinum haskell-mode geiser flycheck-irony evil-numbers evil-nerd-commenter evil-leader evil-args company-ycmd company-irony company-anaconda atom-one-dark-theme)))
 '(safe-local-variable-values (quote ((Tex-master . "syllabus"))))
 '(smeargle-age-colors
   (quote
    ((0)
     (1 plist-get zen/base16-colors :base07)
     (2 plist-get zen/base16-colors :base07)
     (3 plist-get zen/base16-colors :base07)
     (4 plist-get zen/base16-colors :base07)
     (5 plist-get zen/base16-colors :base07)
     (6 plist-get zen/base16-colors :base07)
     (7 plist-get zen/base16-colors :base07)
     (8 plist-get zen/base16-colors :base07)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;; UTF-8
(setq utf-translate-cjk-mode nil) ; disable CJK coding/encoding (Chinese/Japanese/Korean characters)
(set-language-environment 'utf-8)
(setq locale-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(unless (eq system-type 'windows-nt)
  (set-selection-coding-system 'utf-8))
(prefer-coding-system 'utf-8)
(set-default 'truncate-lines t)
(setq visible-bell t)

(require 'cl-lib)
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)
(setq package-enable-at-startup nil)

(eval-when-compile
  (require 'use-package))

(add-to-list 'load-path "~/.emacs.d/gists/")

(setq default-input-method "latin-1-prefix")

(desktop-change-dir "~/.emacs.d/cache")
(desktop-save-mode 1)

;;;------------------------------------------------------------------------------
;;;                              General Section
;;;------------------------------------------------------------------------------
;;; Theme
(use-package base16-theme
  :ensure t
  :config
  (load-theme 'base16-harmonic16-light)
  (defvar zen/base16-colors base16-harmonic16-light-colors)
  (set-face-attribute 'fringe nil
					  :foreground (plist-get zen/base16-colors :base04)
					  :background (plist-get zen/base16-colors :base00))
  )

(scroll-bar-mode -1)
(tool-bar-mode -1)
(column-number-mode 1)
(setq inhibit-splash-screen t)

; Line numbers
(use-package hlinum
  :ensure t
  :config
  (hlinum-activate)
  (set-face-attribute 'linum nil
					  :foreground (plist-get zen/base16-colors :base02))
  (set-face-attribute 'linum-highlight-face nil
					  :foreground (plist-get zen/base16-colors :base02)
					  :background (plist-get zen/base16-colors :base03)))

(global-linum-mode)
(hl-line-mode t)
(set-face-attribute 'hl-line nil
					:foreground nil
					:background (plist-get zen/base16-colors :base01))
(set-cursor-color (plist-get zen/base16-colors :base05))
(add-to-list 'default-frame-alist `(cursor-color . ,(plist-get zen/base16-colors :base05)))

(set-face-attribute 'mode-line nil
		    :font "DejaVu Sans Mono-12")
(set-face-attribute 'mode-line-inactive nil
		    :font "DejaVu Sans Mono-12")
(set-face-attribute 'minibuffer-prompt nil
		    :font "DejaVu Sans Mono-12")

(setq truncate-lines t)
(fset 'yes-or-no-p 'y-or-n-p)
(setq x-underline-at-descent-line t)
(setq redisplay-dont-pause t)
(setq minibuffer-prompt-properties
       '(read-only t point-entered minibuffer-avoid-prompt face minibuffer-prompt))
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1)))
(setq scroll-step 1)
(setq scroll-margin 3)
(setq require-final-newline t)
(set-face-font 'default "DejaVu Sans Mono-11")
(set-face-font 'variable-pitch "DejaVu Sans Mono-11")
(set-face-font 'fixed-pitch "DejaVu Sans Mono-11")
(add-to-list 'default-frame-alist '(font . "DejaVu Sans Mono-11"))
(setq linum-format " %4d  ")
(setq-default line-spacing 3)

(use-package evil
  :ensure t
  :config
  (evil-mode t))

(use-package powerline
  :ensure t
  :config
  (powerline-center-evil-theme))

(use-package general
  :ensure t
  :config
  (general-evil-setup t)
  (setq evil-leader "SPC")
  (setq evil-command ",")
  (imap "C-c" 'evil-normal-state)
  (vmap "C-c" 'evil-normal-state)
  (nmap :prefix evil-leader "mx" 'execute-extended-command)
  (nmap ";;" 'evil-ex)
  (evil-ex-define-cmd "q" 'save-buffers-kill-terminal))

(use-package ace-link
   :ensure t
   ;; (progn
   ;;   (eval-after-load "info"
   ;;     '(define-key Info-mode-map "o" 'ace-link-info))
   ;;   (eval-after-load "help-mode"
   ;;     '(define-key helm-mode-map "o" 'ace-link-help)))
   :config
   (ace-link-setup-default))

(use-package ace-window
  :ensure t
  :defer t
  :init
  (progn
    (nmap :prefix evil-leader
      "bM" 'ace-swap-window
      "wC" 'ace-delete-window
      "ww" 'ace-window)
    (setq aw-keys '(?a ?o ?e ?u ?i ?d ?h ?t ?t?n ?s))))

(use-package golden-ratio
  :ensure t
  :defer t
  :init
  (golden-ratio-mode)
  :config
  (progn
    (setq golden-ratio-exclude-modes '("bs-mode"
				       "calc-mode"
				       "ediff-mode"
				       "dired-mode"
				       "gud-mode"
				       "gdb-locals-mode"
				       "gdb-registers-mode"
				       "gdb-breakpoints-mode"
				       "gdb-threads-mode"
				       "gdb-frames-mode"
				       "gdb-inferior-io-mode"
				       "gdb-disassembly-mode"
				       "gdb-memory-mode"
				       "restclient-mode"
				       "speedbar-mode"
				       ))
    (add-to-list 'golden-ratio-exclude-modes "^\\*[hH]elm.*")
    (setq golden-ratio-extra-commands
	  (append golden-ratio-extra-commands
		  '(ace-window
		    ace-delete-window
		    ace-select-window
		    ace-swap-window
		    ace-maximize-window
		    windowmove-left
		    windowmove-rigth
		    windowmove-up
		    windowmove-down
		    evil-window-delete
		    evil-window-split
		    evil-window-vsplit
		    evil-window-left
		    evil-window-right
		    evil-window-up
		    evil-window-down
		    evil-window-bottom-right
		    evil-window-top-left
		    evil-window-mru
		    evil-window-next
		    evil-window-prev
		    evil-window-new
		    evil-window-vnew
		    evil-window-rotate-upwards
		    evil-window-rotate-downwards
		    evil-window-move-very-top
		    evil-window-move-far-left
		    evil-window-move-far-right
		    evil-window-move-very-bottom
		    select-window-0
		    select-window-1
		    select-window-2
		    select-window-3
		    select-window-4
		    select-window-5
		    select-window-6
		    select-window-7
		    select-window-8
		    select-window-9
		    buf-move-left
		    buf-move-right
		    buf-move-up
		    buf-move-down
		    ess-eval-buffer-and-go
		    ess-eval-function-and-go
		    ess-eval-line-and-go)))
    (nmap :prefix evil-leader
	  "tg" 'golden-ratio-mode)))

(use-package rainbow-delimiters
  :ensure t
  :defer t
  :config
  (nmap :prefix evil-leader
	"tPd" 'rainbow-delimiters-mode))

(use-package open-junk-file
  :ensure t
  :defer t
  :commands (open-junk-file)
  :config
  (general-nmap :prefix evil-leader "fJ" 'open-junk-file)
  (setq open-junk-file-directory "~/.emacs.d/cache/junk/"))

(use-package indent-guide
  :ensure t
  :defer t
  :commands (indent-guide-mode
	     indent-guide-global-mode)
  :config
  (nmap :prefix evil-leader
	"ti" 'indent-guide-mode
	"t C-i" 'indent-guide-global-mode))

(use-package highlight-indentation
  :ensure t
  :commands (highlight-indentation-mode highlight-indentation-current-column-mode)
  :config
  (nmap :prefix evil-leader
	"thi" 'highlight-indentation-mode
	"thc" 'highlight-indentation-current-column-mode))

(use-package highlight-numbers
  :ensure t
  :config
  (add-hook 'prog-mode-hook 'highlight-numbers-mode))

(use-package highlight-parentheses
  :ensure t
  :defer t
  :config
  (add-hook 'prog-mode-hook #'highlight-parentheses-mode)
  (setq hl-paren-delay 0.2)
  (general-nmap :prefix evil-leader "tHp" 'highlight-parentheses-mode)
  (set-face-attribute 'hl-paren-face nil :weight 'ultra-bold))


(use-package google-translate
  :ensure t)

(use-package expand-region
  :ensure t
  :config
  (nmap :prefix evil-leader "v" 'er/expand-region)
  (setq expand-region-contract-fast-key "V"
        expand-region-reset-fast-key "r"))

(use-package define-word
  :ensure t)

(use-package volatile-highlights
  :ensure t
  :config
  (volatile-highlights-mode t))

;; Ensure path variables
(use-package exec-path-from-shell
  :ensure t
  :config
  (when (memq window-system '(mac ns))
    (exec-path-from-shell-initialize)))

(use-package irony
  :ensure t)

(use-package flycheck
  :ensure t
  :config
  (add-hook 'after-init-hook #'global-flycheck-mode))

(use-package sublimity
  :ensure t
  :config
  (require 'sublimity-scroll))

(use-package smartparens
  :ensure t
  :config
  (general-nmap :prefix evil-leader "tp" 'smartparens-mode)
  (setq sp-show-pair-delay 0.2
	sp-show-pair-from-inside t
	sp-cancel-autoskip-on-backward-movement nil)
  (require 'smartparens-config)
  (show-smartparens-global-mode +1)
  (sp-local-pair 'minibuffer-inactive-mode "'" nil :actions nil)
  (general-define-key :maps 'smartparens-mode-map
		      "C-<right>" 'sp-forward-slurp-sexp
		      "C-<left>" 'sp-forward-barf-sexp
		      "C-M-<left>" 'sp-backward-slup-sexp
		      "C-M-<right>" 'sp-backward-barf-sexp))
  ;; (defun spacemacs/smartparens-pair-newline (id action context)
  ;;   (save-excursion
  ;;     (newline)
  ;;     (indent-according-to-mode)))
  ;; (defun spacemacs/smartparens-pair-newline-and-indent (id action context)
  ;;   (spacemacs/smartparens-pair-newline id action context)
  ;;   (indent-according-to-mode))
  ;; (sp-pair "{" nil :post-handlers
  ;; 	   '(:add (spacemacs/smartparens-pair-newline-and-indent "RET")))
  ;; (sp-pair "[" nil :post-handlers
  ;; 	   '(:add (spacemacs/smartparens-pair-newline-and-indent "RET"))))


(use-package yasnippet
  :ensure t
  :config
  (yas-global-mode t))

(use-package company
  :ensure t
  :diminish company-mode
  :config
  (global-company-mode)
  (load-file "~/.emacs.d/gists/company-complete-cycle/company-complete-cycle.el"))

(use-package company-statistics
  :ensure t
  :config
  (company-statistics-mode))

(use-package whitespace-cleanup-mode
  :ensure t
  :diminish whitespace-cleanup-mode
  :config
  (global-whitespace-cleanup-mode))

(use-package projectile
  :ensure t
  :commands (projectile-run-shell-command-in-root
	     projectile-run-async-shell-command-in-root
	     projectile-toggle-between-implementation-and-test
	     projectile-compile-project
	     projectile-dired
	     projectile-regenerate-tags
	     projectile-invalidate-cache
	     projectile-kill-buffers
	     projectile-multi-occur
	     projectile-replace
	     projectile-find-test-file
	     projectile-find-tag)
  :config
  (setq projectile-enable-caching t
	projectile-indexing-method 'alien
	projectile-sort-order 'recentf
	projectile-cache-file "~/.emacs.d/cache/projectile.cache"
	projectile-knowns-projects-file "~/.emacs.d/cache/projectile-bookmarks.eld")
  (nmap :prefix evil-leader
	"p!" 'projectile-run-shell-command-in-root
	"p&" 'projectile-run-async-shell-command-in-root
	"pa" 'projectile-toggle-between-implementation-and-test
	"pc" 'projectile-compile-project
	"pD" 'projectile-dired
	"pG" 'projectile-regenerate-tags
	"pI" 'projectile-invalidate-cache
	"pk" 'projectile-kill-buffers
	"po" 'projectile-multi-occur
	"pR" 'projectile-replace
	"pT" 'projectile-find-test-file
	"py" 'projectile-find-tag
	"pp" 'projectile-switch-project
	"pb" 'projectile-switch-to-buffer
	"pd" 'projectile-find-dir
	"pf" 'projectile-find-file
	"ph" 'projectile
	"pr" 'projectile-recentf
	"pv" 'projectile-vc
	"pgp" 'projectile-grep)
  (projectile-global-mode)
  (setq projectile-completion-system 'ivy))

(use-package page-break-lines
  :ensure t
  :config
  (global-page-break-lines-mode t))

(use-package magit
  :ensure t
  :config
  (nmap :prefix evil-leader
	"gS" 'magit-stage-file
	"gM" 'magit-display-last))

(use-package evil-magit
  :ensure t)

(use-package gitignore-mode
  :ensure t)

(use-package gitattributes-mode
  :ensure t)

(use-package gitconfig-mode
  :ensure t)

(use-package git-link
  :ensure t)

(use-package git-messenger
  :ensure t)

(use-package git-timemachine
  :ensure t)

(use-package orgit
  :ensure t)

(use-package smeargle
  :ensure t
  :config
  (nmap :prefix evil-leader
	"svs" 'smeargle
	"svc" 'smeargle-commits)
  (custom-set-variables
   '(smeargle-age-colors '((0 . nil)
			   (1 . (plist-get zen/base16-colors :base07))
			   (2 . (plist-get zen/base16-colors :base07))
			   (3 . (plist-get zen/base16-colors :base07))
			   (4 . (plist-get zen/base16-colors :base07))
			   (5 . (plist-get zen/base16-colors :base07))
			   (6 . (plist-get zen/base16-colors :base07))
			   (7 . (plist-get zen/base16-colors :base07))
			   (8 . (plist-get zen/base16-colors :base07)))))
  (setq-default smeargle-age-threshold 1))

;; (use-package helm
;;   :ensure t
;;   :defer t
;;   :commands (helm-find-file)
;;   :config
;;   (setq helm-autoresize-min-height 10)
;;   (helm-autoresize-mode 1)
;;   (defvar helm-source-header-default-background (face-attribute 'helm-source-header :background))
;;   (defvar helm-source-header-default-foreground (face-attribute 'helm-source-header :foreground))
;;   (defvar helm-source-header-default-box (face-attribute 'helm-source-header :box))
;;   (defvar helm-source-header-default-height (face-attribute 'helm-source-header :height))
;;   (setq helm-prevent-escaping-from-minibuffer t
;; 	helm-bookmark-show-location t
;; 	helm-display-header-line nil
;; 	helm-split-window-in-side-p t
;; 	helm-always-two-windows t
;; 	helm-echo-input-in-header-line t
;; 	helm-imenu-execute-action-at-once-if-one nil)
;;   (setq helm-M-x-fuzzy-match t
;; 	helm-apropos-fuzzy-match t
;; 	helm-file-cache-fuzzy-match t
;; 	helm-imenu-fuzzy-match t
;; 	helm-lisp-fuzzy-completion t
;; 	helm-recentf-fuzzy-match t
;; 	helm-semantic-fuzzy-match t
;; 	helm-buffers-fuzzy-matching t)
;;   (setq helm-locate-fuzzy-match (executable-find "locate"))
;;   (nmap :prefix evil-leader
;; 	"<f1>" 'helm-apropos
;; 	"Cl"   'helm-colors
;; 	"ff"   'helm-find-files
;; 	"fL"   'helm-locate
;; 	"fr"   'helm-recentf
;; 	"hb"   'helm-filtered-bookmarks
;; 	"hi"   'helm-info-at-point
;; 	"hl"   'helm-resume
;; 	"hm"   'helm-man-woman
;; 	"iu"   'helm-ucs
;; 	"ry"   'helm-register
;; 	"rm"   'helm-all-mark-rings
;; 	"xx"   'helm-M-x))

;; (use-package helm-descbinds
;;   :ensure t)

;; (use-package helm-projectile
;;   :ensure t
;;   :commands (helm-projectile-switch-to-buffer
;; 	     helm-projectile-find-dir
;; 	     helm-projectile-dired-find-dir
;; 	     helm-projectile-recentf
;; 	     helm-projectile-find-file
;; 	     helm-projectile-grep
;; 	     helm-projectile
;; 	     helm-projectile-switch-project)
;;   :config
;;   (setq projectile-switch-project-action 'helm-projectile)
;;   (nmap :prefix evil-leader
;; 	"pb" 'helm-projectile-switch-to-buffer
;; 	"pd" 'helm-projectile-find-dir
;; 	"pf" 'helm-projectile-find-file
;; 	"ph" 'helm-projectile
;; 	"pp" 'helm-projectile-switch-project
;; 	"pr" 'helm-projectile-recentf
;; 	"pv" 'projectile-vc
;; 	"sgp" 'helm-projectile-grep))

;; (use-package helm-ag
;;   :ensure t)

;; (use-package helm-make
;;   :ensure t
;;   :defer t
;;   :config
;;   (nmap :prefix evil-leader
;; 	"cc" 'helm-make-projectile
;; 	"cm" 'helm-make))

;; (use-package helm-swoop
;;   :ensure t)

;; (use-package helm-cscope
;;   :ensure t)

;; (use-package helm-gtags
;;   :ensure t)

(use-package ivy
  :ensure swiper
  :config
  (ivy-mode 1)
  (setq use-ivy-virtual-buffers t)
  :config
  (nmap :prefix evil-leader
        "ixb" 'ivy-switch-buffer))


(use-package counsel
  :ensure t
  :config
  (nmap :prefix evil-leader "xx" 'counsel-M-x)
  (general-define-key "M-x" 'counsel-M-x))

(use-package popup
  :ensure t
  :defer t)

(use-package popwin
  :ensure t
  :config
  (popwin-mode 1)
  (nmap :prefix evil-leader
	"wpm" 'popwin:messages
	"wpp" 'popwin:close-popup-window
	"wpc" '(lambda () (interactive) (popwin:display-buffer "*compilation*")))
  (setq popwin:special-display-config nil)
  (push '("*Help*"                   :dedicated t :position bottom :stick t :noselect nil :height 0.4) popwin:special-display-config)
  (push '("*compilation*"            :dedicated t :position bottom :stick t :noselect t   :height 0.4) popwin:special-display-config)
  (push '("*Warnings*"               :dedicated t :position bottom :stick t :noselect t   :height 0.4) popwin:special-display-config)
  (push '("*Shell Command Output*"   :dedicated t :position bottom :stick t :noselect nil            ) popwin:special-display-config)
  (push '("*Async Shell Command*"    :dedicated t :position bottom :stick t :noselect nil            ) popwin:special-display-config)
  (push '(" *undo-tree*"             :dedicated t :position bottom :stick t :noselect nil :height 0.4) popwin:special-display-config)
  (push '("*ert*"                    :dedicated t :position bottom :stick t :noselect nil :height 0.4) popwin:special-display-config)
  (push '("*grep*"                   :dedicated t :position bottom :stick t :noselect nil :height 0.4) popwin:special-display-config)
  (push '("*nosetests*"              :dedicated t :position bottom :stick t :noselect nil :height 0.4) popwin:special-display-config)
  (push '("^\*WoMan.+\*$" :regexp t               :position bottom                                   ) popwin:special-display-config)
  (push '("*cider-test-report*"      :dedicated t :position bottom :stick t :noselect t   :height 0.4) popwin:special-display-config)
  (push '("*cider-error*"            :dedicated t :position bottom :stick t :noselect t   :height 0.4) popwin:special-display-config))

(use-package recentf
  :ensure t
  :defer t
  :config
  (add-hook 'find-file-hook (lambda () (unless recentf-mode
					 (recentf-mode))))
  (add-to-list 'recentf-exclude "~/.emacs.d/cache")
  (add-to-list 'recentf-exclude "~/.emacs.d/elpa")
  (add-to-list 'recentf-exclude "~/.emacs.d/irony")
  (add-to-list 'recentf-exclude "~/.emacs.d/auto-save-list")
  (setq recentf-save-file "~/.emacs.d/cache/recetf")
  (setq recentf-max-saved-items 100)
  (setq recentf-auto-cleanup 'never)
  (setq recentf-auto-save-timer (run-with-idle-timer 600 t 'recentf-save-list)))

(use-package stickyfunc-enhance
  :ensure t)

(use-package undo-tree
  :ensure t
  :config
  (global-undo-tree-mode)
  (setq undo-tree-visualizer-timestamps t)
  (setq undo-tree-visualizer-diff t))

(use-package subword
  :ensure t
  :defer t
  :config
  (unless (category-docstring ?U)
    (define-category ?U "Uppercase")
    (define-category ?u "Lowercase"))
  (modify-category-entry (cons ?A ?Z) ?U)
  (modify-category-entry (cons ?a ?z) ?u)
  (make-variable-buffer-local 'evil-cjk-word-separating-categories)
  (defun subword-enable-camel-case ()
    (if subword-mode
	(push '(?u . ?U) evil-cjk-word-separating-categories)
      (setq evil-cjk-word-separating-categories
	    (default-value 'evil-cjk-word-separating-categories))))
  (add-hook 'subword-mode-hook 'subword-enable-camel-case)
  (nmap :prefix evil-leader
	"tc" 'subword-mode
	"tC" 'global-subword-mode))

(use-package bookmark
  :ensure t
  :defer t
  :config
  (setq bookmark-save-flag 1))

(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets
      uniquify-ignore-buffers-re "^\\*")

(use-package ediff
  :ensure t
  :defer t
  :config
  (setq-default ediff-window-setup-function 'ediff-setup-windows-plain
		ediff-split-window-function 'split-window-horizontally
		ediff-merge-split-window-function 'split-window-horizontally))

(use-package eldoc
  :ensure t
  :defer t
  :config
  (add-hook 'eval-expression-minibuffer-setup-hook #'eldoc-mode)
  (add-hook 'ielm-mode-hook #'eldoc-mode))

(use-package clean-aindent-mode
  :ensure t)

(use-package auto-highlight-symbol
  :ensure t)

(use-package aggressive-indent
  :ensure t)


(use-package semantic
  :ensure t
  :config
  (setq srecode-map-save-file "~/.emacs.d/cache/srecode-map.el")
  (setq semanticdb-default-save-directory "~/.emacs.d/cache/semanticdb/"))

(use-package srefactor
  :ensure t
  :defer t
  :config
  (defun lazy-load-srefactor ()
    (require 'srefactor)
    (add-hook 'srefactor-ui-menu-mode-hook 'evil-emacs-state)))

(use-package stickyfunc-enhance
  :defer t
  :config (require 'stickyfunc-enhance))



(use-package xcscope
  :ensure t)
;;;------------------------------------------------------------------------------
;;;                               Evil Section
;;;------------------------------------------------------------------------------

(use-package evil-numbers
  :ensure t)

;(use-package evil-args
  ;:ensure t
  ;:config
  ;(general-define-key :keymaps 'inner "a" 'evil-inner-arg)
  ;(general-define-key :kepmaps 'outer "a" 'evil-outer-arg)
  ;(general-define-key :keymaps 'normal
;		      "L" 'evil-forward-arg
;		      "H" 'evil-backward-argi
;		      "K" 'evil-jump-out-args))
;  (general-define-key :keymaps 'motion
;		      "L" 'evil-forward-arg
;		      "H" 'evil-backward-arg)

(use-package evil-org
  :ensure t)

(use-package evil-nerd-commenter
  :ensure t
  :config
  (evilnc-default-hotkeys)
  (nvmap :prefix evil-leader
	"cl" 'evilnc-comment-or-uncomment-lines
	"ct" 'evilnc-quick-comment-or-uncomment-to-the-line
	"cy" 'evilnc-copy-and-comment-lines
	"cp" 'evilnc-comment-or-uncomment-paragraphs
	"cr" 'comment-or-uncomment-region
	"cv" 'evilnc-toggle-invert-comment-line-by-line
	";"  'evilnc-comment-operator
	"kk" 'kill-buffer
	))

(use-package evil-surround
  :ensure t
  :config
    (global-evil-surround-mode 1)
    (general-define-key :prefix evil-leader
			:keymaps 'surround
			"sr" 'evil-surround-region
			"Sr" 'evil-substitute))
    ;; (evil-define-key 'visual evil-surround-mode-map "s" 'evil-surround-region)
    ;; (evil-define-key 'visual evil-surround-mode-map "S" 'evil-substitute))

(use-package evil-visualstar
  :ensure t
  :commands (evil-visualstar/begin-search-forward
	     evil-visualstar/begin-search-backward)
  :init
  (general-define-key :keymaps 'visual
		      "*" 'evil-visualstar/begin-search-forward
		      "#" 'evil-visualstar/begin-search-backward))

;    (define-key evil-visual-state-map (kbd "#") 'evil-visualstar/begin-search-backward))

(use-package evil-anzu
  :ensure t)

(use-package evil-exchange
  :ensure t)

(use-package evil-matchit
  :ensure t)

;; (use-package eval-sexp-fu
;;   :ensure )

(use-package evil-search-highlight-persist
  :ensure t)

(use-package vi-tilde-fringe
  :ensure t
  :if window-system
  :config
  (global-vi-tilde-fringe-mode)
  (add-hook 'after-change-major-mode-hook (lambda () (when buffer-read-only
						       (vi-tilde-fringe-mode -1)))))

(use-package avy
  :defer t
  :config
  (setq avy-keys (number-sequence ?a ?z))
  (setq avy-all-windows 'all-frames)
  (setq avy-background t)
  (nmap :prefix evil-leader
	"SPC" 'avy-goto-word-or-subword-1
	"l" 'avy-goto-line
	"`" 'avy-pop-mark))
;;;------------------------------------------------------------------------------
;;;                   Keybindings Section
;;;------------------------------------------------------------------------------

(general-define-key "C-x C-b" 'ibuffer)
(nmap :prefix evil-leader
      "xb" 'ibuffer)

;; ;;;------------------------------------------------------------------------------
;; ;;;                   General Programming Packages Section
;; ;;;------------------------------------------------------------------------------
(use-package paredit
  :ensure t
  :config
  (autoload 'enable-paredit-mode "paredit" "Turn pseudo structural editing" t))
;; ;;;------------------------------------------------------------------------------
;; ;;;                             Python Section
;; ;;;------------------------------------------------------------------------------

;; ;; (use-package anaconda-mode
;; ;;    :ensure t
;; ;;    :config
;; ;;    (add-hook 'python-mode-hook 'anaconda-mode)
;; ;;    (add-hook 'python-mode-hook 'eldoc-mode))

;; ;; (use-package pyenv-mode
;; ;;    :ensure t
;; ;;    :config
;; ;;    (pyenv-mode))

;; ;; (use-package company-anaconda
;; ;;   :ensure t)

;; ;; ;; (setq python-shell-interpreter "python")

;; ;; ;; (setq
;; ;; ;;  python-shell-interpreter "ipython"
;; ;; ;;  python-shell-interpreter-args ""
;; ;; ;;  python-shell-prompt-regexp "In \\[[0-9]+\\]: "
;; ;; ;;  python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: "
;; ;; ;;  python-shell-completion-setup-code
;; ;; ;;    "from IPython.core.completerlib import module_completion"
;; ;; ;;  python-shell-completion-module-string-code
;; ;; ;;    "';'.join(module_completion('''%s'''))\n"
;; ;; ;;  python-shell-completion-string-code
;; ;; ;;    "';'.join(get_ipython().Completer.all_completions('''%s'''))\n")

;; ;; (add-hook 'python-mode-hook '(lambda () (linum-mode t)))

;; ;; (add-hook 'python-mode-hook '(lambda () (hl-line-mode t)))

;; ;; (add-hook 'python-mode-hook '(lambda () (flycheck-mode t)))

;; ;; (add-hook 'python-mode-hook 'anaconda-mode)

;; ;; (add-hook 'python-mode-hook 'eldoc-mode)

;; ;; (add-hook 'python-mode-hook '(lambda () (add-to-list 'company-backends 'company-anaconda)))

;; ;; exec-path (cons "/usr/local/bin" exec-path))
;; ;; (setq exec-path (cons (concat (getenv "HOME") "/.pyenv/shims") exec-path))
;; ;; (setenv "PATH" (cl-reduce '(lambda (a b) (concat a ":" b)) exec-path))

;; ;;;------------------------------------------------------------------------------
;; ;;;                             Lisp Section
;; ;;;------------------------------------------------------------------------------
(add-hook 'emacs-lisp-mode-hook 'rainbow-delimiters-mode)
(add-hook 'emacs-lisp-mode-hook (lambda () (hl-line-mode t)))
(add-hook 'emacs-lisp-mode-hook 'enable-paredit-mode)

(nmap :prefix evil-leader :mode 'emacs-lisp-mode-map
  "xe" 'eval-last-sexp
  "xr" 'eval-region
  "xb" 'eval-buffer
  "xf" 'eval-defun)
;; ;;;------------------------------------------------------------------------------
;; ;;;                             Racket Section
;; ;;;------------------------------------------------------------------------------

;; (use-package geiser
;;   :ensure t)

;; (use-package racket-mode
;;   :ensure t)

;; (add-hook 'racket-mode-hook 'rainbow-delimiters-mode)
;; (add-hook 'racket-mode-hook '(lambda () (hl-line-mode t)))
;; (add-hook 'racket-mode-hook 'geiser-mode)
;; (add-hook 'racket-mode-hook 'evil-local-mode)
;; (setq geiser-active-implementations '(racket))
;; (setq geiser-racket-binary "/usr/local/bin/racket")
;; (setq flycheck-racket-executable "/usr/local/bin/racket")


;; (evil-leader/set-key-for-mode 'racket-mode
;;   "xe" 'geiser-eval-last-sexp
;;   "xr" 'geiser-eval-region-and-go
;;   "xb" 'geiser-eval-buffer-and-go
;;   "xf" 'geiser-eval-definition-and-go)

;; ;;;-------------------------------------------------------------------------
;; ;;;                             C/C++ Section
;; ;;;-------------------------------------------------------------------------


;; (use-package irony
;;   :ensure t
;;   :config
;;   (add-hook 'c++-mode-hook 'irony-mode)
;;   (add-hook 'c-mode-hook 'irony-mode)
;;   (add-hook 'objc-mode-hook 'irony-mode)
;;   (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options))
;; (add-hook 'c++-mode-hook 'electric-pair-mode)
;; (add-hook 'c-mode-hook 'electric-pair-mode)

;; (use-package company-irony
;;   :ensure t
;;   :config
;;   (push 'company-irony company-backends))

;; (use-package flycheck-irony
;;   :ensure t
;;   :config
;;   (add-hook 'flycheck-mode-hook #'flycheck-irony-setup))

;; (use-package irony-eldoc
;;   :ensure t
;;   :config
;;   (with-eval-after-load "irony"
;;     (add-hook 'irony-mode-hook 'irony-eldoc)))
;; ;; (use-package company-ycmd
;; ;;   :ensure t
;; ;;   :config
;; ;;   (company-ycmd-setup))

;; ;; (use-package flycheck-ycmd
;; ;;   :ensure t
;; ;;   :init
;; ;;   (add-hook 'ycmd-file-parse-result-hook 'flycheck-ycmd--cache-parse-results)
;; ;;   (add-to-list 'flycheck-checkers 'ycmd))

;; ;; (use-package ycmd
;; ;;   :ensure t
;; ;;   :defer t
;; ;;   :init (set-variable 'ycmd-server-command '("python" "/usr/local/bin/ycmd")))

;; (use-package cc-mode
;;   :defer t
;;   :init
;;   (add-to-list 'auto-mode-alist `("\\.h$" . c-mode))
;;   :config
;;   (progn
;;     (require 'compile)
;;     (c-toggle-auto-newline 1)
;;     (evil-leader/set-key-for-mode 'c-mode
;;       "mga" 'projectile-find-other-file
;;       "mgA" 'projectile-find-other-file-other-window)
;;     (evil-leader/set-key-for-mode 'c++-mode
;;       "mga" 'projectile-find-other-file
;;       "mgA" 'projectile-find-other-file-other-window)))

;; (use-package cmake-mode
;;   :ensure t)

;; (use-package cmake-font-lock
;;   :ensure t)

;; (use-package disaster
;;   :ensure t
;;   :defer t
;;   :commands (disaster)
;;   :init
;;   (progn
;;     (evil-leader/set-key-for-mode 'c-mode
;;       "mD" 'disaster)
;;     (evil-leader/set-key-for-mode 'c++-mode
;;       "mD" 'disaster)))

;; (use-package company-c-headers
;;   :ensure t
;;   :config
;;   (push 'company-c-headers company-backends))

;; (use-package clang-format
;;   :ensure t)

;; (use-package gdb-mi
;;   :defer t
;;   :init
;;   (setq
;;    gdb-many-windows t
;;    gdb-show-main t))

;; (evil-leader/set-key-for-mode 'c-mode
;;     "mgc" 'helm-gtags-create-tags
;;     "mgd" 'helm-gtags-find-tag
;;     "mgf" 'helm-gtags-select-path
;;     "mgg" 'helm-gtags-dwim
;;     "mgG" 'helm-gtags-dwim-other-window
;;     "mgi" 'helm-gtags-tags-in-this-function
;;     "mgl" 'helm-gtags-parse-file
;;     "mgn" 'helm-gtags-next-history
;;     "mgp" 'helm-gtags-previous-history
;;     "mgr" 'helm-gtags-find-rtag
;;     "mgR" 'helm-gtags-resume
;;     "mgs" 'helm-gtags-select
;;     "mgS" 'helm-gtags-show-stack
;;     "mgu" 'helm-gtags-update-tag
;;     "mr"  'srefactor-refactor-at-point
;;     "mgc" 'helm-cscope-find-called-function
;;     "mgC" 'helm-cscope-find-calling-this-funtcion
;;     "mgd" 'helm-cscope-find-global-definition
;;     "mge" 'helm-cscope-find-egrep-pattern
;;     "mgf" 'helm-cscope-find-this-file
;;     "mgF" 'helm-cscope-find-files-including-file
;;     "mgr" 'helm-cscope-find-this-symbol
;;     "mgx" 'helm-cscope-find-this-text-string
;;     "mgi" 'cscope-index-files)

;; (evil-leader/set-key-for-mode 'c++-mode
;;     "mgc" 'helm-gtags-create-tags
;;     "mgd" 'helm-gtags-find-tag
;;     "mgf" 'helm-gtags-select-path
;;     "mgg" 'helm-gtags-dwim
;;     "mgG" 'helm-gtags-dwim-other-window
;;     "mgi" 'helm-gtags-tags-in-this-function
;;     "mgl" 'helm-gtags-parse-file
;;     "mgn" 'helm-gtags-next-history
;;     "mgp" 'helm-gtags-previous-history
;;     "mgr" 'helm-gtags-find-rtag
;;     "mgR" 'helm-gtags-resume
;;     "mgs" 'helm-gtags-select
;;     "mgS" 'helm-gtags-show-stack
;;     "mgu" 'helm-gtags-update-tag
;;     "mr"  'srefactor-refactor-at-point
;;     "mgc" 'helm-cscope-find-called-function
;;     "mgC" 'helm-cscope-find-calling-this-funtcion
;;     "mgd" 'helm-cscope-find-global-definition
;;     "mge" 'helm-cscope-find-egrep-pattern
;;     "mgf" 'helm-cscope-find-this-file
;;     "mgF" 'helm-cscope-find-files-including-file
;;     "mgr" 'helm-cscope-find-this-symbol
;;     "mgx" 'helm-cscope-find-this-text-string
;;     "mgi" 'cscope-index-files)

;; (add-hook 'c-mode-hook 'flycheck-mode)
;; (add-hook 'c++-mode-hook 'flycheck-mode)

;; (add-hook 'c-mode-hook 'lazy-load-srefactor)
;; (add-hook 'c++-mode-hook 'lazy-load-srefactor)

;; (add-hook 'c-mode-hook 'electric-pair-mode)
;; (add-hook 'c++-mode-hook 'electric-pair-mode)

;; (add-hook 'c-mode-hook 'hlinum-activate)
;; (add-hook 'c++-mode-hook 'hlinum-activate)
;; (add-hook 'java-mode 'hlinum-activate)
;; (add-hook 'java-mode 'fci-mode)
;; (setq-default tab-width 4)
;; (setq c-default-style "linux"
;; 	  c-basic-offset 4)

;; ;; (add-hook 'c-mode-hook 'lazy-load-stickyfunc-enhance)

;; ;; (add-hook 'c++-mode-hook 'lazy-load-stickyfunc-enhance)


;; ;;;------------------------------------------------------------------------------
;; ;;;                             Clojure Section
;; ;;;------------------------------------------------------------------------------
(use-package clojure-mode
             :ensure
             :mode "\\.clj\\'" "\\.boot\\'"
             :config
             (add-hook 'clojure-mode-hook 'rainbow-delimiters-mode)
             (add-hook 'clojure-mode-hook #'smartparens-mode)
             (add-hook 'clojure-mode-hook #'turn-on-smartparens-strict-mode)
             (nmap :prefix evil-leader "wpb" 'popwin:popup-buffer  )
             (popwin:popup-buffer "*cider-test-report*")
             (general-define-keys :states '(normal)
                                  :keymaps 'cider-mode-map
                                  :prefix evil-command
                                  "cji" 'cider-jack-in
                                  "ee" 'cider-eval-last-sexp
                                  "ef" 'cider-eval-defun-at-point
                                  "er" 'cider-eval-region
                                  "em" 'cider-macroexpand-1
                                  "eM" 'cider-macroexpand-all
                                  "ew" 'cider-eval-last-sexp-and-replace
                                  "cz" 'cider-switch-to-repl-buffer)
             (general-define-keys :states '(normal)
                                  :keymap 'cider-repl-mode-map
                                  :prefix evil-command
                                  "cz" 'cider-switch-to-last-clojure-buffer))

(defun evil--cider-preceding-sexp (command &rest args)
  "In normal-state or motion-state, cider-last-sexp ends at point."
  (if (and (not evil-move-beyond-eol)
	   (or (evil-normal-state-p) (evil-motion-state-p)))
      (save-excursion
	(unless (or (eobp) (eolp)) (forward-char))
	(apply command args))
    (apply command args)))

(advice-add 'cider-last-sexp :around #'evil--cider-preceding-sexp)

;; (use-package clojurec-mode)

;; (use-package clojurescript-mode)

(use-package cider-repl-mode
  :no-require t
  :ensure cider)


;; ;;;------------------------------------------------------------------------------
;; ;;;                             Windows Section
;; ;;;------------------------------------------------------------------------------

;; (use-package ahk-mode
;;   :if (string-equal system-type "windows-nt")
;;   :ensure t
;;   :mode "//.ahk//'")

;;;------------------------------------------------------------------------------
;;;                             Latex Section
;;;------------------------------------------------------------------------------
;; (use-package tex-mik
;;   :if (or (eq system-type 'ms-dos) (eq system-type 'windows-nt)))

(use-package company-auctex
  :ensure t
  :config
  (company-auctex-init))


(setq ispell-program-name "aspell")
(setq ispell-dictionary "spanish")
(require 'ispell)
(add-to-list 'ispell-local-dictionary-alist
     '("spanish"
        "[a-zA-Z]"
        "[^a-zA-Z]"
        "[']"
        nil
        ("-d" "es")
        nil
        iso-8859-1))

(require 'dbus)

(add-hook 'LaTeX-mode-hook 'enable-evince-sync)

(setq TeX-view-program-list '(("Evince" "evince --page-index=%(outpage) %o")))
(setq TeX-view-program-selection '((output-pdf "Evince")))

(defun th-evince-sync (file linecol &rest ignored)
  (let* ((fname (un-urlify file))
         (buf (find-buffer-visiting fname))
         (line (car linecol))
         (col (cadr linecol)))
    (if (null buf)
        (message "[Synctex]: %s is not opened..." fname)
      (switch-to-buffer buf)
      (goto-line (car linecol))
      (unless (= col -1)
        (move-to-column col)))))

(defvar *dbus-evince-signal* nil)

(defun un-urlify (fname-or-url)
  "A trivial function that replaces a prefix of file:/// with just /."
  (if (string= (substring fname-or-url 0 8) "file:///")
      (substring fname-or-url 7)
    fname-or-url))

(defun enable-evince-sync ()
  (require 'dbus)
  (when (and
         (eq window-system 'x)
         (fboundp 'dbus-register-signal))
    (unless *dbus-evince-signal*
      (setf *dbus-evince-signal*
            (dbus-register-signal
             :session nil "/org/gnome/evince/Window/0"
             "org.gnome.evince.Window" "SyncSource"
             'th-evince-sync)))))

;;;------------------------------------------------------------------------------
;;;                             Org Section
;;;------------------------------------------------------------------------------
(require 'ox)
(require 'ox-latex)
(require 'ox-beamer)
;;(setq org-latex-classes '())
;;(setq org-export-latex-listing t)
;;(setq org-export-latex-packages-alist '(("resources/syllabus")))

(setf org-latex-default-packages-alist
      (remove '("AUTO" "inputenc" t) org-latex-default-packages-alist))

;; (let ((pos (cl-position '("T1" "fontenc" t) ; T1 -> utf8 for pdflatex
;; 		     org-latex-default-packages-alist
;; 		     :test 'equal)))
;;   (if pos
;;       (setf (nth pos org-latex-default-packages-alist)
;; 	    '("" "fontspec" t))))



(add-to-list 'org-latex-default-packages-alist '("" "fontspec" t) t)
(add-to-list 'org-latex-packages-alist '("" "microtype" nil) t)
(add-to-list 'org-latex-packages-alist '("" "microtype" nil) t)
(add-to-list 'org-latex-packages-alist '("" "libertine" t) t)
(add-to-list 'org-latex-packages-alist '("libertine" "newtxmath" t) t)

(add-to-list 'org-latex-packages-alist '("" "polyglossia" nil) t)
;; (add-to-list 'org-latex-packages-alist
;; 	     "\\setdefaultlanguage[variant=british]{english}" t)

(add-to-list 'org-latex-packages-alist
	     '("backgroundcolor=green!40" "todonotes" nil) t)

;; (add-to-list 'org-latex-packages-alist '("" "makerobust" nil) t)
;; (add-to-list 'org-latex-packages-alist "\\MakeRobustCommand\\begin" t)
;; (add-to-list 'org-latex-packages-alist "\\MakeRobustCommand\\end" t)
;; (add-to-list 'org-latex-packages-alist "\\MakeRobustCommand\\item" t)

(setq org-latex-compiler "lualatex"
      org-latex-bib-compiler "biber"
      org-latex-pdf-process ; -shell-escape needed for minted
      '("%latex -shell-escape -interaction nonstopmode -output-directory %o %f"
	"%latex -shell-escape -interaction nonstopmode -output-directory %o %f"
	"%latex -shell-escape -interaction nonstopmode -output-directory %o %f")
      ;; org-latex-pdf-process '("sh -v -x texi2dvi -p -b -c -V %f") ; historical
      ;; TODO: maybe use arara, that probably requires export changes
      )

(add-to-list 'org-latex-classes
             '("koma-article"
               "\\documentclass{scrartcl}
                 [NO-DEFAULT-PACKAGES]
                 [PACKAGES]
                 [EXTRA]"
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
               ("\\paragraph{%s}" . "\\paragraph*{%s}")
               ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

(add-to-list 'org-latex-classes
             '("beamer"
               "\\documentclass\[presentation\]\{beamer\}"
               ("\\section\{%s\}" . "\\section*\{%s\}")
               ("\\subsection\{%s\}" . "\\subsection*\{%s\}")
               ("\\subsubsection\{%s\}" . "\\subsubsection*\{%s\}")))

(defun my-org-confirm-babel-evaluate (lang body)
  (not (string= lang "calc")))  ; don't ask for ditaa
(setq org-confirm-babel-evaluate 'my-org-confirm-babel-evaluate)

(setq org-latex-to-pdf-process
	  '("latexmk -e "$pdflatex=q/lualatex -synctex=1 -interaction=nonstopmode/" -pdf %f"))

(setq org-latex-pdf-process '("latexmk -lualatex -quiet -shell-escape -pdf -auxdir=auxdir -outdir=build -f %f"))

(setq-default TeX-master nil)

(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (calc . t)
   (ditaa . t)
   (shell . t)))

(setq org-latex-listings 'minted)

(setq-default fill-column 80)

;; (setq org-list-allow-alphabetical t)
;; (setq org-latex-create-formula-image-program 'dvipng)
;; (setq org-preview-latex-default-process 'dvipng)
(put 'downcase-region 'disabled nil)
(setq org-preview-latex-default-process 'imagemagick)
(custom-set-variables
 '(org-preview-latex-process-alist
   '((imagemagick :programs
		    ("latex" "convert")
		    :description "pdf > png" :message "you need to install the programs: latex and imagemagick." :use-xcolor t :image-input-type "pdf" :image-output-type "png" :image-size-adjust
		    (1.0 . 1.0)
		    :latex-compiler
		    ("latexmk -lualatex -quiet -shell-escape -pdf -outdir=%o %f")
		    :image-converter
		    ("convert -density %D -trim -antialias %f -quality 100 %O")))))


;;;------------------------------------------------------------------------------
;;;                            Web Section
;;;------------------------------------------------------------------------------
(use-package lorem-ipsum
  :ensure t)

(use-package web-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.phtml'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.tpl\\.php'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.[agj]sp'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.as[cp]x'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.erb'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.mustache'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.djhtml'" . web-mode)))

(use-package js2-mode
  :ensure t)

(use-package gold-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.ace'" . gold-mode)))

(use-package sass-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.sass'" . sass-mode)))


;;;------------------------------------------------------------------------------
;;;			Coffee Script Section
;;;------------------------------------------------------------------------------

(use-package coffee-mode
  :ensure t)

(use-package literate-coffee-mode
  :ensure t)

;;; init.el ends here
