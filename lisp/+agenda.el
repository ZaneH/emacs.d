;;; +agenda.el --- Agenda -*- lexical-binding: t; -*-

;; Inspired by: https://www.youtube.com/watch?v=a_WNtuefREM

(use-package ts
  :straight t
  :defer t)

(use-package ht
  :straight t
  :defer t)

(use-package s
  :straight t
  :defer t)

(use-package dash
  :straight t
  :defer t)

(use-package olivetti
  :straight t
  :defer t)

;; Org Super Agenda
(use-package org-super-agenda
  :straight t
  :after (org nerd-icons)
  :config
  (setq org-super-agenda-groups '((:name "Personal "
                                         :and(:category "Personal")
                                         :order 3)

                                  (:name "Work "
                                         :and(:category "Work")
                                         :order 2)

                                  (:name "Today"
                                         :time-grid t
                                         :scheduled today
                                         :order 1)

                                  (:name "Overdue"
                                         :deadline past
                                         :order 0)

                                  (:name "Due Soon"
                                         :deadline future
                                         :order -1)

                                  (:name "Unscheduled"
                                         :scheduled nil
                                         :order -2)

                                  (:name "Stuck"
                                         :todo "WAITING|HOLD|SOMEDAY"
                                         :order -3)))
  (org-super-agenda-mode)

  (setq org-agenda-span 4
        org-agenda-start-day "+0d"
        org-agenda-skip-timestamp-if-done t
        org-agenda-skip-deadline-if-done t
        org-agenda-skip-scheduled-if-done t
        org-agenda-skip-scheduled-if-deadline-is-shown t
        org-agenda-skip-timestamp-if-deadline-is-shown t)

  ;; Hide extra information
  (setq org-agenda-current-time-string ""
        org-agenda-time-grid '((daily) () "" "")
        org-agenda-prefix-format '(
                                   (agenda . "  %?-2i %t ")
                                   (todo . " %i %-12:c")
                                   (tags . " %i %-12:c")
                                   (search . " %i %-12:c")
                                   ))

  ;; Hide tags
  (setq org-agenda-hide-tags-regexp ".*")

  ;; Set icons
  (setq org-agenda-category-icon-alist
        `(("Personal" ,(list (nerd-icons-faicon "nf-fa-home" :height 0.9)) nil nil :ascent center)
          ("Work" ,(list (nerd-icons-faicon "nf-fa-briefcase" :height 0.9)) nil nil :ascent center)))
  
  (custom-set-faces
   '(org-agenda-date ((t (:inherit outline-1 :height 1.15))))
   '(org-agenda-date-today ((t (:inherit diary :height 1.15))))
   '(org-agenda-date-weekend ((t (:inherit outline-2 :height 1.15))))
   '(org-agenda-date-weekend-today ((t (:inherit outline-4 :height 1.15))))
   '(org-super-agenda-header ((t (:inherit custom-button :weight bold :height 1.05)))))

  ;; Center agenda buffer
  (add-hook 'org-agenda-mode-hook 'olivetti-mode))
