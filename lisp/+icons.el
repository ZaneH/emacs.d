;;; +icons.el --- All the Icons -*- lexical-binding: t; -*-

(use-package all-the-icons
  :straight t
  :defer t
  :if (display-graphic-p))

(use-package all-the-icons-dired
  :straight t
  :hook (dired-mode . all-the-icons-dired-mode))
