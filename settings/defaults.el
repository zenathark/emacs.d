;;; default.el --- Provides general defaults for emacs

;;; Commentary:
;; This package provides a serie of defaults for Emacs based on
;; spacemacs and philiparvidsson configurations.

;;; Code:

;; set frame title
(setq frame-title-format '("%b"))

;; Disable tooltips
(setq tooltip-mode nil)

(setq echo-keystrokes 0.1)

(setq column-number-mode t)
(setq line-number-mode t)

(setq-default fill-column 80)
(setq-default indent-tabs-mode nil)

;; Suppress scratch buffer message
(setq initial-scratch-message "")

;; Coding default on utf-8
(prefer-coding-system 'utf-8)
(setq utf-translate-cjk-mode nil)
(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(unless (eq system-type 'windows-nt)
  (set-selection-coding-system 'utf-8))
(set-language-environment 'utf-8)

;; Dont wrap lines
(set-default 'truncate-lines t)
;; Disable annoying bell
(setq visible-bell t)

;; Unix line endings
(setq-default buffer-file-coding-system 'utf-8-unix)

;; Delete selection when typing
(delete-selection-mode t)

;; Global Sub words
(global-subword-mode t)

(setq backup-directory-alist `(("." . "~/.emacs.d/backups")))
(setq backup-by-copying t)

;; Smooth mouse scrolling https://www.emacswiki.org/emacs/SmoothScrolling
(setq mouse-wheel-scroll-amount '(1 ((shift) .1)))
(setq mouse-wheel-progressive-speed nil)
(setq mouse-wheel-follow-mouse 't)
(setq scroll-step 1)

(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; For tilde input press C-\
(setq default-input-method "latin-1-prefix")

(desktop-change-dir "~/.emacs.d/cache")

(set-frame-font "Fira Code-11.0:antialias=subpixel:spacing=m:weight=bold")

(provide 'defaults)
;;; Defaults.el ends here
