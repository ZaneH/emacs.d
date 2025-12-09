;;; +flycheck.el --- Flycheck Syntax Checker -*- lexical-binding: t; -*-

(use-package flycheck
  :ensure t
  :config
  (add-hook 'after-init-hook #'global-flycheck-mode))
