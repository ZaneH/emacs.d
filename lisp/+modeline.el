;;; +modeline.el --- Modeline -*- lexical-binding: t; -*-

(use-package doom-modeline
  :straight t
  :defer t
  :init (doom-modeline-mode 1)
  :config
  (setq doom-modeline-position-column-line-format '("L%l:%c"))
  (column-number-mode t))
