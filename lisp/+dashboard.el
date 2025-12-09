;;; +dashboard.el --- Dashboard -*- lexical-binding: t; -*-

(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook))

(setq dashboard-center-content t)
(setq dashboard-vertically-center-content t)

(setq dashboard-items '((recents   . 5)
                        (projects  . 5)
                        (agenda    . 5)))
