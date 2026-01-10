;;; +pyvenv.el --- Python Virtual Environment -*- lexical-binding: t; -*-

(use-package pyvenv
  :straight t
  :defer t
  :mode ("\\.py\\'" . pyvenv-mode)
  :after lsp-mode
  :config
  (setq pyvenv-mode-line-indicator
        '(pyvenv-virtual-env-name ("[venv:" pyvenv-virtual-env-name "] "))))
