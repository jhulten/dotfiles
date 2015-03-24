# Homebrew
if [[ "$platform" == 'macosx' ]]; then
  echo "Configuring Homebrew..."
  export HOMEBREW_PREFIX=$(brew --prefix)
  export HOMEBREW_CELLAR=$HOMEBREW_PREFIX/Cellar

  export PATH=$HOMEBREW_PREFIX/bin:$HOMEBREW_PREFIX/opt/coreutils/libexec/gnubin:$PATH

  export MANPATH=$HOMEBREW_PREFIX/opt/coreutils/libexec/gnuman:$MANPATH

  export LDFLAGS=-L$HOMEBREW_PREFIX/opt/gettext/lib
  export CPPFLAGS=-I$HOMEBREW_PREFIX/opt/gettext/include

  export CC=$HOMEBREW_PREFIX/bin/gcc

  # Specify your defaults in this environment variable
  export HOMEBREW_CASK_OPTS="--appdir=/Applications"

  # Python Home
  export PYTHONPATH=$(brew --prefix)/lib/python2.7/site-packages
fi
