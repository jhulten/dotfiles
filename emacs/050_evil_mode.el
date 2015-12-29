; Use evil mode
(require 'evil)
(evil-mode t)

; Set cursor colors depending on mode
(when (display-graphic-p)
  (setq evil-emacs-state-cursor '("red" box))
  (setq evil-normal-state-cursor '("green" box))
  (setq evil-visual-state-cursor '("orange" box))
  (setq evil-insert-state-cursor '("red" bar))
  (setq evil-replace-state-cursor '("red" bar))
  (setq evil-operator-state-cursor '("red" hollow))
)

(global-evil-leader-mode)
(evil-leader/set-leader ",")

;; (evil-leader/set-key-for-mode 'emacs-lisp-mode "b" 'byte-compile-file)

(evil-leader/set-key
  "e" 'helm-find-file
  "p" 'helm-projectile
  "v" 'magit-status)

(require 'evil-surround)
(global-evil-surround-mode 1)
