shopt -s histappend
HISTFILESIZE=1000000
HISTSIZE=1000000
HISTTIMEFORMAT='%F %T '
HISTCONTROL=ignorespace
HISTIGNORE='bg:fg:history'

export PROMPT_COMMAND="history -a; history -c; history -r"
