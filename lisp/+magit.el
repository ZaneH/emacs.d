;;; +magit.el --- Magit -*- lexical-binding: t; -*-

(use-package magit
  :straight t
  ;; :defer t -- Do not defer
)

(use-package forge
  :straight t
  :after magit)

(use-package magit-todos
  :straight t
  ;; :defer t -- Do not defer
  :after magit
  :config (magit-todos-mode +1))

(setq auth-sources '("~/.authinfo.gpg"))
