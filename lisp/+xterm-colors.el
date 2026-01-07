;;; +xterm-color.el --- Xterm Color -*- lexical-binding: t; -*-

(use-package xterm-color
  :straight t
  :defer t
  :config
  (setq compilation-environment '("TERM=xterm-256color"))
  :init
  (define-advice compilation-filter (:around (f proc string) xterm-color)
    (funcall f proc (xterm-color-filter string))))
