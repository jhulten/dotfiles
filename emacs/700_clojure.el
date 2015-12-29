;; Clojure setup
(add-hook 'cider-mode-hook #'eldoc-mode)
(setq nrepl-log-messages t)
(setq nrepl-hide-special-buffers t)
;;(setq cider-repl-result-prefix ";; => ")
(setq cider-test-show-report-on-success t)
