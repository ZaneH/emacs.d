;;; +code-folding.el --- Code Folding -*- lexical-binding: t; -*-

(use-package vimish-fold
  :straight t
  :defer t
  :after evil)

(use-package evil-vimish-fold
  :straight t
  :defer t
  :after vimish-fold
  :init
  (setq evil-vimish-fold-mode-lighter " ⮒")
  (setq evil-vimish-fold-target-modes '(prog-mode conf-mode text-mode))
  :config
  (global-evil-vimish-fold-mode))
