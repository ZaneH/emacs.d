;;; +helm.el --- Helm -*- lexical-binding: t; -*-

(use-package helm
  :straight t
  :defer t
  :config
  (setq helm-completion-style 'emacs))

(use-package helm-projectile
  :straight t
  :defer t
  :after (helm projectile)
  :commands (helm-projectile
             helm-projectile-switch-project
             helm-projectile-find-file
             helm-projectile-switch-to-buffer
             helm-projectile-recentf
             helm-projectile-find-dir
             helm-projectile-grep)
  :config
  (helm-projectile-on))

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
