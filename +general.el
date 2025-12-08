;;; +general.el --- General (Improved Keybindings) -*- lexical-binding: t; -*-

(use-package general
  :config
  (general-create-definer my/leader
    :states '(normal visual emacs)
    :prefix "SPC"
    :non-normal-prefix "M-SPC")

  (my/leader
    "p"   '(:ignore t :which-key "project")
    "pf"  '(projectile-find-file :which-key "find file")
    "pp"  '(projectile-switch-project :which-key "switch project")))
