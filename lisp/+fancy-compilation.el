;;; +fancy-compilation.el --- Fancy Compilation -*- lexical-binding: t; -*-

(use-package fancy-compilation
  :straight t
  :defer t
  :commands (fancy-compilation-mode))

(with-eval-after-load 'compile
  (fancy-compilation-mode))