# Homebrew

if [[ "$platform" == "macosx" ]]; then
  # HOMEBREW_LOCK=/tmp/homebrew.install
  #
  # lockfile -2 -r 30 $HOMEBREW_LOCK || exit 1
  #
  # if [[ ! -f /usr/local/bin/brew ]]; then
  #   echo "Installing Homebrew..."
  #   ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  # fi
  #
  # rm -f $HOMEBREW_LOCK

  # Python Home
  #export PYTHONPATH=$(brew --prefix)/lib/python2.7/site-packages

  if [ -f $(brew --prefix)/etc/bash_completion ]; then
    echo "enabling completions from homebrew"
    if [[ "$(basename $SHELL)" == "bash" ]]; then
      . $(brew --prefix)/etc/$(basename $SHELL )_completion
    elif [[ "$(basename $SHELL)" == "zsh" ]]; then
      fpath=(/usr/local/share/zsh-completions $fpath)
    else
      echo "completions not configured for $SHELL"
    fi

  fi
else
  echo "Skipping homebrew configuration for $platform"
fi
