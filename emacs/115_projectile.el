;; (setq helm-projectile-fuzzy-match nil)
;; (require 'org-projectile)

(setq projectile-keymap-prefix (kbd "C-c p"))
(projectile-global-mode)

(require 'helm-projectile)
(helm-projectile-on)
