echo Updating PATH...
export PATH=$PATH:~/bin
export CDPATH=$HOME/src/gitlab.amer.gettywan.com:$HOME/src/github.com:$HOME/src/code.google.com/p

function gocd () {
  cd $(go list -f '{{.Dir}}' $1)
}
