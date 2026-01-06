;;; +zig.el --- Zig -*- lexical-binding: t; -*-

(use-package zig-mode
  :straight t
  :defer t
  :mode ("\\.\\(zig\\|zon\\)\\'" . zig-mode)
  :after treesit)
