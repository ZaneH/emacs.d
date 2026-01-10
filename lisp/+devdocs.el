;;; +devdocs.el --- Devdocs -*- lexical-binding: t; -*-

(use-package devdocs
  :straight t
  :defer t
  :demand t)

(defun +my/devdocs-choose ()
  (interactive)
  (devdocs-lookup t))
