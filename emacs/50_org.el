(require 'org)

;; utf-8 standard...
(setq org-export-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(set-charset-priority 'unicode)
(setq default-process-coding-system '(utf-8-unix . utf-8-unix))

(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))

;; Save all org buffers every hour
(run-at-time "00:59" 3600 'org-save-all-org-buffers)


;; org-mode: Modules: List to include in orgmode
(setq org-modules (quote (org-bbdb
                          org-bibtex
                          org-crypt
                          org-gnus
                          org-id
                          org-info
                          org-jsinfo
                          org-habit
                          org-inlinetask
                          org-irc
                          org-mew
                          org-mhe
                          org-protocol
                          org-rmail
                          org-vm
                          org-wl
                          org-w3m)))

(setq org-deadline-warning-days 30)

(setq org-id-method (quote uuidgen))

(setq org-cycle-separator-lines 0)

(setq org-enforce-todo-dependencies t)

; Use IDO for both buffer and file completion and ido-everywhere to t
;;(setq org-completion-use-ido t)

; Use the current window for indirect buffer display
(setq org-indirect-buffer-display 'current-window)

; My flow of given todos...
(setq org-todo-keywords
      (quote ((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d)")
              (sequence "WAITING(w@/!)" "HOLD(h@/!)" "|" "CANCELLED(c@/!)" "PHONE" "MEETING")
	      (sequence "BACKLOG(b)" "PLANNED" "|" "SCHEDULED"))))


; Colors good!
(setq org-todo-keyword-faces
      (quote (("TODO" :foreground "firebrick3" :weight bold)
              ("NEXT" :foreground "blue" :weight bold)
              ("DONE" :foreground "forest green" :weight bold :strikethrough t)
              ("WAITING" :foreground "sienna1" :weight bold)
              ("HOLD" :foreground "plum3" :weight bold)
              ("CANCELLED" :foreground "forest green" :weight bold)
              ("MEETING" :foreground "forest green" :weight bold)
              ("PHONE" :foreground "forest green" :weight bold))))

(setq org-todo-state-tags-triggers
      (quote (("CANCELLED" ("CANCELLED" . t))
              ("WAITING" ("WAITING" . t))
              ("HOLD" ("WAITING") ("HOLD" . t))
              (done ("WAITING") ("HOLD"))
              ("TODO" ("WAITING") ("CANCELLED") ("HOLD"))
              ("NEXT" ("WAITING") ("CANCELLED") ("HOLD"))
              ("DONE" ("WAITING") ("CANCELLED") ("HOLD")))))

;; Priorities A-E
(setq org-enable-priority-commands t)
(setq org-default-priority ?E)
(setq org-lowest-priority ?E)

;; Remove strikethrough formatting
(setq org-emphasis-alist (quote (("*" bold "<b>" "</b>")
                                 ("/" italic "<i>" "</i>")
                                 ("_" underline "<span style=\"text-decoration:underline;\">" "</span>")
                                 ("=" org-code "<code>" "</code>" verbatim)
                                 ("~" org-verbatim "<code>" "</code>" verbatim))))

(setq org-catch-invisible-edits 'show)

;; Create ids when linking
(setq org-id-link-to-org-use-id 'create-if-interactive-and-no-custom-id)
;; And delete them when cloning
(setq org-clone-delete-id t)

;; Next is for tasks, if a project is marked NEXT change it to TODO
(defun bh/mark-next-parent-tasks-todo ()
  "Visit each parent task and change NEXT states to TODO"
  (let ((mystate (or (and (fboundp 'org-state)
                          state)
                     (nth 2 (org-heading-components)))))
    (when mystate
      (save-excursion
        (while (org-up-heading-safe)
          (when (member (nth 2 (org-heading-components)) (list "NEXT"))
            (org-todo "TODO")))))))

(add-hook 'org-after-todo-state-change-hook 'bh/mark-next-parent-tasks-todo 'append)
(add-hook 'org-clock-in-hook 'bh/mark-next-parent-tasks-todo 'append)
