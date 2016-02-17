;; No splash screen please ... jeez
(setq inhibit-startup-message t)

(defconst *is-a-mac* (eq system-type 'darwin))

(setq debug-on-error t)

(require 'server)
(unless (server-running-p) (server-start))

;; believe me, you don't need menubar(execpt OSX), toolbar nor scrollbar
(and (fboundp 'menu-bar-mode)
     (not *is-a-mac*)
     (menu-bar-mode -1))
(dolist (mode '(tool-bar-mode scroll-bar-mode))
  (when (fboundp mode) (funcall mode -1)))

;; Keep emacs Custom-settings in separate file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

(setq
   backup-by-copying t      ; don't clobber symlinks
   backup-directory-alist
    '(("." . "~/.saves"))    ; don't litter my fs tree
   delete-old-versions t
   kept-new-versions 6
   kept-old-versions 2
   version-control t)       ; use versioned backups

(org-babel-load-file "~/.emacs.d/config.org")
