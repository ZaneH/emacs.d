;;; +treemacs.el --- Treemacs -*- lexical-binding: t; -*-

(use-package treemacs
  :ensure t
  :defer t
  :config
  ;; git path on NixOS
  (setq treemacs-git-executable "/run/current-system/sw/bin/git")

  (treemacs-git-mode 'deferred)
  (treemacs-hide-gitignored-files-mode t)
  :bind
  (:map global-map
        ("M-0"   . treemacs-select-window))
  )

(use-package treemacs-evil
  :after (treemacs evil)
  :ensure t)

(use-package treemacs-projectile
  :after (treemacs projectile)
  :ensure t)

(use-package treemacs-magit
  :after (treemacs magit)
  :ensure t)
