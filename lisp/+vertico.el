;;; +vertico.el --- Vertico (Minibuffer) -*- lexical-binding: t; -*-

(use-package vertico
  :straight t
  :defer t
  :custom
  (vertico-count 20)
  (vertico-cycle t)
  :init
  (vertico-mode))

(use-package emacs
  :straight nil
  :custom
  (context-menu-mode t)
  (enable-recursive-minibuffers t)
  (read-extended-command-predicate #'command-completion-default-include-p)
  (minibuffer-prompt-properties
   '(read-only t cursor-intangible t face minibuffer-prompt)))
