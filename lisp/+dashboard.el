;;; +dashboard.el --- Dashboard -*- lexical-binding: t; -*-

(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook)
  (add-hook 'server-after-make-frame-hook
            (lambda ()
              (when (display-graphic-p)
                (dashboard-refresh-buffer))))
  )

(setq dashboard-center-content t)
(setq dashboard-vertically-center-content t)

(setq dashboard-items '((recents   . 5)
                        (projects  . 5)
                        (agenda    . 5)))
