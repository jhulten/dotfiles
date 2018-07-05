echo Updating PATH...
export PATH=$PATH:~/bin
export CDPATH=$HOME/src/gitlab.amer.gettywan.com:$HOME/src/github.com:$HOME/src/code.google.com/p

function gocd () {
  cd $(go list -f '{{.Dir}}' $1)
}

# Find your path Python User Base path (where Python --user will install packages/scripts)
USER_BASE_PATH="$(python -m site --user-base)"

# Add this path to your $PATH
export PATH=$USER_BASE_PATH/bin:$PATH
