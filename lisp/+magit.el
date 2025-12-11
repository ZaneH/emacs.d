;;; +magit.el --- Magit -*- lexical-binding: t; -*-

(use-package magit
  :defer t)
(use-package forge
  :defer t
  :after magit)

(setq auth-sources '("~/.authinfo.gpg"))
