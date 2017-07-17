set hidden
set number
set wildignore=*.o,*~,*.pyc
set title

set mouse=a


set ignorecase
set vb " turns off visual bell
set smartindent

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



" Suppress lustyjuggler warnings
let g:LustyJugglerSuppressRubyWarning = 1


set backupdir=~/.vimbackup//,/tmp//
set directory=~/.vimswaps//,/tmp//

set backup    " keep a backup file
set showcmd   " display incomplete commands

if has("gui_running")
  set guioptions=egmrt
endif



