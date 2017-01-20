
(defconst *is-a-mac* (eq system-type 'darwin))

(setq debug-on-error t)

(require 'server)
(unless (server-running-p) (server-start))

(org-babel-load-file "~/.emacs.d/config.org")
