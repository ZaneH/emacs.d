;;; +orderless.el --- Orderless Completion -*- lexical-binding: t; -*-

(use-package orderless
  :straight t
  :defer t
  :init
  (setq completion-styles '(orderless basic)
        completion-category-defaults nil
        completion-category-overrides
        '((file (styles basic partial-completion))))

  ;; Enable fuzzy / flex matching
  (setq orderless-matching-styles
        '(orderless-literal
          orderless-regexp
          orderless-flex)))
