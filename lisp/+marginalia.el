;;; +marginalia.el --- Marginalia -*- lexical-binding: t; -*-

(use-package marginalia
  :straight t
  :defer t
  :bind (:map minibuffer-local-map
         ("M-A" . marginalia-cycle))
  :init
  (marginalia-mode))
