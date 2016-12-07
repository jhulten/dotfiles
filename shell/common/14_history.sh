shopt -s histappend
HISTFILESIZE=1000000
HISTSIZE=1000000
HISTTIMEFORMAT='%F %T '
HISTCONTROL=ignorespace
HISTIGNORE='bg:fg:history'

if ! [[ "$PROMPT_COMMAND" =~ history ]]; then
  PROMPT_COMMAND="history -a; history -c; history -r;$PROMPT_COMMAND";
fi
