; position the habit graph on the agenda to the right of the default
(setq org-habit-graph-column 50)

; Make sure habits show up in the morning.
(run-at-time "06:00" 86400 '(lambda () (setq org-habit-show-habits t)))

;; Habit settings
(setq org-habit-preceding-days 14)
(setq org-habit-following-days 3)
