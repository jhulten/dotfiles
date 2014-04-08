# Homebrew
if [[ "$platform" == 'macosx' ]]; then
  export HOMEBREW_PREFIX=$HOME/.homebrew
  export HOMEBREW_CELLAR=$HOMEBREW_CELLAR/Cellar

  export PATH=$HOMEBREW_PREFIX/opt/coreutils/libexec/gnubin:$PATH
  export MANPATH=$HOMEBREW_PREFIX/opt/coreutils/libexec/gnuman:$MANPATH
  export PATH=$HOMEBREW_PREFIX/bin:$PATH
  export SSL_CERT_FILE=$HOMEBREW_PREFIX/etc/openssl/cert.pem
  export LDFLAGS=-L$HOMEBREW_PREFIX/opt/gettext/lib
  export CPPFLAGS=-I$HOMEBREW_PREFIX/opt/gettext/include

  export CC=$HOMEBREW_PREFIX/bin/gcc

  # Python Home
  export PYTHONPATH=$(brew --prefix)/lib/python2.7/site-packages
fi
