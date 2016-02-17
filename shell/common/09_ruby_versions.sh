# if command -v rbenv >/dev/null 2>&1; then
#   echo Enabling rbenv...
#   eval "$(rbenv init -)"
# fi

if [ -e /usr/local/share/chruby/chruby.sh ]; then
  echo Enabling chruby...
  source /usr/local/share/chruby/chruby.sh
  source /usr/local/share/chruby/auto.sh

  RUBIES+=(
    /opt/chefdk/embedded
  )

fi
