;;; +vundo.el --- Undo Tree -*- lexical-binding: t; -*-

(use-package undo-fu-session
  :config
  (setq undo-fu-session-incompatible-files '("/COMMIT_EDITMSG\\'" "/git-rebase-todo\\'"))
  :init
  (undo-fu-session-global-mode))

(use-package vundo
  :defer t
  :config
  (setq vundo-glyph-alist vundo-unicode-symbols))
