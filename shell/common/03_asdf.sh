VERSION_ASDF=v0.8.0

if ! (exists $HOME/.asdf); then
    git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch $VERSION_ASDF
else
    asdf update
fi
