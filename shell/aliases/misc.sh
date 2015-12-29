# alias t=task

alias todo="emacs -batch -l ~/.emacs.d/init.el -eval '(org-batch-agenda \"t\")' 2> /dev/null "
alias today="emacs -batch -l ~/.emacs.d/init.el -eval '(org-batch-agenda \"a\")' 2> /dev/null "
