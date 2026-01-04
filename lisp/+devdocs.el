;;; +devdocs.el --- Devdocs -*- lexical-binding: t; -*-

(use-package devdocs
  :straight t
  :defer t
  :bind ("C-h D" . devdocs-lookup))
