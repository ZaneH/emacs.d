;;; +go.el --- Go -*- lexical-binding: t; -*-

(use-package go-mode
  :straight t
  :defer t
  :init
  (add-hook 'go-mode-hook #'lsp-deferred)
  (defun lsp-go-install-save-hooks ()
    (add-hook 'before-save-hook #'lsp-format-buffer t t)
    (add-hook 'before-save-hook #'lsp-organize-imports t t))
  (add-hook 'go-mode-hook #'lsp-go-install-save-hooks)
  (add-hook 'go-mode-hook
            (lambda ()
              (defalias 'godef-jump #'lsp-find-definition)
              (defalias 'godef-describe #'lsp-ui-doc-glance))))
