;;; +casual.el --- Casual (Keybind Help) -*- lexical-binding: t; -*-

(use-package casual
  :straight t
  :defer t
  :config
  ;; EditKit main menu
  (with-eval-after-load 'evil
    (evil-define-key '(normal insert visual) 'global (kbd "C-o") #'casual-editkit-main-tmenu))
  
  :init
  (use-package org-agenda
    :straight (:type built-in)
    :defer t
    :commands (org-agenda-clock-goto)
    :config
    (with-eval-after-load 'evil
      (evil-define-key '(normal emacs) org-agenda-mode-map (kbd "C-o") #'casual-agenda-tmenu)
      (evil-define-key '(normal emacs) org-agenda-mode-map (kbd "M-j") #'org-agenda-clock-goto)
      (evil-define-key '(normal emacs) org-agenda-mode-map (kbd "J") #'bookmark-jump)))
  
  (use-package bookmark
    :straight (:type built-in)
    :defer t
    :config
    (with-eval-after-load 'evil
      (evil-define-key '(normal emacs) bookmark-bmenu-mode-map (kbd "C-o") #'casual-bookmarks-tmenu)
      (evil-define-key '(normal emacs) bookmark-bmenu-mode-map (kbd "J") #'bookmark-jump)))
  
  (use-package calc
    :straight (:type built-in)
    :defer t
    :config
    (with-eval-after-load 'evil
      (evil-define-key '(normal emacs) calc-mode-map (kbd "C-o") #'casual-calc-tmenu)))
  
  (use-package calc-ext
    :straight (:type built-in)
    :defer t
    :config
    (with-eval-after-load 'evil
      (evil-define-key '(normal emacs) calc-alg-map (kbd "C-o") #'casual-calc-tmenu)))
  
  (use-package calendar
    :straight (:type built-in)
    :defer t
    :config
    (with-eval-after-load 'evil
      (evil-define-key '(normal emacs) calendar-mode-map (kbd "C-o") #'casual-calendar)))
  
  (use-package dired
    :straight (:type built-in)
    :defer t
    :config
    (with-eval-after-load 'evil
      (evil-define-key '(normal emacs) dired-mode-map (kbd "C-o") #'casual-dired-tmenu)
      (evil-define-key '(normal emacs) dired-mode-map (kbd "s") #'casual-dired-sort-by-tmenu)
      (evil-define-key '(normal emacs) dired-mode-map (kbd "/") #'casual-dired-search-replace-tmenu)))
  
  (use-package ibuffer
    :straight (:type built-in)
    :defer t
    :config
    (with-eval-after-load 'evil
      (evil-define-key '(normal emacs) ibuffer-mode-map (kbd "C-o") #'casual-ibuffer-tmenu)
      (evil-define-key '(normal emacs) ibuffer-mode-map (kbd "F") #'casual-ibuffer-filter-tmenu)
      (evil-define-key '(normal emacs) ibuffer-mode-map (kbd "s") #'casual-ibuffer-sortby-tmenu)
      (evil-define-key '(normal emacs) ibuffer-mode-map (kbd "{") #'ibuffer-backwards-next-marked)
      (evil-define-key '(normal emacs) ibuffer-mode-map (kbd "}") #'ibuffer-forward-next-marked)
      (evil-define-key '(normal emacs) ibuffer-mode-map (kbd "[") #'ibuffer-backward-filter-group)
      (evil-define-key '(normal emacs) ibuffer-mode-map (kbd "]") #'ibuffer-forward-filter-group)
      (evil-define-key '(normal emacs) ibuffer-mode-map (kbd "$") #'ibuffer-toggle-filter-group)))
  
  (use-package info
    :straight (:type built-in)
    :defer t
    :config
    (with-eval-after-load 'evil
      (evil-define-key '(normal emacs) Info-mode-map (kbd "C-o") #'casual-info-tmenu)
      (evil-define-key '(normal emacs) Info-mode-map (kbd "M-[") #'Info-history-back)
      (evil-define-key '(normal emacs) Info-mode-map (kbd "M-]") #'Info-history-forward)
      (evil-define-key '(normal emacs) Info-mode-map (kbd "/") #'Info-search)
      (evil-define-key '(normal emacs) Info-mode-map (kbd "B") #'bookmark-set)))
  
  (use-package isearch
    :straight (:type built-in)
    :defer t
    :config
    (with-eval-after-load 'evil
      (evil-define-key '(normal emacs) isearch-mode-map (kbd "C-o") #'casual-isearch-tmenu)))
  
  (use-package re-builder
    :straight (:type built-in)
    :defer t
    :config
    (with-eval-after-load 'evil
      (evil-define-key '(normal emacs) reb-mode-map (kbd "C-o") #'casual-re-builder-tmenu)
      (evil-define-key '(normal emacs) reb-lisp-mode-map (kbd "C-o") #'casual-re-builder-tmenu))))
