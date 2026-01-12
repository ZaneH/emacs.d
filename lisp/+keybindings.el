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
   "<backtab>" 'hs-show-all
   
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
    "SPC" '(project-find-file :which-key "Find file in project")
    "."   '(find-file :which-key "Find file")
    ","   '(helm-buffers-list :which-key "Switch buffer")
    "`"   '(evil-switch-to-windows-last-buffer :which-key "Last buffer")
    ";"   '(eval-expression :which-key "Eval expression")
    ":"   '(execute-extended-command :which-key "M-x")
    "u"   '(universal-argument :which-key "Universal argument")
    "h"   '(help-command :which-key "Help")
    "/"   '(helm-rg :which-key "Search project")

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
    "cX"  '(lsp-treemacs-errors-list :which-key "Errors list")

    ;;; <leader> d --- debugger
    "d"   '(:ignore t :which-key "debugger")
    "dd"  '(dape :which-key "Open Dape")
    "dp"  '(dape-pause :which-key "Pause")
    "dc"  '(dape-continue :which-key "Continue")
    "dn"  '(dape-next :which-key "Next")
    "ds"  '(dape-step-in :which-key "Step In")
    "do"  '(dape-step-out :which-key "Step Out")
    "dr"  '(dape-restart :which-key "Restart")
    "di"  '(dape-info :which-key "Info")
    "dR"  '(dape-repl :which-key "REPL")
    "dm"  '(dape-memory :which-key "Memory")
    "dM"  '(dape-disassemble :which-key "Disassemble")
    "dl"  '(dape-breakpoint-log :which-key "Log Breakpoint")
    "de"  '(dape-breakpoint-expression :which-key "Expression Breakpoint")
    "dh"  '(dape-breakpoint-hits :which-key "Breakpoint Hits")
    "db"  '(dape-breakpoint-toggle :which-key "Toggle Breakpoint")
    "dB"  '(dape-breakpoint-remove-all :which-key "Remove All Breakpoints")
    "dt"  '(dape-select-thread :which-key "Select Thread")
    "dS"  '(dape-select-stack :which-key "Select Stack")
    "d>"  '(dape-stack-select-down :which-key "Stack Down")
    "d<"  '(dape-stack-select-up :which-key "Stack Up")
    "dx"  '(dape-evaluate-expression :which-key "Evaluate Expression")
    "dw"  '(dape-watch-dwim :which-key "Watch DWIM")
    "dD"  '(dape-disconnect-quit :which-key "Disconnect & Quit")
    "dq"  '(dape-quit :which-key "Quit")
    
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
    "hd"   '(devdocs-lookup :which-key "Devdocs lookup")
    "hD"   '(+my/devdocs-choose :which-key "Devdocs choose")
    
    ;;; <leader> i --- insert
    "i"   '(:ignore t :which-key "insert")
    "if"  '(insert-file :which-key "Insert file")
    "ir"  '(evil-show-registers :which-key "From register")
    "iy"  '(yank-pop :which-key "From kill ring")
    "is"  '(yas-insert-snippet :which-key "Snippet")

    ;;; <leader> I --- IRC
    "I"   '(:ignore t :which-key "irc")
    "Io"  '(circe :which-key "Open Circe")
    "Ir"  '(circe-reconnect :which-key "Reconnect to server")

    ;;; <leader> n --- notes
    "n"   '(:ignore t :which-key "notes")
    "na"  '(org-agenda :which-key "Org agenda")
    "nl"  '(org-store-link :which-key "Org store link")
    "nn"  '(org-capture :which-key "Org capture")
    "nN"  '(org-capture-goto-target :which-key "Goto capture")
    "no"  '(org-clock-goto :which-key "Active org-clock")
    "nt"  '(org-todo-list :which-key "Todo list")
    "nv"  '(org-search-view :which-key "View search")
    "nr"  '(:ignore t :which-key "roam")
    "nra" '(org-roam-node-random :which-key "Open random node")
    "nrf" '(org-roam-node-find :which-key "Find node")
    "nrF" '(org-roam-ref-find :which-key "Find ref")
    "nrg" '(org-roam-graph :which-key "Show graph")
    "nri" '(org-roam-node-insert :which-key "Insert node")
    "nrn" '(org-roam-capture :which-key "Capture to node")
    "nrr" '(org-roam-buffer-toggle :which-key "Toggle roam buffer")
    "nrR" '(org-roam-buffer-display-dedicated :which-key "Launch roam buffer")
    "nrs" '(org-roam-db-sync :which-key "Sync database")
    
    ;;; <leader> o --- open
    "o"   '(:ignore t :which-key "open")
    "oaa" '(org-agenda :which-key "Agenda")
    "oat" '(org-todo-list :which-key "Todo list")
    "op"  '(+my/treemacs-toggle :which-key "Project sidebar")
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
    
    ;;; <leader> q --- quit/session
    "q"   '(:ignore t :which-key "quit/session")
    "qq"  '(save-buffers-kill-terminal :which-key "Quit Emacs")
    "qQ"  '(evil-quit-all :which-key "Quit without saving")
    "qK"  '(save-buffers-kill-emacs :which-key "Kill Emacs and daemon")
    "qf"  '(delete-frame :which-key "Delete frame")
    "qr"  '(restart-emacs :which-key "Restart Emacs")
    
    ;;; <leader> s --- search
    "s"   '(:ignore t :which-key "search")
    "sb"  '(swiper :which-key "Search buffer")
    "sB"  '(swiper-all :which-key "Search all open buffers")
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

  (with-eval-after-load 'org
    ;; Global org-mode keybindings
    (general-define-key
     :keymaps 'org-mode-map
     "C-c C-S-l" '+org/remove-link
     "C-c C-i" 'org-toggle-inline-images
     "S-RET" '+org/shift-return
     "C-RET" '+org/insert-item-below
     "C-S-RET" '+org/insert-item-above
     "C-M-RET" 'org-insert-subheading
     [C-return] '+org/insert-item-below
     [C-S-return] '+org/insert-item-above
     [C-M-return] 'org-insert-subheading
     [remap beginning-of-line] 'org-beginning-of-line
     [remap end-of-line] 'org-end-of-line)
    
    ;; macOS-specific bindings
    (when (eq system-type 'darwin)
      (general-define-key
       :keymaps 'org-mode-map
       [s-return] '+org/insert-item-below
       [s-S-return] '+org/insert-item-above
       [s-M-return] 'org-insert-subheading))
    
    (my/local-leader
      :keymaps 'org-mode-map
      "#" '(org-update-statistics-cookies :which-key "Update statistics")
      "'" '(org-edit-special :which-key "Edit special")
      "*" '(org-ctrl-c-star :which-key "Turn to heading")
      "-" '(org-ctrl-c-minus :which-key "Turn to item")
      "," '(org-switchb :which-key "Switch buffer")
      "." '(org-goto :which-key "Goto")
      "@" '(org-cite-insert :which-key "Insert citation")
      "A" '(org-archive-subtree-default :which-key "Archive subtree")
      "e" '(org-export-dispatch :which-key "Export")
      "f" '(org-footnote-action :which-key "Footnote")
      "h" '(org-toggle-heading :which-key "Toggle heading")
      "i" '(org-toggle-item :which-key "Toggle item")
      "I" '(org-id-get-create :which-key "Get/create ID")
      "k" '(org-babel-remove-result :which-key "Remove result")
      "n" '(org-store-link :which-key "Store link")
      "o" '(org-set-property :which-key "Set property")
      "q" '(org-set-tags-command :which-key "Set tags")
      "t" '(org-todo :which-key "Todo")
      "T" '(org-todo-list :which-key "Todo list")
      "x" '(org-toggle-checkbox :which-key "Toggle checkbox")
      
      "a" '(:ignore t :which-key "attachments")
      "aa" '(org-attach :which-key "Attach")
      "ad" '(org-attach-delete-one :which-key "Delete one")
      "aD" '(org-attach-delete-all :which-key "Delete all")
      "af" '(+org/find-file-in-attachments :which-key "Find file")
      "an" '(org-attach-new :which-key "New")
      "ao" '(org-attach-open :which-key "Open")
      "aO" '(org-attach-open-in-emacs :which-key "Open in Emacs")
      "ar" '(org-attach-reveal :which-key "Reveal")
      "aR" '(org-attach-reveal-in-emacs :which-key "Reveal in Emacs")
      "au" '(org-attach-url :which-key "Attach URL")
      "as" '(org-attach-set-directory :which-key "Set directory")
      "aS" '(org-attach-sync :which-key "Sync")
      
      "b" '(:ignore t :which-key "tables")
      "b-" '(org-table-insert-hline :which-key "Insert hline")
      "ba" '(org-table-align :which-key "Align")
      "bb" '(org-table-blank-field :which-key "Blank field")
      "bc" '(org-table-create-or-convert-from-region :which-key "Create/convert")
      "be" '(org-table-edit-field :which-key "Edit field")
      "bf" '(org-table-edit-formulas :which-key "Edit formulas")
      "bh" '(org-table-field-info :which-key "Field info")
      "bs" '(org-table-sort-lines :which-key "Sort lines")
      "br" '(org-table-recalculate :which-key "Recalculate")
      "bR" '(org-table-recalculate-buffer-tables :which-key "Recalculate buffer")
      
      "bd" '(:ignore t :which-key "delete")
      "bdc" '(org-table-delete-column :which-key "Delete column")
      "bdr" '(org-table-kill-row :which-key "Delete row")
      
      "bi" '(:ignore t :which-key "insert")
      "bic" '(org-table-insert-column :which-key "Insert column")
      "bih" '(org-table-insert-hline :which-key "Insert hline")
      "bir" '(org-table-insert-row :which-key "Insert row")
      "biH" '(org-table-hline-and-move :which-key "Hline and move")
      
      "bt" '(:ignore t :which-key "toggle")
      "btf" '(org-table-toggle-formula-debugger :which-key "Formula debugger")
      "bto" '(org-table-toggle-coordinate-overlays :which-key "Coordinate overlays")
      
      "c" '(:ignore t :which-key "clock")
      "cc" '(org-clock-cancel :which-key "Cancel")
      "cd" '(org-clock-mark-default-task :which-key "Mark default")
      "ce" '(org-clock-modify-effort-estimate :which-key "Modify effort")
      "cE" '(org-set-effort :which-key "Set effort")
      "cg" '(org-clock-goto :which-key "Goto")
      "ci" '(org-clock-in :which-key "Clock in")
      "cI" '(org-clock-in-last :which-key "Clock in last")
      "co" '(org-clock-out :which-key "Clock out")
      "cr" '(org-resolve-clocks :which-key "Resolve")
      "cR" '(org-clock-report :which-key "Report")
      "ct" '(org-evaluate-time-range :which-key "Evaluate time")
      "c=" '(org-clock-timestamps-up :which-key "Timestamps up")
      "c-" '(org-clock-timestamps-down :which-key "Timestamps down")
      
      "d" '(:ignore t :which-key "date/deadline")
      "dd" '(org-deadline :which-key "Deadline")
      "ds" '(org-schedule :which-key "Schedule")
      "dt" '(org-time-stamp :which-key "Timestamp")
      "dT" '(org-time-stamp-inactive :which-key "Inactive timestamp")
      
      "g" '(:ignore t :which-key "goto")
      "gg" '(org-goto :which-key "Goto")
      "gc" '(org-clock-goto :which-key "Clock")
      "gi" '(org-id-goto :which-key "ID")
      "gr" '(org-refile-goto-last-stored :which-key "Last refile")
      "gx" '(org-capture-goto-last-stored :which-key "Last capture")
      
      "l" '(:ignore t :which-key "links")
      "lc" '(org-cliplink :which-key "Cliplink")
      "li" '(org-id-store-link :which-key "ID link")
      "ll" '(org-insert-link :which-key "Insert")
      "lL" '(org-insert-all-links :which-key "Insert all")
      "ls" '(org-store-link :which-key "Store")
      "lS" '(org-insert-last-stored-link :which-key "Last stored")
      "lt" '(org-toggle-link-display :which-key "Toggle display")
      "ly" '(+org/yank-link :which-key "Yank")
      
      "P" '(:ignore t :which-key "publish")
      "Pa" '(org-publish-all :which-key "All")
      "Pf" '(org-publish-current-file :which-key "File")
      "Pp" '(org-publish :which-key "Project")
      "PP" '(org-publish-current-project :which-key "Current project")
      "Ps" '(org-publish-sitemap :which-key "Sitemap")
      
      "r" '(:ignore t :which-key "refile")
      "rr" '(org-refile :which-key "Refile")
      "rR" '(org-refile-reverse :which-key "Reverse refile")
      
      "s" '(:ignore t :which-key "tree/subtree")
      "sa" '(org-toggle-archive-tag :which-key "Archive tag")
      "sb" '(org-tree-to-indirect-buffer :which-key "Indirect buffer")
      "sc" '(org-clone-subtree-with-time-shift :which-key "Clone")
      "sd" '(org-cut-subtree :which-key "Cut")
      "sh" '(org-promote-subtree :which-key "Promote")
      "sj" '(org-move-subtree-down :which-key "Move down")
      "sk" '(org-move-subtree-up :which-key "Move up")
      "sl" '(org-demote-subtree :which-key "Demote")
      "sn" '(org-narrow-to-subtree :which-key "Narrow")
      "sr" '(org-refile :which-key "Refile")
      "ss" '(org-sparse-tree :which-key "Sparse tree")
      "sA" '(org-archive-subtree-default :which-key "Archive")
      "sN" '(widen :which-key "Widen")
      "sS" '(org-sort :which-key "Sort")
      
      "p" '(:ignore t :which-key "priority")
      "pd" '(org-priority-down :which-key "Down")
      "pp" '(org-priority :which-key "Set priority")
      "pu" '(org-priority-up :which-key "Up")))

  (with-eval-after-load 'org-agenda
    (my/local-leader
      :keymaps 'org-agenda-mode-map
      "d" '(:ignore t :which-key "date/deadline")
      "dd" '(org-agenda-deadline :which-key "Deadline")
      "ds" '(org-agenda-schedule :which-key "Schedule")
      
      "c" '(:ignore t :which-key "clock")
      "cc" '(org-agenda-clock-cancel :which-key "Cancel")
      "cg" '(org-agenda-clock-goto :which-key "Goto")
      "ci" '(org-agenda-clock-in :which-key "Clock in")
      "co" '(org-agenda-clock-out :which-key "Clock out")
      "cr" '(org-agenda-clockreport-mode :which-key "Report mode")
      "cs" '(org-agenda-show-clocking-issues :which-key "Show issues")
      
      "p" '(:ignore t :which-key "priority")
      "pd" '(org-agenda-priority-down :which-key "Down")
      "pp" '(org-agenda-priority :which-key "Set priority")
      "pu" '(org-agenda-priority-up :which-key "Up")
      
      "q" '(org-agenda-set-tags :which-key "Set tags")
      "r" '(org-agenda-refile :which-key "Refile")
      "t" '(org-agenda-todo :which-key "Todo"))
    
    (general-define-key
     :keymaps 'org-agenda-mode-map
     :states 'motion
     "C-SPC" 'org-agenda-show-and-scroll-up))

  ;; Super agenda header navigation
  (general-def org-super-agenda-header-map
    "k" #'org-agenda-prevous-line
    "j" #'org-agenda-next-line)

  ;; Inc/Dec numbers
  (general-define-key
   "M-=" 'evil-numbers/inc-at-pt
   "M--" 'evil-numbers/dec-at-pt))

(defun +my/treemacs-toggle ()
  "Initialize or toggle treemacs.
Shows only the current project, removing all others."
  (interactive)
  (require 'treemacs)
  (pcase (treemacs-current-visibility)
    ('visible
     (delete-window (treemacs-get-local-window)))
    (_
     (let ((project (treemacs--find-current-user-project)))
       (if (and project (not (file-equal-p project "~")))
           (treemacs-add-and-display-current-project-exclusively)
         (message "No valid project in current buffer; opening last treemacs session")
         (treemacs))))))

(provide '+keybindings)
;;; +keybindings.el ends here
