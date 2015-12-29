if which pyenv >/dev/null 2>&1; then
#  echo Enabling pyenv...
#  export WORKON_HOME=$HOME/.virtualenvs
#  eval "$(pyenv init -)"
  if which pyenv-virtualenv-init > /dev/null; then
    eval "$(pyenv virtualenv-init -)"
  fi
fi
