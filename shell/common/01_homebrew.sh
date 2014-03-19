# Homebrew

export HOMEBREW_PREFIX=$HOME/.homebrew
export HOMEBREW_CELLAR=$HOMEBREW_CELLAR/Cellar

export PATH=$HOMEBREW_PREFIX/opt/coreutils/libexec/gnubin:$PATH
export MANPATH=$HOMEBREW_PREFIX/opt/coreutils/libexec/gnuman:$MANPATH
export PATH=$HOMEBREW_PREFIX/bin:$PATH
export SSL_CERT_FILE=$HOMEBREW_PREFIX/etc/openssl/cert.pem
export LDFLAGS=-L$HOMEBREW_PREFIX/opt/gettext/lib
export CPPFLAGS=-I$HOMEBREW_PREFIX/opt/gettext/include
