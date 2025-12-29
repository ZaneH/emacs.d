;;; +yasnippet.el --- Yasnippet -*- lexical-binding: t; -*-

(use-package yasnippet
  :defer t
  :ensure t
  :config
  (yas-reload-all)
  (yas-global-mode)

  ;; Disable ancient React snippets
  (add-hook 'rjsx-mode-hook
            (lambda ()
              (yas-minor-mode -1)))
  )

(use-package yasnippet-snippets
  :defer t
  :ensure t
  :after yasnippet
  :config
  (yasnippet-snippets-initialize))

(use-package auto-yasnippet
  :defer t
  :after yasnippet)
