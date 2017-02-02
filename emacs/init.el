
(defconst *is-a-mac* (eq system-type 'darwin))

(setq debug-on-error t)

(require 'server)
(unless (server-running-p) (server-start))

(require 'package) ;; You might already have this line

(add-to-list 'package-archives
             '("melpa-stable" . "http://stable.melpa.org/packages/"))
(add-to-list 'package-archives
             '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(setq package-archive-priorities '(("org" . 4)
                                   ("melpa-stable" . 3)
                                   ("melpa" . 2)
                                   ("gnu" . 1)))

(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))

(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(defun jh/require-package (pkg)
  "Require a package, fetching if neccesary"
  (unless (package-installed-p pkg)
    (package-install pkg))
  (eval-when-compile (require pkg)))

(jh/require-package 'use-package)

(setq use-package-verbose t)
(setq use-package-always-ensure t)

;; bind-key enables cleaner key mapping in and out of use-package.
(jh/require-package 'bind-key)
(require 'bind-key)

(jh/require-package 'diminish)
(require 'diminish)

(org-babel-load-file "~/.emacs.d/config.org")
