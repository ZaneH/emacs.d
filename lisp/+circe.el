;;; +circe.el --- Circe (IRC) -*- lexical-binding: t; -*-

(use-package circe
  :straight t
  :defer t
  :init
  (enable-circe-color-nicks)
  (enable-circe-display-images)
  (enable-lui-track-bar)
  (enable-lui-irc-colors))
