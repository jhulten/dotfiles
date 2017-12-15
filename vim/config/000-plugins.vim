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
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-dotenv'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-tbone'
Plug 'tpope/vim-commentary', { 'on': '<Plug>Commentary' }
" Plug 'tpope/vim-markdown'
" Plug 'tpope/vim-haml'
" Plug 'tpope/vim-rails'
" Plug 'tpope/vim-leiningen'
" Plug 'tpope/vim-fireplace'
" Plug 'tpope/vim-sexp-mappings-for-regular-people'


" VCS: Git
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'mhinz/vim-signify'
Plug 'junegunn/vim-github-dashboard', { 'on': ['GHDashboard', 'GHActivity'] }
let g:github_dashboard = { 'username': 'jhulten', 'password': $HOMEBREW_GITHUB_API_TOKEN }
let g:Gitv_OpenHorizontal = 1
nmap <silent> <leader>gs :Gstatus<cr>
nmap <silent> <leader>ge :Gedit<cr>
nmap <silent> <leader>gd :Gdiff<cr>
nmap <silent> <leader>gP :Git push<cr>
nmap <silent> <leader>gp :Git pull<cr>
nmap <silent> <leader>gv :Gitv<cr>
nmap <silent> <leader>gV :Gitv --all<cr>

" Color Schemes
Plug 'lifepillar/vim-solarized8'
Plug 'altercation/vim-colors-solarized'

Plug 'b4b4r07/vim-hcl'

" Airline, for status and more
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='solarized'
let g:airline_solarized_bg='dark'

" TmuxLine, for TMUX
Plug 'edkolev/tmuxline.vim'

Plug 'junegunn/vim-peekaboo'

Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
map <leader>d :execute 'NERDTreeToggle ' . getcwd()<CR>
augroup nerd_loader
  autocmd!
  autocmd VimEnter * silent! autocmd! FileExplorer
  autocmd BufEnter,BufNew *
        \  if isdirectory(expand('<amatch>'))
        \|   call plug#load('nerdtree')
        \|   execute 'autocmd! nerd_loader'
        \| endif
augroup END

Plug 'justinmk/vim-gtfo'

Plug 'majutsushi/tagbar'
map <leader>j :TagbarToggle<CR>

Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
if has("persistent_undo")
    set undodir=~/.undodir/
    set undofile
endif

Plug 'kien/ctrlp.vim'
let g:ctrlp_working_path_mode = 'ra'
map <leader>t :CtrlP<CR>
map <leader>b :CtrlPBuffer<CR>

Plug 'mileszs/ack.vim'
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" Snippets and Autocomplete
" Load on nothing
"      Plug 'SirVer/ultisnips', { 'on': [] }
Plug 'Valloric/YouCompleteMe', { 'on': [] }

function! BuildYCM(info)
  if a:info.status == 'installed' || a:info.force
    !./install.py --clang-completer --gocode-complete --racer-completer --tern-completer
  endif
endfunction

augroup load_us_ycm
  autocmd!
  autocmd InsertEnter * call plug#load('YouCompleteMe')
                     \| autocmd! load_us_ycm
augroup END

" Plug 'kien/rainbow_parentheses.vim'

" Dash, for lookups
Plug 'rizzatti/dash.vim'

" Syntastic settings
Plug 'vim-syntastic/syntastic'
let g:syntastic_auto_loc_list=1
let g:syntastic_enable_balloons = 1
let g:syntastic_auto_jump=1
let g:syntastic_ruby_exec = "~/.rubies/chefdk/bin/ruby"

" Lang: Golang
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
au FileType go nmap <Leader>s <Plug>(go-implements)
au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <Leader>gb <Plug>(go-doc-browser)
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap gd <Plug>(go-def)
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)
au FileType go nmap <Leader>e <Plug>(go-rename)

let g:go_fmt_command = "goimports"

" Lang: Elixir
Plug 'elixir-lang/vim-elixir'

" Lang: Coffeescript
Plug 'kchmck/vim-coffee-script'
Plug 'lukaszkorecki/CoffeeTags'
let g:CoffeeAutoTagDisabled=0     " Disables autotaging on save (Default: 0 [false])
"let g:CoffeeAutoTagFile=<filename>       " Name of the generated tag file (Default: ./tags)
let g:CoffeeAutoTagIncludeVars=0  " Includes variables (Default: 0 [false])
let g:CoffeeAutoTagTagRelative=1  " Sets file names to the relative path from the tag file location to the tag file location (Default: 1 [true])

" Lang: Node.js
Plug 'moll/vim-node'

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
