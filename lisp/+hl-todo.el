;;; +hl-todo.el --- Highlight Todo -*- lexical-binding: t; -*-

(use-package hl-todo
  :straight t
  ;; :defer t -- Do not defer
  :after magit
  :config
  (add-hook 'magit-log-wash-summary-hook
            #'hl-todo-search-and-highlight t)
  (add-hook 'magit-revision-wash-message-hook
            #'hl-todo-search-and-highlight t))
