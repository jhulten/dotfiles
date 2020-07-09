# shellcheck shell=bash
# Homebrew

platform='unknown'
unamestr=$(uname)
if [[ "$unamestr" == 'Linux' ]]; then
  platform='linux'
elif [[ "$unamestr" == 'FreeBSD' ]]; then
  platform='freebsd'
elif [[ "$unamestr" == 'Darwin' ]]; then
  platform='macosx'
fi
echo "Platform: $platform"

if [[ -x "/usr/local/bin/brew" || -x "/home/linuxbrew/.linuxbrew/bin/brew" ]]; then
  export HAS_BREW=1
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
      export PATH="$(brew --prefix)/sbin:$PATH"
    fi
  elif [[ "$platform" == "linux" ]]; then
    brewhome=/home/linuxbrew
    export PKG_CONFIG_PATH="/usr/bin/pkg-config:$brewhome/.linuxbrew/bin/pkg-config" 
    export PKG_CONFIG_LIBDIR="/usr/lib/pkgconfig:$brewhome/.linuxbrew/lib/pkgconfig" 
    export PATH="$brewhome/.linuxbrew/bin:$PATH"
    export MANPATH="$brewhome/.linuxbrew/share/man:$MANPATH"
    export INFOPATH="$brewhome/.linuxbrew/share/info:$INFOPATH"
  fi

fi