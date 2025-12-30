;;; +magit.el --- Magit -*- lexical-binding: t; -*-

(use-package magit
  :straight t
  :defer t)

(use-package forge
  :straight t
  :defer t
  :after magit)

(setq auth-sources '("~/.authinfo.gpg"))
