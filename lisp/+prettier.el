;;; +prettier.el --- Prettier -*- lexical-binding: t; -*-

(use-package prettier-js
  :defer t
  :config
  (setq prettier-js-command "prettierd")
  :hook ((typescript-ts-mode . prettier-js-mode)
         (js-ts-mode         . prettier-js-mode)
         (web-mode           . prettier-js-mode)
         (tsx-ts-mode        . prettier-js-mode)
         ))
