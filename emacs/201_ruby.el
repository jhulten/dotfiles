(setq rbenv-installation-dir "/usr/local")

(require 'rbenv)
(global-rbenv-mode)

(setq rbenv-show-active-ruby-in-modeline nil)

(require 'rspec-mode)
(eval-after-load 'rspec-mode
  '(rspec-install-snippets))
