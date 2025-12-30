;;; +dashboard.el --- Dashboard -*- lexical-binding: t; -*-

(use-package dashboard
  :straight t
  :config
  (dashboard-setup-startup-hook)

  (add-hook 'server-after-make-frame-hook
            (lambda ()
              (when (and (string-equal (buffer-name) "*scratch*")
                         (not (minibufferp))
                         (not (derived-mode-p 'magit-mode)))
                (dashboard-open)
                (dashboard-refresh-buffer)))))

(setq dashboard-center-content t)
(setq dashboard-vertically-center-content t)

(setq dashboard-items '((recents   . 5)
                        (projects  . 5)
                        (agenda    . 5)))
