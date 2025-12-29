;;; +icons.el --- All the Icons -*- lexical-binding: t; -*-

(use-package all-the-icons
  :defer t
  :if (display-graphic-p))

(use-package all-the-icons-dired
  :hook (dired-mode . all-the-icons-dired-mode))
