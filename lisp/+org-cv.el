;;; +org-cv.el --- Org CV -*- lexical-binding: t; -*-

(straight-use-package '(org-cv :host gitlab
                               :repo "Titan-C/org-cv"
                               :branch "master"))

(with-eval-after-load 'org
  (require 'ox-moderncv)

  (setq org-latex-compiler "lualatex")
  (setq org-preview-latex-default-process 'dvisvgm))
