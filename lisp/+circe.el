;;; +circe.el --- Circe (IRC) -*- lexical-binding: t; -*-

(use-package circe
  :straight t
  :defer t
  :init
  (enable-circe-color-nicks)
  (enable-circe-display-images)
  (enable-lui-track-bar)
  (enable-lui-irc-colors)
  :config
  (setq lui-flyspell-p t
        lui-flyspell-alist '((".*" "american")))
  (setq helm-mode-no-completion-in-region-in-modes
        '(circe-channel-mode
          circe-query-mode
          circe-server-mode))
  (setq circe-use-cycle-completion t)
  (setq circe-reduce-lurker-spam t))
