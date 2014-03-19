# EDITOR
export EDITOR='vim'
export VISUAL=$EDITOR

# Hosted Chef User
export OPSCODE_USER=jhulten

# Homebrew

export HOMEBREW_PREFIX=$HOME/.homebrew
export HOMEBREW_CELLAR=$HOMEBREW_CELLAR/Cellar

export PATH=$HOMEBREW_PREFIX/opt/coreutils/libexec/gnubin:$PATH
export MANPATH=$HOMEBREW_PREFIX/opt/coreutils/libexec/gnuman:$MANPATH
export PATH=$HOMEBREW_PREFIX/bin:$PATH
export SSL_CERT_FILE=$HOMEBREW_PREFIX/etc/openssl/cert.pem
export LDFLAGS=-L$HOMEBREW_PREFIX/opt/gettext/lib
export CPPFLAGS=-I$HOMEBREW_PREFIX/opt/gettext/include

# Java Home
export JAVA_HOME=/System/Library/Java/JavaVirtualMachines/1.6.0.jdk/Contents/Home/

# Groovy Home
export GROOVY_HOME=$HOMEBREW_CELLAR/groovy/2.0.5/libexec

# Python Home
export PYTHONPATH=$(brew --prefix)/lib/python2.7/site-packages
