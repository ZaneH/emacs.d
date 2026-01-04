;;; +helm.el --- Helm -*- lexical-binding: t; -*-

(use-package helm
  :straight t
  :defer t
  :config
  (setq helm-completion-style 'emacs))

(use-package helm-icons
  :straight '(helm-icons :type git :host github :repo "yyoncho/helm-icons")
  :defer t
  :config
  (setq helm-icons-provider 'all-the-icons)
  :init
  (helm-icons-enable))

(use-package helm-rg
  :straight t
  :defer t
  :after helm
  :commands (helm-rg)
  :config
  (setq helm-rg-default-directory 'git-root))

(use-package helm-lsp
  :straight t
  :defer t
  :after (helm lsp-mode)
  :init
  (define-key lsp-mode-map [remap xref-find-apropos] #'helm-lsp-workspace-symbol))

(use-package helm-xref
  :straight t
  :defer t
  :after helm)
