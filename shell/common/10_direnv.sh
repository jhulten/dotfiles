ensure_latest direnv 2

# Hook direnv into your shell.
eval "$(asdf exec direnv hook `basename $SHELL`)"

# A shortcut for asdf managed direnv.
direnv() { asdf exec direnv "$@"; }