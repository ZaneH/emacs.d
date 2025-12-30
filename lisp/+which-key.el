;;; +which-key.el --- Which Key -*- lexical-binding: t; -*-

(use-package which-key
  :straight t
  :defer t
  :config
  (setq which-key-idle-delay 0.3
        which-key-sort-order 'which-key-key-order-alpha)
  (which-key-setup-side-window-bottom)
  :init
  (which-key-mode))
