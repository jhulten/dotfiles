if which direnv >/dev/null 2>&1; then
  echo "enabling direnv"
  eval "$(direnv hook `basename $SHELL`)"
fi
