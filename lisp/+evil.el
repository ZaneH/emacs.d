;;; +evil.el --- Evil -*- lexical-binding: t; -*-

(use-package evil
  :ensure t
  :init
  (setq evil-want-C-u-scroll t)
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  :config
  (evil-mode 1))

(use-package evil-collection
  :after evil
  :ensure t
  :config
  (evil-collection-init))

(use-package undo-tree
  :ensure t
  :config
  (evil-set-undo-system 'undo-tree)
  (global-undo-tree-mode))