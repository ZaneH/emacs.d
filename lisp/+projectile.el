;;; +projectile.el --- Projectile -*- lexical-binding: t; -*-

(use-package projectile
  :defer t
  :config
  (setq projectile-completion-system 'helm)
  :init
  (projectile-mode +1))
