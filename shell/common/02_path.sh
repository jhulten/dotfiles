echo Updating PATH...
export PATH=$PATH:~/bin
export CDPATH=$HOME/src/github.com:$HOME/src/code.google.com/p

function gocd () {
  cd $(go list -f '{{.Dir}}' $1)
}
