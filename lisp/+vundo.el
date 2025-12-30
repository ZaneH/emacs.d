;;; +vundo.el --- Undo Tree -*- lexical-binding: t; -*-

(use-package undo-fu-session
  :straight t
  :config
  (setq undo-fu-session-incompatible-files '("/COMMIT_EDITMSG\\'" "/git-rebase-todo\\'"))
  :init
  (undo-fu-session-global-mode))

(use-package vundo
  :straight t
  :defer t
  :config
  (setq vundo-glyph-alist vundo-unicode-symbols))
