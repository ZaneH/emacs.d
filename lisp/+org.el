;;; +org.el --- Org -*- lexical-binding: t; -*-

(use-package org
  :straight (:type built-in)
  :commands (org-mode org-agenda)
  :mode ("\\.org\\'" . org-mode)
  :config
  (setq org-agenda-files '("~/repos/org/todo.org"))
  :custom
  (org-startup-folded t)
  (org-startup-indented t)
  (org-pretty-entities t)
  (org-hide-emphasis-markers t)
  (org-startup-with-inline-images t)
  (org-image-actual-width '(300))
  (org-ellipsis " ▾")
  (org-agenda-start-with-log-mode t)
  (org-log-done 'time)
  (org-log-into-drawer t))
