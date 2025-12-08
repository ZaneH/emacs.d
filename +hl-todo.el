;;; +hl-todo.el --- Highlight Todo -*- lexical-binding: t; -*-

(use-package hl-todo)

;; Enable highlighting in Magit
(with-eval-after-load 'magit
  (add-hook 'magit-log-wash-summary-hook
            #'hl-todo-search-and-highlight t)
  (add-hook 'magit-revision-wash-message-hook
            #'hl-todo-search-and-highlight t))