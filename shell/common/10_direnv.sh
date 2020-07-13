if which direnv >/dev/null 2>&1; then
else
  echo "missing direnv"
  if [[ $HAS_BREW == 1 ]]; then
    echo "installing via homebrew"
    brew install direnv
  elif which apt-get >/dev/null 2>&1; then
    echo "installing via apt-get"
    apt-get update && apt-get install -y direnv
  fi
fi

if which direnv >/dev/null 2>&1; then
  echo "enabling direnv"
  eval "$(direnv hook `basename $SHELL`)"
fi
