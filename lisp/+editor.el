;;; +editor.el --- Editor Config -*- lexical-binding: t; -*-

(setq-default fill-column 120
              delete-trailing-lines t)

;; Use auto-fill in these modes at 120
(dolist (hook '(text-mode-hook
                markdown-mode-hook
                org-mode-hook
                prog-mode-hook))
  (add-hook hook #'auto-fill-mode))

;; Git commit uses 72 char limit
(add-hook 'git-commit-mode-hook
          (lambda ()
            (setq fill-column 72)
            (auto-fill-mode 1)))

;; Persist entries
(server-mode +1)
(save-place-mode +1)
(savehist-mode +1)
(recentf-mode +1)

;; Smart parenthesis
(electric-pair-mode 1)

;; Required for self-signed cert (for IRC)
(setq gnutls-verify-error nil)

;; Smooth scrolling
(pixel-scroll-precision-mode +1)

;; Keep compilation window at the bottom
(setq split-height-threshold nil)
(setq split-width-threshold most-positive-fixnum)

;; Hide Warnings and Compile-Log windows (untested)
(add-to-list 'display-buffer-alist
             `(,(rx bos "*" (or "Warnings" "Compile-Log") "*" eos)
               (display-buffer-no-window)
               (allow-no-window . t)))
