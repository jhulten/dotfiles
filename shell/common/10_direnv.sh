if which direnv >/dev/null 2>&1; then
  eval "$(direnv hook `basename $SHELL`)"
fi
