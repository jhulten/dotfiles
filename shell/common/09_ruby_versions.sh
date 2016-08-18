# if command -v rbenv >/dev/null 2>&1; then
#   echo Enabling rbenv...
#   eval "$(rbenv init -)"
# fi

if [ -e /usr/local/share/chruby/chruby.sh ]; then
  # If chefdk is installed, make it chruby visible
  if [[ -d /opt/chefdk ]]; then
    ln -s /opt/chefdk/embedded ~/.rubies
  fi

  source /usr/local/share/chruby/chruby.sh
  source /usr/local/share/chruby/auto.sh

fi
