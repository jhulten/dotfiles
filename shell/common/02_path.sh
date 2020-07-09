# shellcheck shell=bash
echo Updating PATH...
export PATH=$PATH:~/bin
export CDPATH=$HOME/src/gitlab.getty.cloud:$HOME/src/github.com:$HOME/src/code.google.com/p

function gocd () {
  cd $(go list -f '{{.Dir}}' $1)  || return
}

# Find your path Python User Base path (where Python --user will install packages/scripts)
#USER_BASE_PATH="$(python -m site --user-base)"

# Add this path to your $PATH
#export PATH=$USER_BASE_PATH/bin:$PATH
