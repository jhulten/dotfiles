(setq org-default-notes-file "~/Dropbox/todo/jhulten.org")
(setq org-default-bookmarks-file "~/Dropbox/todo/bookmarks.org")

;; Capture templates for: TODO tasks, Notes, appointments, phone calls, meetings, and org-protocol
(setq org-capture-templates
      (quote (("t" "todo" entry (file+headline org-default-notes-file "INBOX")
               "* TODO %?\n  %i\n" :clock-in t :clock-resume t)

              ("n" "note" entry (file+headline org-default-notes-file "INBOX")
               "* %?\n:PROPERTIES:\n:CREATED_AT: %U\n:END:\n" :clock-in t :clock-resume t)

              ("j" "Journal" entry (file+datetree org-default-notes-file "Diary")
               "* %?\n%U\n" :clock-in t :clock-resume t)

              ("m" "Meeting" entry (file+headline org-default-notes-file "INBOX")
               "* MEETING with %? :MEETING:\n%U" :clock-in t :clock-resume t)
	      
              ("p" "Phone call" entry (file+headline org-default-notes-file "INBOX")
               "* PHONE %? :PHONE:\n%U" :clock-in t :clock-resume t)

	      ("b" "Bookmark" entry (file org-default-bookmarks-file)
	       "* %?\n:PROPERTIES:\n:CREATED: %U\n:END:\n\n" :empty-lines 1)
	      
              ("h" "Habit" entry (file+headline org-default-notes-file "Habits")
               "* NEXT %?\n%U\n%a\nSCHEDULED: %(format-time-string \"<%Y-%m-%d %a .+1d/3d>\")\n:PROPERTIES:\n:STYLE: habit\n:REPEAT_TO_STATE: NEXT\n:END:\n"))))

