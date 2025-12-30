;;; +ace-window.el --- Ace Window -*- lexical-binding: t; -*-

(use-package ace-window
  :straight t
  :defer t
  :init
  (global-set-key (kbd "M-o") 'ace-window))
