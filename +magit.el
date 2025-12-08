;;; +magit.el --- Magit -*- lexical-binding: t; -*-

(use-package magit)
(use-package forge
  :after magit)

(setq auth-sources '("~/.authinfo.gpg"))