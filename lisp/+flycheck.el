;;; +flycheck.el --- Flycheck Syntax Checker -*- lexical-binding: t; -*-

(use-package flycheck
  :straight t
  :defer t
  :ensure t
  :config
  (add-hook 'after-init-hook #'global-flycheck-mode)
  :bind (:map flycheck-mode-map
              ("M-n" . flycheck-next-error) ; optional but recommended error navigation
              ("M-p" . flycheck-previous-error)))
