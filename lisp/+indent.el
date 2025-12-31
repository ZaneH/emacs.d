;;; +indent.el --- Indention -*- lexical-binding: t; -*-

(use-package dtrt-indent
  :straight t
  :defer t
  :init
  (dtrt-indent-global-mode +1))
