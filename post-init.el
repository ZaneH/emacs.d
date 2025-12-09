;;; post-init.el --- Post Init -*- lexical-binding: t; -*-

;; Probably a security issue
(setq package-check-signature nil)

(add-to-list 'load-path "~/.emacs.d/lisp")
(load "+compile-angel.el")

(load "+straight.el")
(load "+general.el")
(load "+icons.el")
(load "+dashboard.el")
(load "+theme.el")
(load "+copilot.el")
(load "+gptel.el")
(load "+term.el")
(load "+evil.el")
(load "+projectile.el")
(load "+helm.el")
(load "+magit.el")
(load "+hl-todo.el")
(load "+flycheck.el")
(load "+which-key.el")
(load "+treemacs.el")
(load "+mode-line.el")
(load "+ace-window.el")
(load "+tree-sitter.el")

(load "secrets.el")
