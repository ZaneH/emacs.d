;;; +smartparens.el --- Smart parenthesis -*- lexical-binding: t; -*-

(use-package smartparens
  :straight t
  :defer t
  :ensure smartparens
  :hook (prog-mode text-mode markdown-mode tsx-ts-mode web-mode js-ts-mode)
  :config
  (require 'smartparens-config))
