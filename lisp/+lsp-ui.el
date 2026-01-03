;;; +lsp-ui.el --- LSP UI -*- lexical-binding: t; -*-

(use-package lsp-ui
  :straight t
  :defer t
  :commands
  (lsp-ui-doc-show
   lsp-ui-doc-glance)
  :hook (lsp-mode . lsp-ui-mode)
  :after (lsp-mode evil)
  :config (setq lsp-ui-doc-enable t
                evil-lookup-func #'lsp-ui-doc-glance ; Makes K in evil-mode toggle the doc for symbol at point
                lsp-ui-doc-show-with-cursor nil      ; Don't show doc when cursor is over symbol - too distracting
                lsp-ui-doc-include-signature t       ; Show signature
                lsp-ui-doc-position 'at-point))
