;;; +org.el --- Org -*- lexical-binding: t; -*-

(use-package org
  :straight (:type built-in)
  :commands (org-mode org-agenda)
  :mode ("\\.org\\'" . org-mode)
  :config
  (setq org-directory "~/repos/org")
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

(use-package org-bullets
  :straight t
  :defer t
  :after org
  :init
  (require 'org-bullets)
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

(use-package org-archive
  :straight (:type built-in)
  :defer t
  :after org
  :config
  (setq org-archive-location "archive.org::datetree/"))
