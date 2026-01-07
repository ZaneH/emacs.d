;;; +zig.el --- Zig -*- lexical-binding: t; -*-

(use-package zig-mode
  :straight t
  :defer t
  :mode (("\\.zig\\'" . zig-ts-mode)
         ("\\.zon\\'" . zig-ts-mode))
  :after (treesit zig-ts-mode)
  :config
  (setq lsp-zig-zls-executable (executable-find "zls"))
  (setq lsp-zig-zig-exe-path (executable-find "zig")))

(use-package zig-ts-mode
  :straight t
  :defer t
  :mode (("\\.zig\\'" . zig-ts-mode)
         ("\\.zon\\'" . zig-ts-mode)))
