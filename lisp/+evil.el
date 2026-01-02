;;; +evil.el --- Evil -*- lexical-binding: t; -*-

(use-package evil
  :straight t
  :init
  (setq evil-want-C-u-scroll t)
  (setq evil-want-C-i-jump t)
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  (setq evil-undo-system 'undo-redo)
  :config
  (evil-mode 1))

(use-package evil-collection
  :straight t
  :after evil
  :init
  (setq forge-add-default-bindings nil)
  :config
  (evil-collection-init))

(use-package evil-mc
  :straight t
  :init
  (require 'evil-mc)
  (global-evil-mc-mode 1))

(use-package evil-org
  :straight t
  :after (evil org)
  :hook (org-mode . (lambda () evil-org-mode))
  :config
  (require 'evil-org-agenda)
  (evil-org-agenda-set-keys))

(use-package evil-surround
  :straight t
  :after evil
  :config
  (global-evil-surround-mode 1))
