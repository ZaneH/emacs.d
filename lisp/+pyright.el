;;; +pyright.el --- basedpyright > pyright -*- lexical-binding: t; -*-

(use-package lsp-pyright
  :straight t
  :defer t
  :custom (lsp-pyright-langserver-command "basedpyright")
  :hook (python-mode . (lambda ()
                          (require 'lsp-pyright)
                          (lsp-deferred))))
