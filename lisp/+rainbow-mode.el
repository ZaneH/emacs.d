;;; +rainbow-mode.el --- Color in Buffers -*- lexical-binding: t; -*-

(use-package rainbow-mode
  :straight t
  :defer t
  :hook
  (prog-mode . rainbow-mode))
