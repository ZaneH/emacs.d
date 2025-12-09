;;; +general.el --- General (Improved Keybindings) -*- lexical-binding: t; -*-

(use-package general
  :config
  (general-evil-setup)
  
  (general-create-definer my/leader
    :states '(normal visual emacs)
    :keymaps 'override
    :prefix "SPC"
    :non-normal-prefix "M-SPC"))

(my/leader
    "fs" '(save-buffer :which-key "Safe buffer"))
