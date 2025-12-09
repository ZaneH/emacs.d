;;; +helm.el --- Helm -*- lexical-binding: t; -*-

(use-package helm-icons
  :straight '(helm-icons :type git :host github :repo "yyoncho/helm-icons")
  :config
  (setq helm-icons-provider 'all-the-icons)
  :init
  (helm-icons-enable)
)

(use-package helm)
