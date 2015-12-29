; My flow of given todos...
(setq org-todo-keywords
      (quote ((sequence "TODO(t)" "NEXT(n)" "DOING(s)" "|" "DONE(d)")
              (sequence "|" "CANCELLED(c@/!)")
              (type "PROJECT(p)" "BLOCKED(b@/!)" "SOMEDAY(y!)")
              (type "PHONE" "MEETING" "NOTE"))))

; Colors good!
(setq org-todo-keyword-faces
      (quote (("TODO" :foreground "yellow")
              ("NEXT" :foreground "orange" :weight bold)
              ("DOING" :foreground "firebrick3" :weight bold)
              ("DONE" :foreground "forest green" :weight bold :strike-through "green")
              ("CANCELLED" :foreground "forest green" :weight bold :strike-through "red")
              ;; typed todos
              ("PROJECT" :foreground "gray" :weight bold)
              ("BLOCKED" :foreground "red" :weight bold)
              ("SOMEDAY" :foreground "plum3" :weight bold)
              ("MEETING" :foreground "blue" :slant italic)
              ("PHONE" :foreground "blue" :slant italic)
              ("NOTE" :foreground "blue"))))

(setq org-todo-state-tags-triggers
      (quote (("CANCELLED" ("CANCELLED" . t))
              ("SOMEDAY" ("SOMEDAY" . t))
              ("BLOCKED" ("SOMEDAY") ("BLOCKED" . t))
              (done ("BLOCKED") ("SOMEDAY"))
              ("TODO" ("BLOCKED") ("CANCELLED") ("SOMEDAY"))
              ("NEXT" ("BLOCKED") ("CANCELLED") ("SOMEDAY"))
              ("DOING" ("BLOCKED") ("CANCELLED") ("SOMEDAY"))
              ("PROJECT" ("BLOCKED") ("CANCELLED") ("SOMEDAY"))
              ("DONE" ("BLOCKED") ("CANCELLED") ("SOMEDAY")))))

(setq org-tag-alist '((:startgroup . nil)
                           ("@work" . ?w) ("@home" . ?h)
                           ("@errands" . ?e)
                           (:endgroup . nil)
                           ("computer" . ?c) ("kalyn" . ?k) ("phone" . ?p)))

(setq org-log-done 'time)

;; Next is for tasks, if a project is marked NEXT change it to TODO
(defun bh/mark-next-parent-tasks-todo ()
  "Visit each parent task and change NEXT states to TODO"
  (let ((mystate (or (and (fboundp 'org-state)
                          state)
                     (nth 2 (org-heading-components)))))
    (when mystate
      (save-excursion
        (while (org-up-heading-safe)
          (when (member (nth 2 (org-heading-components)) (list "TODO" "NEXT" "DOING"))
            (org-todo "PROJECT")))))))

(add-hook 'org-after-todo-state-change-hook 'bh/mark-next-parent-tasks-todo 'append)
(add-hook 'org-clock-in-hook 'bh/mark-next-parent-tasks-todo 'append)

;; TODO: Add clock-in hook to change to STARTED
