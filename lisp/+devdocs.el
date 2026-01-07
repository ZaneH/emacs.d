;;; +devdocs.el --- Devdocs -*- lexical-binding: t; -*-

(use-package devdocs
  :straight t)

(defun +my/devdocs-choose ()
  (interactive)
  (devdocs-lookup t))
