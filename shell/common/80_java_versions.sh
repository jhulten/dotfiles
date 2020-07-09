if which jenv > /dev/null; then
  echo Enabling jenv...
  eval "$(jenv init -)"
else
  echo jenv not installed try: brew install jenv
fi
