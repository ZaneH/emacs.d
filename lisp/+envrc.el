;;; +envrc.el --- envrc -*- lexical-binding: t; -*-

(use-package envrc
  :straight t
  :defer t
  :hook (after-init . envrc-global-mode))
