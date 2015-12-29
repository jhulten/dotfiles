(require 'org)

;; Workaround http://wenshanren.org/?p=781
(defun org-font-lock-ensure ()
  (font-lock-fontify-buffer))

;; utf-8 standard...
(setq org-export-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(set-charset-priority 'unicode)
(setq default-process-coding-system '(utf-8-unix . utf-8-unix))

(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))

;; Save all org buffers every ten minutes
(run-at-time "10 min" 600 'org-save-all-org-buffers)

(setq org-id-method (quote uuidgen))

(setq org-cycle-separator-lines 0)

(setq org-enforce-todo-dependencies t)

; Use IDO for both buffer and file completion and ido-everywhere to t
;;(setq org-completion-use-ido t)

; Use the current window for indirect buffer display
(setq org-indirect-buffer-display 'current-window)

(setq org-emphasis-alist (quote (("*" bold "<b>" "</b>")
                                 ("/" italic "<i>" "</i>")
                                 ("_" underline "<span style=\"text-decoration:underline;\">" "</span>")
                                 ("+" strike-through "<del>" "</del>")
                                 ("=" org-code "<code>" "</code>" verbatim)
                                 ("~" org-verbatim "<code>" "</code>" verbatim))))

(setq org-catch-invisible-edits 'show)

;; Create ids when linking
(setq org-id-link-to-org-use-id 'create-if-interactive-and-no-custom-id)
;; And delete them when cloning
(setq org-clone-delete-id t)
