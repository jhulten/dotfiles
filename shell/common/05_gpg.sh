# shellcheck shell=bash
if test "$SSH_CONNECTION" != ""
then
export PINENTRY_USER_DATA="USE_CURSES=1"
fi

GPG_TTY=$(tty)
export GPG_TTY
