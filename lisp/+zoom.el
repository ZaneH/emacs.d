;;; +zoom.el --- Zoom -*- lexical-binding: t; -*-

(use-package zoom
  :straight t
  :defer t
  :init
  (custom-set-variables
   '(zoom-mode t)
   '(zoom-size '(0.618 . 0.618))
   '(zoom-ignored-major-modes '(vterm-mode))))
