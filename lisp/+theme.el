;;; +theme.el --- Theme -*- lexical-binding: t; -*-

;; Catpuccin
;; (use-package catppuccin-theme)
;; (setq catppuccin-flavor 'macchiato)
;; (load-theme 'catppuccin :no-confirm)

;; Set font
(set-frame-font "JetBrainsMono Nerd Font 11" nil t)
;; Relative line numbers
(setq-default display-line-numbers-type 'relative)
(dolist (hook '(prog-mode-hook text-mode-hook conf-mode-hook))
  (add-hook hook #'display-line-numbers-mode))
  
(use-package doom-themes
  :ensure t
  :custom
  (doom-themes-enable-bold t)   ; if nil, bold is universally disabled
  (doom-themes-enable-italic t) ; if nil, italics is universally disabled
  (doom-themes-treemacs-theme "doom-colors") ; use "doom-colors" for less minimal icon theme
  :config
  (load-theme 'doom-tokyo-night :no-confirm)

  (doom-themes-visual-bell-config)
  (doom-themes-treemacs-config)
  (doom-themes-org-config))
