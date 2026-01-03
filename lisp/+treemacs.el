;;; +treemacs.el --- Treemacs -*- lexical-binding: t; -*-

(use-package treemacs
  :straight t
  :defer t
  :config
  (setq treemacs-git-executable (executable-find "git"))
  (setq treemacs-python-executable (executable-find "python"))

  (setq treemacs-follow-after-init t
        treemacs-recenter-after-file-follow t
        treemacs-width 35
        treemacs-recenter-after-project-expand 'on-distance
        treemacs-eldoc-display nil
        treemacs-collapse-dirs (if (executable-find "python") 3 0)
        treemacs-silent-refresh t
        treemacs-eldoc-display t
        treemacs-silent-filewatch t
        treemacs-change-root-without-asking t
        treemacs-sorting 'alphabetic-asc
        treemacs-show-hidden-files t
        treemacs-never-persist nil
        treemacs-is-never-other-window t
        treemacs-user-mode-line-format 'none)

  (treemacs-git-mode 'extended)
  (treemacs-hide-gitignored-files-mode t)
  (treemacs-fringe-indicator-mode)
  (treemacs-follow-mode t)
  (treemacs-filewatch-mode t)
  :bind
  (:map global-map
        ("M-0"   . treemacs-select-window)))

(use-package treemacs-evil
  :straight t
  ;; :defer t -- Do not defer
  :after (treemacs evil))

(use-package treemacs-projectile
  :straight t
  :after (treemacs projectile)
  :defer t
  :config
  (setq treemacs-project-follow-mode t))

(use-package treemacs-magit
  :straight t
  :after (treemacs magit)
  :defer t)
