;;; +grammar.el --- Grammar -*- lexical-binding: t; -*-

(use-package lsp-ltex-plus
  :straight (lsp-ltex-plus :type git
                           :host github
                           :repo "emacs-languagetool/lsp-ltex-plus"
                           :branch "master")
  :init
  (defun +my/lsp-ltex-setup ()
    (require 'lsp-ltex-plus)
    (lsp-deferred))
  :hook ((org-mode markdown-mode text-mode latex-mode) . +my/lsp-ltex-setup)
  :config
  (setq lsp-ltex-plus-version "18.6.1")
  (setq lsp-ltex-plus-language "en-US")

  (setq lsp-ltex-plus-dictionary '(:en-US ["npm"
                                           "webpack"]))

  ;; Force recalculation of combined dictionary
  (setq lsp-ltex-plus--combined-dictionary
        (lsp-ltex-plus-combine-plists lsp-ltex-plus-dictionary
                                      lsp-ltex-plus--stored-dictionary)))
