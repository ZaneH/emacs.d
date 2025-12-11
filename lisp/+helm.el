;;; +helm.el --- Helm -*- lexical-binding: t; -*-

(use-package helm
  :defer t)

(use-package helm-projectile
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
  :defer t
  :straight '(helm-icons :type git :host github :repo "yyoncho/helm-icons")
  :config
  (setq helm-icons-provider 'all-the-icons)
  :init
  (helm-icons-enable))

(use-package helm-rg
  :defer t
  :after helm
  :commands (helm-rg)
  :config
  (setq helm-rg-default-directory 'git-root))
