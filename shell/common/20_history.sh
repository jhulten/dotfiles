shopt -s histappend
export HISTFILESIZE=1000000
export HISTSIZE=1000000
export PROMPT_COMMAND='history -a'
export HISTTIMEFORMAT='%F %T '
export HISTCONTROL=ignoreboth
export HISTIGNORE='ls:bg:fg:history'
