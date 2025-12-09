;;; +projectile.el --- Projectile -*- lexical-binding: t; -*-

(use-package projectile
  :config
  (add-hook 'dired-mode-hook 'all-the-icons-dired-mode)
  (setq projectile-completion-system 'helm)

  (setq projectile-project-search-path '("~/repos/personal/"
                                         "~/repos/personal/contrib/"
                                         "~/repos/org/roam/"
                                         "~/repos/scrap/"
                                         "~/repos/work/"))
  :init
  (projectile-mode +1)
)

(my/leader
  "p"   '(:ignore t :which-key "project")
  "pf"  '(projectile-find-file :which-key "Find file")
  "pp"  '(projectile-switch-project :which-key "Switch project"))
