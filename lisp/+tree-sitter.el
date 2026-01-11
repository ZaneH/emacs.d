;;; +tree-sitter.el --- Parsing of languages -*- lexical-binding: t; -*-

(use-package nix-ts-mode
  :straight t
  :mode "\\.nix\\'")

(use-package treesit
  :straight (:type built-in)
  :init
  (dolist (mapping
           '((python-mode . python-ts-mode)
             (css-mode . css-ts-mode)
             (typescript-mode . typescript-ts-mode)
             (js-mode . typescript-ts-mode)
             (js2-mode . typescript-ts-mode)
             (c-mode . c-ts-mode)
             (c++-mode . c++-ts-mode)
             (c-or-c++-mode . c-or-c++-ts-mode)
             (bash-mode . bash-ts-mode)
             (json-mode . json-ts-mode)
             (js-json-mode . json-ts-mode)
             (sh-mode . bash-ts-mode)
             (sh-base-mode . bash-ts-mode)
             (nix-mode . nix-ts-mode)
             (yaml-mode . yaml-ts-mode)
             (zig-mode . zig-ts-mode)))
    (add-to-list 'major-mode-remap-alist mapping))
  
  :mode (("\\.tsx\\'" . tsx-ts-mode)
         ("\\.ts\\'"  . typescript-ts-mode)
         ("\\.js\\'"  . typescript-ts-mode)
         ("\\.mjs\\'" . typescript-ts-mode)
         ("\\.mts\\'" . typescript-ts-mode)
         ("\\.cjs\\'" . typescript-ts-mode)
         ("\\.jsx\\'" . tsx-ts-mode)
         ("\\.json\\'" .  json-ts-mode)
         ("\\.Dockerfile\\'" . dockerfile-ts-mode)
         ("\\.prisma\\'" . prisma-ts-mode)
         ("\\.go\\'" . go-ts-mode)
         ("\\.yaml\\'" . yaml-ts-mode)
         ("\\.yml\\'" . yaml-ts-mode)
         ("\\.py\\'" . python-ts-mode))
  
  :preface
  (defun os/setup-install-grammars ()
    "Install Tree-sitter grammars if they are absent."
    (interactive)
    (dolist (grammar
             '((css . ("https://github.com/tree-sitter/tree-sitter-css" "v0.25.0"))
               (bash "https://github.com/tree-sitter/tree-sitter-bash")
               (html . ("https://github.com/tree-sitter/tree-sitter-html" "v0.23.2"))
               (javascript . ("https://github.com/tree-sitter/tree-sitter-javascript" "v0.25.0" "src"))
               (json . ("https://github.com/tree-sitter/tree-sitter-json" "v0.24.8"))
               (python . ("https://github.com/tree-sitter/tree-sitter-python" "v0.25.0"))
               (go "https://github.com/tree-sitter/tree-sitter-go" "v0.25.0")
               (markdown "https://github.com/ikatyang/tree-sitter-markdown")
               (make "https://github.com/alemuller/tree-sitter-make")
               (elisp "https://github.com/Wilfred/tree-sitter-elisp")
               (cmake "https://github.com/uyha/tree-sitter-cmake")
               (c "https://github.com/tree-sitter/tree-sitter-c")
               (cpp "https://github.com/tree-sitter/tree-sitter-cpp")
               (toml "https://github.com/tree-sitter/tree-sitter-toml")
               (tsx . ("https://github.com/tree-sitter/tree-sitter-typescript" "v0.23.2" "tsx/src"))
               (typescript . ("https://github.com/tree-sitter/tree-sitter-typescript" "v0.23.2" "typescript/src"))
               (yaml . ("https://github.com/ikatyang/tree-sitter-yaml" "v0.5.0"))
               (prisma "https://github.com/victorhqc/tree-sitter-prisma")
               (nix . ("https://github.com/nix-community/tree-sitter-nix" "v0.3.0"))
               (zig "https://github.com/tree-sitter-grammars/tree-sitter-zig")))
      (add-to-list 'treesit-language-source-alist grammar)
      (unless (treesit-language-available-p (car grammar))
        (treesit-install-language-grammar (car grammar)))))
  
  :config
  (os/setup-install-grammars))
