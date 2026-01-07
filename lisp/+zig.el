;;; +zig.el --- Zig -*- lexical-binding: t; -*-

(use-package zig-mode
  :straight t
  :defer t
  :mode ("\\.\\(zig\\|zon\\)\\'" . zig-mode)
  :after treesit
  :config
  (setq lsp-zig-zls-executable (executable-find "zls"))
  (setq lsp-zig-zig-exe-path (executable-find "zig")))
