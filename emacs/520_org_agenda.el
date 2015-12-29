(setq org-agenda-span 'week)

(setq org-agenda-files '("~/Dropbox/todo"))

(setq org-time-budgets '((:title "Business" :tags "+Datadog" :budget "30:00" :block workweek)
                         (:title "Sideprojects" :tags "+personal+project" :budget "14:00" :block week)
                         (:title "Exercise" :tags "+exercise" :budget "5:15" :block week)))

;; Turn on diary within org-mode
(setq org-agenda-include-diary t)

;; AGENDA

(setq org-agenda-insert-diary-extract-time t)

;; Keep tasks with dates on the global todo lists
(setq org-agenda-todo-ignore-with-date nil)

;; Keep tasks with deadlines on the global todo lists
(setq org-agenda-todo-ignore-deadlines nil)

;; Keep tasks with scheduled dates on the global todo lists
(setq org-agenda-todo-ignore-scheduled t)

;; Keep tasks with timestamps on the global todo lists
(setq org-agenda-todo-ignore-timestamp t)

;; Remove completed deadline tasks from the agenda view
(setq org-agenda-skip-deadline-if-done t)

;; Remove completed scheduled tasks from the agenda view
(setq org-agenda-skip-scheduled-if-done t)

;; Remove completed items from search results
(setq org-agenda-skip-timestamp-if-done nil)

;; Show all future entries for repeating tasks
(setq org-agenda-repeating-timestamp-show-all nil)

;; Show all agenda dates - even if they are empty
(setq org-agenda-show-all-dates t)

;; Sorting order for tasks on the agenda
(setq org-agenda-sorting-strategy
      (quote ((agenda habit-down time-up user-defined-up effort-up category-keep)
              (todo category-up effort-up)
              (tags category-up effort-up)
              (search category-up))))

              (setq org-agenda-custom-commands
                    '(("O" "Office block agenda"
                        ((agenda "" ((org-agenda-ndays 1)))
                                    ;; limits the agenda display to a single day
                         (tags-todo "@work|Datadog|phone")
                         (todo "TODO" ((org-agenda-files '("~/Dropbox/todo/inbox.org"))))
                                        ;; limits the tag search to the file inbox.org
                         (todo "BLOCKED"))
                        ((org-agenda-compact-blocks t)) ;; options set here apply to the entire block
                      )
                      ("A" "Custom agenda"
                        ((agenda "")
                         (org-time-budgets-for-agenda))
              	)
              	("b" "Projects"
              	 ((todo "PROJECT"))
              	)
              	("W" "Weekly Review"
                       ((agenda "" ((org-agenda-ndays 7))) ;; review upcoming deadlines and appointments
                                                         ;; type "l" in the agenda to review logged items
                        (stuck "") ;; review stuck projects as designated by org-stuck-projects
                        (todo "PROJECT") ;; review all projects (assuming you use todo keywords to designate projects)
                        (todo "MAYBE") ;; review someday/maybe items
                        (todo "WAITING")) ;; review waiting items
              	 )
              	("d" "Upcoming deadlines" agenda ""
                              ((org-agenda-time-grid nil)
                               (org-deadline-warning-days 365)        ;; [1]
                               (org-agenda-entry-types '(:deadline))  ;; [2]
                               ))
              	("c" "Calendar" agenda ""
                       ((org-agenda-ndays 7)                          ;; [1]
                        (org-agenda-start-on-weekday 0)               ;; [2]
                        (org-agenda-time-grid nil)
                        (org-agenda-repeating-timestamp-show-all t)   ;; [3]
                        (org-agenda-entry-types '(:timestamp :sexp))))  ;; [4]
              ))

;; Start the weekly agenda on Monday
(setq org-agenda-start-on-weekday 1)

;; Enable display of the time grid so we can see the marker for the current time
(setq org-agenda-time-grid (quote ((daily today remove-match)
                                   #("----------------" 0 16 (org-heading t))
                                   (0900 1100 1300 1500 1700 1900))))

;; Display tags farther right
(setq org-agenda-tags-column -102)

;;
;; Agenda sorting functions
;;
(setq org-agenda-cmp-user-defined 'bh/agenda-sort)

(defun bh/agenda-sort (a b)
  "Sorting strategy for agenda items. Late deadlines first, then scheduled, then non-late deadlines"
  (let (result num-a num-b)
    (cond
     ; time specific items are already sorted first by org-agenda-sorting-strategy

     ; non-deadline and non-scheduled items next
     ((bh/agenda-sort-test 'bh/is-not-scheduled-or-deadline a b))

     ; deadlines for today next
     ((bh/agenda-sort-test 'bh/is-due-deadline a b))

     ; late deadlines next
     ((bh/agenda-sort-test-num 'bh/is-late-deadline '> a b))

     ; scheduled items for today next
     ((bh/agenda-sort-test 'bh/is-scheduled-today a b))

     ; late scheduled items next
     ((bh/agenda-sort-test-num 'bh/is-scheduled-late '> a b))

     ; pending deadlines last
     ((bh/agenda-sort-test-num 'bh/is-pending-deadline '< a b))

     ; finally default to unsorted
     (t (setq result nil)))
    result))

(defmacro bh/agenda-sort-test (fn a b)
  "Test for agenda sort"
  `(cond
    ; if both match leave them unsorted
    ((and (apply ,fn (list ,a))
          (apply ,fn (list ,b)))
     (setq result nil))
    ; if a matches put a first
    ((apply ,fn (list ,a))
     (setq result -1))
    ; otherwise if b matches put b first
    ((apply ,fn (list ,b))
     (setq result 1))
    ; if none match leave them unsorted
    (t nil)))

(defmacro bh/agenda-sort-test-num (fn compfn a b)
  `(cond
    ((apply ,fn (list ,a))
     (setq num-a (string-to-number (match-string 1 ,a)))
     (if (apply ,fn (list ,b))
         (progn
           (setq num-b (string-to-number (match-string 1 ,b)))
           (setq result (if (apply ,compfn (list num-a num-b))
                            -1
                          1)))
       (setq result -1)))
    ((apply ,fn (list ,b))
     (setq result 1))
    (t nil)))

(defun bh/is-not-scheduled-or-deadline (date-str)
  (and (not (bh/is-deadline date-str))
       (not (bh/is-scheduled date-str))))

(defun bh/is-due-deadline (date-str)
  (string-match "Deadline:" date-str))

(defun bh/is-late-deadline (date-str)
  (string-match "\\([0-9]*\\) d\. ago:" date-str))

(defun bh/is-pending-deadline (date-str)
  (string-match "In \\([^-]*\\)d\.:" date-str))

(defun bh/is-deadline (date-str)
  (or (bh/is-due-deadline date-str)
      (bh/is-late-deadline date-str)
      (bh/is-pending-deadline date-str)))

(defun bh/is-scheduled (date-str)
  (or (bh/is-scheduled-today date-str)
      (bh/is-scheduled-late date-str)))

(defun bh/is-scheduled-today (date-str)
  (string-match "Scheduled:" date-str))

(defun bh/is-scheduled-late (date-str)
  (string-match "Sched\.\\(.*\\)x:" date-str))
