;;; +eldoc-box.el --- Eldoc Box -*- lexical-binding: t; -*-

(use-package eldoc-box
  :straight t
  :init
  (require 'eldoc-box)
  (add-hook 'prog-mode-hook #'eldoc-box-hover-at-point-mode)
  :config
  (setq eldoc-box-only-multi-line t)
  (add-hook 'eldoc-box-buffer-setup-hook #'eldoc-box-prettify-ts-errors 0 t)
  (set-face-attribute 'eldoc-box-border nil :background (face-attribute 'mode-line-inactive :background)))
