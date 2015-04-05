(require 'erc)

(global-set-key "\C-cef" (lambda () (interactive)
                         (erc :server "irc.freenode.net" :port "6667"
                              :nick "jhulten")))

(setq erc-autojoin-channels-alist
      '(("freenode.net" "#emacs"
	 "#erc"
	 "#ansible"
	 "##devops"
	 "##infra-talk"
	 "#clojure"
	 "#riemann")))

