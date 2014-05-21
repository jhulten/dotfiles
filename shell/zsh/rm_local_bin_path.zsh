export PATH=$(echo -n $PATH | tr ":" "\n" | sed "/.usr.local.bin/d" | tr "\n" ":" | sed 's/:$//')
