;;; +projectile.el --- Projectile -*- lexical-binding: t; -*-

(use-package projectile
  :defer t
  :config
  (add-hook 'dired-mode-hook 'all-the-icons-dired-mode)
  (setq projectile-completion-system 'helm)
  :init
  (projectile-mode +1))
