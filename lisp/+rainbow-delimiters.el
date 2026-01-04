;;; +rainbow-delimiters.el --- Rainbow Delimiters -*- lexical-binding: t; -*-

(use-package rainbow-delimiters
  :straight t
  :defer t
  :hook
  (prog-mode . rainbow-delimiters-mode)
  :config
  (set-face-attribute 'rainbow-delimiters-mismatched-face nil :foreground "orange")
  (set-face-attribute 'rainbow-delimiters-unmatched-face  nil :foreground "#f0008b"))
