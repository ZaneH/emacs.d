;;; +gptel.el --- GPTel -*- lexical-binding: t; -*-

(use-package gptel
  :defer t)

(use-package gptel-magit
  :ensure t
  :defer t
  :hook (magit-mode . gptel-magit-install))
