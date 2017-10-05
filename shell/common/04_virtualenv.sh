if which pyenv >/dev/null; then
  echo "Enabling pyenv"
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init -)"
  if which pyenv-virtualenv-init > /dev/null; then
    eval "$(pyenv virtualenv-init -)"
  fi
fi
