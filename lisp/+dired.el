;;; +dired.el --- Dired -*- lexical-binding: t; -*-

(straight-use-package '(dired-single :host github
                                     :repo "emacsattic/dired-single"
                                     :branch "master"))

(require 'dired-single)

;; Configure dired-single keybinds
(evil-collection-define-key 'normal 'dired-mode-map
  (kbd "<return>") 'dired-single-magic-buffer
  "-" 'dired-single-up-directory
  "l" 'dired-single-buffer
  "h" 'dired-single-up-directory)
