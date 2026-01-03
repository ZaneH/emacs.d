;;; +keybindings.el -*- lexical-binding: t; -*-

;; This file sets up Doom-style keybindings using general.el
;; Based on Doom Emacs bindings but adapted for your setup

;;; General.el setup
(use-package general
  :straight t
  :demand t
  :config
  (general-create-definer my/leader
    :states '(normal visual insert emacs)
    :keymaps 'override
    :prefix "SPC"
    :global-prefix "C-SPC")

  ;; Major mode leader
  (general-create-definer my/local-leader
    :states '(normal visual)
    :keymaps 'override
    :prefix "SPC m"
    :global-prefix "C-SPC m")
  (general-define-key
   :states '(normal visual)
   :keymaps 'override
   "," (general-simulate-key "SPC m"))

  ;;; Global keybindings (non-leader)
  (general-define-key
   :states '(normal visual motion)
   ;; Smart tab behavior
   "TAB" 'evil-jump-item
   
   ;; Font scaling
   "C-=" 'text-scale-increase
   "C--" 'text-scale-decrease
   "C-+" (lambda () (interactive) (text-scale-set 0))
   
   ;; Frame fullscreen
   "C-S-f" 'toggle-frame-fullscreen

   ;; Comment
   "gcc" 'comment-line)

  ;; Minibuffer navigation
  (general-define-key
   :keymaps '(minibuffer-local-map
              minibuffer-local-ns-map
              minibuffer-local-completion-map
              minibuffer-local-must-match-map
              minibuffer-local-isearch-map)
   "C-j" 'next-line
   "C-k" 'previous-line
   "C-w" 'backward-kill-word
   "<escape>" 'abort-recursive-edit)

  ;; Mouse side buttons for navigation
  (general-define-key
   :states '(normal visual motion)
   "<mouse-8>" 'evil-jump-backward
   "<mouse-9>" 'evil-jump-forward)

  ;;; Leader key bindings
  (my/leader
    ;; Top-level bindings
    "SPC" '(helm-projectile-find-file :which-key "Find file in project")
    "."   '(helm-find-files :which-key "Find file")
    ","   '(helm-buffers-list :which-key "Switch buffer")
    "`"   '(evil-switch-to-windows-last-buffer :which-key "Last buffer")
    ";"   '(eval-expression :which-key "Eval expression")
    ":"   '(execute-extended-command :which-key "M-x")
    "u"   '(universal-argument :which-key "Universal argument")
    "h"   '(help-command :which-key "Help")

    ;;; <leader> & --- snippets
    "&"    '(:ignore t :which-key "snippets")
    "&n"   '(yas-new-snippet :which-key "New snippet")
    "&i"   '(yas-insert-snippet :which-key "Snippet")
    "&/"   '(yas-visit-snippet-file :which-key "Find global snippet")
    "&r"   '(yas-reload-all :which-key "Reload snippets")
    "&c"   '(aya-create :which-key "Create Temp Template")
    "&e"   '(aya-expand :which-key "Use Temp Template")

    ;;; <leader> a --- activities
    "a"   '(:ignore t :which-key "activities")
    "aa"  '(activities-resume :which-key "Resume activity")
    "ac"  '(activities-new :which-key "Create activity")
    "ad"  '(activities-define :which-key "Define activity")
    "az"  '(activities-suspend :which-key "Suspend activity")
    "ak"  '(activities-kill :which-key "Kill activity")
    "as"  '(activities-switch :which-key "Switch activity")
    "ab"  '(activities-switch-buffer :which-key "Switch buffer")
    "ag"  '(activities-revert :which-key "Revert to default")
    "al"  '(activities-list :which-key "List activities")
    "aR"  '(activities-rename :which-key "Rename activity")
    "ax"  '(activities-discard :which-key "Discard activity")
    
    ;;; <leader> b --- buffer
    "b"   '(:ignore t :which-key "buffer")
    "bb"  '(helm-buffers-list :which-key "Switch buffer")
    "bB"  '(switch-to-buffer :which-key "Switch buffer (no helm)")
    "bd"  '(kill-current-buffer :which-key "Kill buffer")
    "bk"  '(kill-current-buffer :which-key "Kill buffer")
    "bK"  '(kill-matching-buffers :which-key "Kill matching buffers")
    "bi"  '(ibuffer :which-key "ibuffer")
    "bn"  '(next-buffer :which-key "Next buffer")
    "bp"  '(previous-buffer :which-key "Previous buffer")
    "b["  '(previous-buffer :which-key "Previous buffer")
    "b]"  '(next-buffer :which-key "Next buffer")
    "bN"  '(evil-buffer-new :which-key "New empty buffer")
    "br"  '(revert-buffer :which-key "Revert buffer")
    "bR"  '(rename-buffer :which-key "Rename buffer")
    "bs"  '(basic-save-buffer :which-key "Save buffer")
    "bS"  '(save-some-buffers :which-key "Save all buffers")
    "bz"  '(bury-buffer :which-key "Bury buffer")
    "bx"  '(scratch-buffer :which-key "Scratch buffer")
    
    ;;; <leader> c --- code
    "c"   '(:ignore t :which-key "code")
    "ca"  '(lsp-execute-code-action :which-key "Code action")
    "cc"  '(compile :which-key "Compile")
    "cC"  '(recompile :which-key "Recompile")
    "cd"  '(lsp-find-definition :which-key "Find definition")
    "cD"  '(lsp-find-references :which-key "Find references")
    "cf"  '(lsp-format-buffer :which-key "Format buffer")
    "ci"  '(lsp-find-implementation :which-key "Find implementation")
    "cj"  '(lsp-ui-imenu :which-key "Jump to symbol")
    "ck"  '(lsp-describe-thing-at-point :which-key "Documentation")
    "cl"  '(lsp-command-map :which-key "LSP")
    "cr"  '(lsp-rename :which-key "Rename")
    "ct"  '(lsp-find-type-definition :which-key "Type definition")
    "cx"  '(flycheck-list-errors :which-key "List errors")
    
    ;;; <leader> f --- file
    "f"   '(:ignore t :which-key "file")
    "ff"  '(helm-find-files :which-key "Find file")
    "fF"  '(find-file-other-window :which-key "Find file other window")
    "fr"  '(helm-recentf :which-key "Recent files")
    "fs"  '(save-buffer :which-key "Save file")
    "fS"  '(write-file :which-key "Save as...")
    "fd"  '(dired :which-key "Open dired")
    "fD"  '(dired-jump :which-key "Dired jump")
    ;; TODO: Add custom functions for these when needed:
    ;; "fR"  '(doom/move-this-file :which-key "Rename/move file")
    ;; "fC"  '(doom/copy-this-file :which-key "Copy file")
    ;; "fy"  '(+default/yank-buffer-path :which-key "Yank file path")
    
    ;;; <leader> g --- git/magit
    "g"   '(:ignore t :which-key "git")
    "gg"  '(magit-status :which-key "Magit status")
    "gG"  '(magit-status-here :which-key "Magit status here")
    "gB"  '(magit-blame-addition :which-key "Magit blame")
    "gb"  '(magit-branch-checkout :which-key "Switch branch")
    "gc"  '(magit-clone :which-key "Clone")
    "gd"  '(magit-diff :which-key "Diff")
    "gD"  '(magit-file-delete :which-key "Delete file")
    "gf"  '(magit-find-file :which-key "Find file")
    "gF"  '(magit-fetch :which-key "Fetch")
    "gL"  '(magit-log-buffer-file :which-key "Log buffer file")
    "gp"  '(magit-pull :which-key "Pull")
    "gP"  '(magit-push :which-key "Push")
    "gr"  '(magit-rebase :which-key "Rebase")
    "gR"  '(vc-revert :which-key "Revert file")
    "gs"  '(magit-stage :which-key "Stage file")
    "gS"  '(magit-stage-modified :which-key "Stage modified")
    "gt"  '(git-timemachine-toggle :which-key "Time machine")
    "gu"  '(magit-unstage :which-key "Unstage file")
    "g/"  '(magit-dispatch :which-key "Magit dispatch")
    "g."  '(magit-file-dispatch :which-key "File dispatch")
    "g'"  '(forge-dispatch :which-key "Forge dispatch")
    "go"  '(:ignore t :which-key "open in browser")
    "gor" '(forge-browse-remote :which-key "Browse remote")
    "goc" '(forge-browse-commit :which-key "Browse commit")
    "goi" '(forge-browse-issue :which-key "Browse issue")
    "gop" '(forge-browse-pullreq :which-key "Browse pull request")
    "goI" '(forge-browse-issues :which-key "Browse issues")
    "goP" '(forge-browse-pullreqs :which-key "Browse pull requests")
    "gl"  '(:ignore t :which-key "list")
    "glr" '(magit-list-repositories :which-key "List repositories")
    "gls" '(magit-list-submodules :which-key "List submodules")
    "gli" '(forge-list-issues :which-key "List issues")
    "glp" '(forge-list-pullreqs :which-key "List pull requests")
    "gln" '(forge-list-notifications :which-key "List notifications")
    "gC"  '(:ignore t :which-key "create")
    "gCr" '(magit-init :which-key "Initialize repo")
    "gCR" '(magit-clone :which-key "Clone repo")
    "gCc" '(magit-commit-create :which-key "Commit")
    "gCf" '(magit-commit-fixup :which-key "Fixup")
    "gCF" '(magit-commit-instant-fixup :which-key "Instant fixup")
    "gCb" '(magit-branch-and-checkout :which-key "Branch")
    "gCi" '(forge-create-issue :which-key "Create issue")
    "gCp" '(forge-create-pullreq :which-key "Create pull request")

    ;;; <leader> h --- help
    "h"   '(:ignore t :which-key "help")
    
    ;;; <leader> i --- insert
    "i"   '(:ignore t :which-key "insert")
    "if"  '(insert-file :which-key "Insert file")
    "ir"  '(evil-show-registers :which-key "From register")
    "iy"  '(yank-pop :which-key "From kill ring")
    "is"  '(yas-insert-snippet :which-key "Snippet")
    
    ;;; <leader> o --- open
    "o"   '(:ignore t :which-key "open")
    "oaa" '(org-agenda :which-key "Agenda")
    "oat" '(org-todo-list :which-key "Todo list")
    "oav" '(org-search-view :which-key "View search")
    "oam" '(org-tags-view :which-key "Tags search")
    "op"  '(treemacs :which-key "Project sidebar")
    "oP"  '(treemacs-find-file :which-key "Find in sidebar")
    "ot"  '(vterm-toggle :which-key "Toggle terminal")
    "oT"  '(vterm :which-key "New terminal")
    "o-"  '(dired-jump :which-key "Dired")
    "oD"  '(docker :which-key "Docker")
    "of"  '(make-frame :which-key "New frame")

    ;;; <leader> o --- open llm
    "oll" '(gptel :which-key "Open gptel")
    "olm" '(gptel-menu :which-key "Open gptel menu")
    "ola" '(gptel-add :which-key "Add text to context")
    "olf" '(gptel-add-file :which-key "Add file to context")
    "ols" '(gptel-send :which-key "Send to gptel")
    
    ;;; <leader> p --- project
    "p"   '(:ignore t :which-key "project")
    "pp"  '(helm-projectile-switch-project :which-key "Switch project")
    "pf"  '(helm-projectile-find-file :which-key "Find file")
    "pb"  '(helm-projectile-switch-to-buffer :which-key "Switch buffer")
    "pr"  '(helm-projectile-recentf :which-key "Recent files")
    "pd"  '(helm-projectile-find-dir :which-key "Find directory")
    "pk"  '(projectile-kill-buffers :which-key "Kill buffers")
    "ps"  '(projectile-save-project-buffers :which-key "Save buffers")
    "pi"  '(projectile-invalidate-cache :which-key "Invalidate cache")
    "pc"  '(projectile-compile-project :which-key "Compile")
    "pC"  '(projectile-configure-project :which-key "Configure")
    "pt"  '(projectile-test-project :which-key "Test")
    "pR"  '(projectile-run-project :which-key "Run")
    "p!"  '(projectile-run-shell-command-in-root :which-key "Run command")
    "p&"  '(projectile-run-async-shell-command-in-root :which-key "Async command")
    
    ;;; <leader> q --- quit/session
    "q"   '(:ignore t :which-key "quit/session")
    "qq"  '(save-buffers-kill-terminal :which-key "Quit Emacs")
    "qQ"  '(evil-quit-all :which-key "Quit without saving")
    "qK"  '(save-buffers-kill-emacs :which-key "Kill Emacs and daemon")
    "qf"  '(delete-frame :which-key "Delete frame")
    "qr"  '(restart-emacs :which-key "Restart Emacs")
    
    ;;; <leader> s --- search
    "s"   '(:ignore t :which-key "search")
    "sb"  '(helm-occur :which-key "Search buffer")
    "ss"  '(helm-occur :which-key "Search buffer")
    "sp"  '(helm-projectile-ag :which-key "Search project")
    "sP"  '(helm-rg :which-key "Search with ripgrep")
    "sd"  '(helm-do-grep-ag :which-key "Search directory")
    "sm"  '(bookmark-jump :which-key "Jump to bookmark")
    "sM"  '(bookmark-set :which-key "Set bookmark")
    "sj"  '(evil-show-jumps :which-key "Jump list")
    "sr"  '(evil-show-marks :which-key "Show marks")
    
    ;;; <leader> t --- toggle
    "t"   '(:ignore t :which-key "toggle")
    "tf"  '(flycheck-mode :which-key "Flycheck")
    "tF"  '(toggle-frame-fullscreen :which-key "Fullscreen")
    "tl"  '(display-line-numbers-mode :which-key "Line numbers")
    "tr"  '(read-only-mode :which-key "Read-only")
    "tv"  '(visible-mode :which-key "Visible mode")
    "tw"  '(visual-line-mode :which-key "Wrap lines")
    "tt"  '(treemacs :which-key "Treemacs")
    "tu"  '(vundo :which-key "Undo tree")
    
    ;;; <leader> w --- window
    "w"   '(:ignore t :which-key "window")
    "ww"  '(ace-window :which-key "Select window")
    "wd"  '(delete-window :which-key "Delete window")
    "wD"  '(delete-other-windows :which-key "Delete other windows")
    "ws"  '(split-window-below :which-key "Split below")
    "wv"  '(split-window-right :which-key "Split right")
    "wh"  '(evil-window-left :which-key "Window left")
    "wj"  '(evil-window-down :which-key "Window down")
    "wk"  '(evil-window-up :which-key "Window up")
    "wl"  '(evil-window-right :which-key "Window right")
    "wH"  '(evil-window-move-far-left :which-key "Move far left")
    "wJ"  '(evil-window-move-very-bottom :which-key "Move far down")
    "wK"  '(evil-window-move-very-top :which-key "Move far up")
    "wL"  '(evil-window-move-far-right :which-key "Move far right")
    "w="  '(balance-windows :which-key "Balance windows")
    "wm"  '(delete-other-windows :which-key "Maximize window")
    "w+"  '(evil-window-increase-height :which-key "Increase height")
    "w-"  '(evil-window-decrease-height :which-key "Decrease height")
    "w>"  '(evil-window-increase-width :which-key "Increase width")
    "w<"  '(evil-window-decrease-width :which-key "Decrease width"))

  ;;; Evil-mc keybindings (multiple cursors)
  (my/leader
    :prefix "gz"
    :states '(normal visual)
    "d" '(evil-mc-make-and-goto-next-match :which-key "Next match")
    "D" '(evil-mc-make-and-goto-prev-match :which-key "Prev match")
    "s" '(evil-mc-skip-and-goto-next-match :which-key "Skip next")
    "S" '(evil-mc-skip-and-goto-prev-match :which-key "Skip prev")
    "c" '(evil-mc-skip-and-goto-next-cursor :which-key "Next cursor")
    "C" '(evil-mc-skip-and-goto-prev-cursor :which-key "Prev cursor")
    "j" '(evil-mc-make-cursor-move-next-line :which-key "Cursor next line")
    "k" '(evil-mc-make-cursor-move-prev-line :which-key "Cursor prev line")
    "m" '(evil-mc-make-all-cursors :which-key "All cursors")
    "n" '(evil-mc-make-and-goto-next-cursor :which-key "Next cursor")
    "N" '(evil-mc-make-and-goto-last-cursor :which-key "Last cursor")
    "p" '(evil-mc-make-and-goto-prev-cursor :which-key "Prev cursor")
    "P" '(evil-mc-make-and-goto-first-cursor :which-key "First cursor")
    "q" '(evil-mc-undo-all-cursors :which-key "Undo all")
    "u" '(evil-mc-undo-last-added-cursor :which-key "Undo last")
    "z" '(evil-mc-toggle-cursor-here :which-key "Toggle here"))

  ;; Alternative multiple cursor bindings in visual mode
  (general-define-key
   :states 'visual
   "M-d" 'evil-mc-make-and-goto-next-match
   "M-D" 'evil-mc-make-and-goto-prev-match)

  ;;; Helm-specific bindings
  (with-eval-after-load 'helm
    (general-define-key
     :keymaps 'helm-map
     "C-j" 'helm-next-line
     "C-k" 'helm-previous-line
     "C-h" 'helm-next-source
     "C-l" 'helm-previous-source
     "TAB" 'helm-execute-persistent-action
     "C-z" 'helm-select-action)
    
    (general-define-key
     :keymaps 'helm-find-files-map
     "C-h" 'helm-find-files-up-one-level
     "C-l" 'helm-execute-persistent-action))

  ;;; Completion (Corfu) bindings
  (with-eval-after-load 'corfu
    (general-define-key
     :keymaps 'corfu-map
     "C-j" 'corfu-next
     "C-k" 'corfu-previous
     "C-SPC" 'corfu-insert-separator
     "TAB" 'corfu-insert
     "RET" 'corfu-insert))

  ;; Bind C-SPC to open completion menu
  (setq set-mark-command-repeat-pop t)
  (global-unset-key (kbd "C-SPC"))
  (global-unset-key (kbd "C-@"))

  (general-define-key
   :states '(insert)
   :keymaps 'override
   "C-SPC" #'completion-at-point
   "C-@"   #'completion-at-point)

  ;;; Additional projectile configuration
  ;; Make projectile use ripgrep/ag for searching
  (with-eval-after-load 'projectile
    (setq projectile-enable-caching t
          projectile-indexing-method 'hybrid  ; Faster for large projects
          projectile-sort-order 'recentf
          projectile-globally-ignored-directories
          (append '(".git" "node_modules" ".cache" "target" "build" "dist")
                  projectile-globally-ignored-directories)))

  (with-eval-after-load 'markdown-mode
    (my/local-leader
      :keymaps 'markdown-mode-map
      "'" '(markdown-edit-code-block :which-key "Edit code block")
      "o" '(markdown-open :which-key "Open")
      "p" '(markdown-preview :which-key "Preview")
      "e" '(markdown-export :which-key "Export")
      
      "i" '(:ignore t :which-key "insert")
      "iT" '(markdown-toc-generate-toc :which-key "Table of contents")
      "ii" '(markdown-insert-image :which-key "Image")
      "il" '(markdown-insert-link :which-key "Link")
      "i-" '(markdown-insert-hr :which-key "<hr>")
      "it" '(markdown-insert-table :which-key "Table")
      
      "t" '(:ignore t :which-key "toggle")
      "ti" '(markdown-toggle-inline-images :which-key "Inline images")
      "tl" '(markdown-toggle-url-hiding :which-key "URL hiding")
      "tm" '(markdown-toggle-markup-hiding :which-key "Markup hiding")))

  (with-eval-after-load 'go-mode
    (my/local-leader
      :keymaps 'go-mode-map
      "=" '(gofmt :which-key "Format")
      "i" '(go-goto-imports :which-key "Goto imports")
      "d" '(godoc-at-point :which-key "Godoc at point")
      
      "a" '(lsp-execute-code-action :which-key "Code action")
      "r" '(lsp-rename :which-key "Rename")
      
      "t" '(:ignore t :which-key "test")
      "tt" '((lambda () (interactive) (compile "go test -v")) :which-key "Test all")
      "tf" '((lambda () (interactive) (compile (format "go test -v %s" buffer-file-name))) :which-key "Test file")
      
      "b" '(:ignore t :which-key "build")
      "bb" '((lambda () (interactive) (compile "go build")) :which-key "Build")
      "br" '((lambda () (interactive) (compile "go run .")) :which-key "Run")))

  ;; Super agenda header navigation
  (general-def org-super-agenda-header-map
    "k" #'org-agenda-prevous-line
    "j" #'org-agenda-next-line)

  (general-define-key
   "M-=" 'evil-numbers/inc-at-pt
   "M--" 'evil-numbers/dec-at-pt))

(provide '+keybindings)
;;; +keybindings.el ends here
