set hidden
set number
set wildmenu
set wildignore=*.o,*~,*.pyc
set title

set mouse=a

set softtabstop=2
set shiftwidth=2
set tabstop=2
set autoindent
" Use spaces instead of tabs
set expandtab

if has("gui_gtk2")
  set guifont=Inconsolata\ 12
else
  set guifont=Inconsolata:h12
endif

set ignorecase
set vb " turns off visual bell
set smartindent

if has("gui_gtk2")
  set guifont=Inconsolata\ 12
else
  set guifont=Inconsolata:h12
endif

compiler ruby

set splitbelow       " open new window below current one on split
set splitright       " open new window to right current one on split

let g:gist_detect_filetype = 1
let g:tagbar_autofocus = 1

" ConqueTerm settings
let g:ConqueTerm_ReadUnfocused = 1
nmap <silent> <Leader>h :ConqueTermSplit zsh<cr>

let python_highlight_all = 1
let g:Powerline_symbols = 'fancy'

set grepprg=ack
set grepformat=%f:%l:%m

nnoremap <silent> <Leader>/ :nohlsearch<CR>

nmap <silent> <leader>gs :Gstatus<cr>
nmap <silent> <leader>ge :Gedit<cr>
nmap <silent> <leader>gd :Gdiff<cr>
nmap <silent> <leader>gP :Git push<cr>
nmap <silent> <leader>gp :Git pull<cr>
let g:Gitv_OpenHorizontal = 1
nmap <silent> <leader>gv :Gitv<cr>
nmap <silent> <leader>gV :Gitv --all<cr>

" CSApprox
if (&term == 'xterm')
  set t_Co=256
endif

" Suppress lustyjuggler warnings
let g:LustyJugglerSuppressRubyWarning = 1

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set backupdir=~/.vimbackup//,/tmp//
set directory=~/.vimswaps//,/tmp//

if has("vms")
  set nobackup    " do not keep a backup file, use versions instead
else
  set backup    " keep a backup file
endif
set history=500   " keep 500 lines of command line history
set ruler   " show the cursor position all the time
set showcmd   " display incomplete commands
set incsearch   " do incremental searching

if has("gui_running")
  set guioptions=egmrt
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Enable file type detection.
" Use the default filetype settings, so that mail gets 'tw' set to 72,
" 'cindent' is on in C files, etc.
" Also load indent files, to automatically do language-dependent indenting.
filetype plugin indent on

