platform='unknown'
unamestr=$(uname)
if [[ "$unamestr" == 'Linux' ]]; then
    platform='linux'
elif [[ "$unamestr" == 'FreeBSD' ]]; then
    platform='freebsd'
elif [[ "$unamestr" == 'Darwin' ]]; then
    platform='macosx'
fi
echo "Platform: $platform"

case "$-" in
*i*)
    eval $(ssh-agent)
    ssh-add
    ;;
*) echo This shell is not interactive ;;
esac

. $HOME/.asdf/asdf.sh

function has() { # BINARY_TO_FIND
    type "$1" &>/dev/null
}

function exists() { # FILE_TO_CHECK
    [ -e $1 ]
}

function pkg_install() { # PACKAGE/PACKAGE_BREW PACKAGE_APT
    case $platform in
    "macosx")
        if has brew; then
            brew install $1
        else
            echo "No method to install $1 on $platform"
        fi
        ;;
    "linux")
        echo linux
        if has brew; then
            brew install $1
        elif exists /var/lib/apt; then
            local pkg = ${2:-$1}
            sudo apt-get install $pkg
        else
            echo "No method to install $1 on $platform"
        fi
        ;;
    *)
        echo "Failed to install $1 on $platform"
        ;;
    esac
}

function ensure_latest() { # ASDF_PLUGIN VERSION_PREFIX
    if has asdf; then
        if ! (asdf plugin-list | grep -q $1); then
            asdf plugin-add $1
        fi
        asdf install $1 latest:$2
    else
        echo ERR: asdf missing
    fi
}

function lastmod() { # FILENAME
    if exists $1; then
        case $platform in
        'macosx')
            stat -f "%m" $1
            ;;
        'linux')
            stat -c "%Y" $1
            ;;
        *)
            echo "Unsupported platform: $platform" >>/dev/stderr
            exit -1
            ;;
        esac
    fi
}

function once_per_day() { # COMMAND ARGS
    NOW=$(date +%s)
    DAY_IN_SECS=86400
    CACHE_DIR=$HOME/.config/dotfiles/
    mkdir -p $CACHE_DIR

    HASH=$(echo $@ | sha1sum | cut -f1 -d' ')

    if exists "$CACHE_DIR/$HASH"; then
        if [[ $(lastmod $CACHE_DIR/$HASH) -gt $(($NOW - $DAY_IN_SECS)) ]]; then
            return
        fi
    fi

    eval $@
    RESULT=$?

    if [[ $RESULT -eq 0 ]]; then
        touch "$CACHE_DIR/$HASH"
    fi
    return $RESULT
}
