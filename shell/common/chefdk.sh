if [[ -d /opt/chefdk ]]; then
  echo Enabling ChefDK...
  eval "$(/opt/chefdk/bin/chef shell-init `basename $SHELL`)"
fi
