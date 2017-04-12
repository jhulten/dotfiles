set nocompatible              " be iMproved, required
filetype off                  " required

let run_bundle_install = 0

if !isdirectory(expand("~/.vim/bundle/vundle/"))
  silent !echo "Installing Vundle..."
  silent !mkdir -p ~/.vim/bundle
  silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
  let run_bundle_install = 1
endif

set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#begin()

Plugin 'gmarik/vundle'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'mileszs/ack.vim'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'Syntastic'
Plugin 'bufexplorer.zip'
Plugin 'fatih/vim-go'
Plugin 'elixir-lang/vim-elixir'
Plugin 'twilight256.vim'
Plugin 'lifepillar/vim-solarized8'
Plugin 'majutsushi/tagbar'
" Plugin 'FuzzyFinder'
" Plugin 'taglist.vim'
" Plugin 'Gist.vim'
" Plugin 'L9'
" Plugin 'kien/ctrlp.vim'
" Plugin 'VimClojure'
" Plugin 'tpope/vim-sexp-mappings-for-regular-people'
" Plugin 'guns/vim-sexp'
" Plugin 'tpope/vim-leiningen'
" Plugin 'tpope/vim-projectionist'
" Plugin 'tpope/vim-dispatch'
" Plugin 'tpope/vim-fireplace'
" Plugin 'duskhacker/sweet-rspec-vim'
" Plugin 'tpope/vim-markdown'
" Plugin 'tpope/vim-haml'
" Plugin 'tpope/vim-rails'
" Plugin 'vim-ruby/vim-ruby'
" Plugin 'matchit.zip'
" Plugin 'CSApprox'
" Plugin 'timcharper/textile.vim'
" Plugin 'jimenezrick/vimerl'
" Plugin 'rson/vim-conque'
" Plugin 'Lokaltog/vim-powerline'
" Plugin 'myusuf3/numbers.vim'
" Plugin 'JSON.vim'
" Plugin 'jsoncodecs.vim'
" Plugin 'jsruntime.vim'
" Plugin 'narrow_region'
" Plugin 'sourcebeautify.vim'
" Plugin 'speeddating.vim'
" Plugin 'utl.vim'
" Plugin 'vim-json-bundle'
" Plugin 'pydave/AsyncCommand'
" Plugin 'calendar.vim'
" Plugin 'scala.vim'
" Plugin 'groovy.vim'
" Plugin 'repeat.vim'
" Plugin 'vim-coffee-script'
" Plugin 'closetag.vim'
" Plugin 'dbeniamine/todo.txt-vim'

" Plugin 'Lokaltog/vim-easymotion'
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Plugin 'git://git.wincent.com/command-t.git'

" Plugin 'editorconfig-vim'

" Plugin 'rizzatti/dash.vim'
" Plugin 'vimoutliner/vimoutliner'

" Plugin 'saltstack/salt-vim'

" Plugin 'bling/vim-airline'
" Plugin 'farseer90718/vim-taskwarrior'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

if run_bundle_install == 1
  :PluginInstall

  silent !echo ""
  silent !echo "Vim is now ready."
  :cq
endif
