;;; +git-timemachine.el --- Git Time Machine -*- lexical-binding: t; -*-

(use-package git-timemachine
  :straight t
  :defer t)

;; @see https://emacs.stackexchange.com/questions/9842/disable-evil-mode-when-git-timemachine-mode-is-activated
(eval-after-load 'git-timemachine
  '(progn
     (evil-make-overriding-map git-timemachine-mode-map 'normal)
     (add-hook 'git-timemachine-mode-hook #'evil-normalize-keymaps)))
