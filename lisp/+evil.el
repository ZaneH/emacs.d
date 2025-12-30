;;; +evil.el --- Evil -*- lexical-binding: t; -*-

(use-package evil
  :straight t
  :ensure t
  :init
  (setq evil-want-C-u-scroll t)
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  :config
  (evil-mode 1))

(use-package evil-collection
  :straight t
  :after evil
  :ensure t
  :config
  (evil-collection-init))

(use-package evil-mc
  :straight t
  :init
  (require 'evil-mc)
  (global-evil-mc-mode 1))
