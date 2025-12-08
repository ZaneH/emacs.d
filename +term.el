;;; +term.el --- VTerm -*- lexical-binding: t; -*-

(use-package vterm
  :ensure t)

(use-package vterm-toggle
  :after (vterm)
  :config
  (setq vterm-toggle-fullscreen-p nil)
  (add-to-list 'display-buffer-alist
               '((lambda (buffer-or-name _)
                   (let ((buffer (get-buffer buffer-or-name)))
                     (with-current-buffer buffer
                       (or (equal major-mode 'vterm-mode)
                           (string-prefix-p vterm-buffer-name (buffer-name buffer))))))
                 (display-buffer-reuse-window display-buffer-at-bottom)
                 (reusable-frames . visible)
                 (window-height . 0.3)))
  )

(my/leader
  "o"  '(:ignore t :which-key "open")
  "ot" '(vterm-toggle :which-key "Toggle vterm"))
