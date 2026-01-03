;;; +magit.el --- Magit -*- lexical-binding: t; -*-

(use-package magit
  :straight t
  :defer t)

(use-package forge
  :straight t
  :defer t
  :after magit)

(use-package magit-todos
  :straight t
  :defer t
  :after magit
  :config (magit-todos-mode +1))

(setq auth-sources '("~/.authinfo.gpg"))
