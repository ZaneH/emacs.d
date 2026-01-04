;;; +theme.el --- Theme -*- lexical-binding: t; -*-

;; Catpuccin
;; (use-package catppuccin-theme)
;; (setq catppuccin-flavor 'macchiato)
;; (load-theme 'catppuccin :no-confirm)

;; Relative line numbers
(setq-default display-line-numbers-type 'relative)
(dolist (hook '(prog-mode-hook text-mode-hook conf-mode-hook))
  (add-hook hook #'display-line-numbers-mode))

;; Set font
(set-face-attribute 'default nil :family "JetBrainsMono Nerd Font" :height 110)
(set-face-attribute 'fixed-pitch nil :family "JetBrainsMono Nerd Font" :height 110)
(set-face-attribute 'variable-pitch nil :family "JetBrainsMono Nerd Font" :height 110)

(set-face-attribute 'mode-line nil :height 110)
(set-face-attribute 'mode-line-inactive nil :height 110)

(use-package doom-themes
  :straight t
  :custom
  (doom-themes-enable-bold t)   ; if nil, bold is universally disabled
  (doom-themes-enable-italic t) ; if nil, italics is universally disabled
  (doom-themes-treemacs-theme "doom-colors") ; use "doom-colors" for less minimal icon theme
  :config
  ;; (load-theme 'doom-tokyo-night :no-confirm)
  (load-theme 'doom-badger :no-confirm)
  ;; (load-theme 'doom-challenger-deep :no-confirm)
  ;; (load-theme 'doom-bluloco-dark :no-confirm)

  (doom-themes-visual-bell-config)
  (doom-themes-treemacs-config)
  (doom-themes-org-config))

;; This can cause UI glitches (e.g. flickering)
(use-package solaire-mode
  :straight t
  :config
  (require 'solaire-mode)
  (solaire-global-mode +1))
