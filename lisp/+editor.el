;;; +editor.el --- Editor Config -*- lexical-binding: t; -*-

(setq-default fill-column 120
              delete-trailing-lines t)

;; Use auto-fill in these modes at 120
(dolist (hook '(text-mode-hook
                markdown-mode-hook
                org-mode-hook
                prog-mode-hook))
  (add-hook hook #'auto-fill-mode))

;; Git commit uses 72 char limit
(add-hook 'git-commit-mode-hook
          (lambda ()
            (setq fill-column 72)
            (auto-fill-mode 1)))

;; Persist entries
(server-mode +1)
(save-place-mode +1)
(savehist-mode +1)
(recentf-mode +1)

;; Smart parenthesis
(electric-pair-mode 1)
