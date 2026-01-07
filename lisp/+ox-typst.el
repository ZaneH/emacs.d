;;; +ox-typst.el --- Typst Org Exporter -*- lexical-binding: t; -*-

(use-package ox-typst
  :straight t
  :after org
  :config
  (setq org-typst-from-latex-environment #'org-typst-from-latex-with-naive
      org-typst-from-latex-fragment #'org-typst-from-latex-with-naive))
