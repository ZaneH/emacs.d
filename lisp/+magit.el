;;; +magit.el --- Magit -*- lexical-binding: t; -*-

(use-package magit)
(use-package forge
  :after magit)

(setq auth-sources '("~/.authinfo.gpg"))

(my/leader
  "g"   '(:ignore t :which-key "git")
  "gg"  '(magit-status :which-key "Magit status"))
