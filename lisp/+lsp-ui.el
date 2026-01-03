;;; +lsp-ui.el --- LSP UI -*- lexical-binding: t; -*-

(use-package lsp-ui
  :straight t
  :defer t
  :hook (lsp-mode . lsp-ui-mode)
  :config
  (setq lsp-ui-doc-enable t
        lsp-ui-doc-position 'at-point
        lsp-ui-doc-show-with-cursor t
        lsp-ui-doc-delay 0.5))
