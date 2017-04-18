# EDITOR

if [ -z "$SSH_CONNECTION" ]; then
   case $platform in
   macosx*)
       export EMACSCLIENT=/usr/local/bin/emacsclient
       alias emacsclient=$EMACSCLIENT
       ;;
   *)
       export EMACSCLIENT=emacsclient
       ;;
   esac
   alias ec="$EMACSCLIENT -c -n"
   export EDITOR="gvim -f"
   export ALTERNATE_EDITOR="vim"
else
    export EDITOR=$(type -P vim || type -P vi)
fi
export VISUAL=$EDITOR
