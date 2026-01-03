;;; +org-roam.el --- Org Roam -*- lexical-binding: t; -*-

(use-package org-roam
  :straight t
  ;; :defer t -- Do not defer
  :after org
  :init
  (setq org-roam-directory "~/repos/org/roam/")
  :config
  (org-roam-db-autosync-mode))
