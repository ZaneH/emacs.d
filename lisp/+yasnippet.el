;;; +yasnippet.el --- Yasnippet -*- lexical-binding: t; -*-

(use-package yasnippet
  :straight t
  :defer t
  :config
  (yas-reload-all)
  (yas-global-mode)

  ;; Disable ancient React snippets
  (add-hook 'rjsx-mode-hook
            (lambda ()
              (yas-minor-mode -1))))

(use-package yasnippet-snippets
  :straight t
  :defer t
  :after yasnippet
  :config
  (yasnippet-snippets-initialize))

(use-package auto-yasnippet
  :straight t
  :defer t
  :after yasnippet)
