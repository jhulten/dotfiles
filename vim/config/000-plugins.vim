set nocompatible              " be iMproved, required
filetype off                  " required

let run_bundle_install = 0

if !filereadable(expand("~/.vim/autoload/plug.vim"))
  silent !echo "Installing vim-plug..."
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  let run_bundle_install = 1
endif

set nocompatible
filetype off

call plug#begin('~/.vim/plugged')

" All Hail, T Pope
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
" Plug 'tpope/vim-markdown'
" Plug 'tpope/vim-haml'
" Plug 'tpope/vim-rails'
" Plug 'tpope/vim-leiningen'
" Plug 'tpope/vim-projectionist'
" Plug 'tpope/vim-dispatch'
" Plug 'tpope/vim-fireplace'
" Plug 'tpope/vim-sexp-mappings-for-regular-people'

" Color Schemes
Plug 'lifepillar/vim-solarized8'
Plug 'altercation/vim-colors-solarized'


Plug 'scrooloose/nerdtree'
Plug 'mileszs/ack.vim'
Plug 'kien/rainbow_parentheses.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'vim-syntastic/syntastic'
Plug 'fatih/vim-go'
Plug 'elixir-lang/vim-elixir'
Plug 'majutsushi/tagbar'
" Plug 'FuzzyFinder'
" Plug 'taglist.vim'
" Plug 'Gist.vim'
" Plug 'L9'
" Plug 'kien/ctrlp.vim'
" Plug 'VimClojure'
" Plug 'guns/vim-sexp'
" Plug 'duskhacker/sweet-rspec-vim'
" Plug 'vim-ruby/vim-ruby'
" Plug 'matchit.zip'
" Plug 'CSApprox'
" Plug 'timcharper/textile.vim'
" Plug 'jimenezrick/vimerl'
" Plug 'rson/vim-conque'
" Plug 'Lokaltog/vim-powerline'
" Plug 'myusuf3/numbers.vim'
" Plug 'JSON.vim'
" Plug 'jsoncodecs.vim'
" Plug 'jsruntime.vim'
" Plug 'narrow_region'
" Plug 'sourcebeautify.vim'
" Plug 'speeddating.vim'
" Plug 'utl.vim'
" Plug 'vim-json-bundle'
" Plug 'pydave/AsyncCommand'
" Plug 'calendar.vim'
" Plug 'scala.vim'
" Plug 'groovy.vim'
" Plug 'repeat.vim'
" Plug 'vim-coffee-script'
" Plug 'closetag.vim'

" Plug 'Lokaltog/vim-easymotion'
" Plug 'rstacruz/sparkup', {'rtp': 'vim/'}
" Plug 'git://git.wincent.com/command-t.git'

" Plug 'editorconfig-vim'

" Plug 'rizzatti/dash.vim'
" Plug 'vimoutliner/vimoutliner'

" Plug 'bling/vim-airline'
" Plug 'farseer90718/vim-taskwarrior'

" All of your Plugins must be added before the following line
call plug#end()              " required
filetype plugin indent on    " required

if run_bundle_install == 1
  :PlugInstall

  silent !echo ""
  silent !echo "Vim is now ready."
  :cq
endif
