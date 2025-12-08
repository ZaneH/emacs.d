;;; post-init.el --- Post Init -*- lexical-binding: t; -*-

;; Probably a security issue
(setq package-check-signature nil)

(add-to-list 'load-path "~/.emacs.d/")
(load "+dashboard.el")
(load "+theme.el")
(load "+copilot.el")
(load "+gptel.el")
(load "+term.el")
(load "+evil.el")
(load "+projectile.el")
(load "+helm.el")
(load "+icons.el")
(load "+magit.el")
(load "+hl-todo.el")
(load "+flycheck.el")
(load "+general.el")
(load "+which-key.el")
(load "+treemacs.el")
