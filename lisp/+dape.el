;;; +dape.el --- Dape (Debug Adapter Protocol for Emacs) -*- lexical-binding: t; -*-

;; @see https://github.com/svaante/dape
(use-package dape
  :straight t
  :defer t
  :preface
  (setq dape-key-prefix nil)
  :custom
  (dape-breakpoint-global-mode +1)
  (dape-buffer-window-arrangement 'right)
  (dape-cwd-function #'projectile-project-root))

(use-package repeat
  :straight nil
  :custom
  (repeat-mode +1))

(use-package emacs
  :straight nil
  :custom
  (window-sides-vertical t))
