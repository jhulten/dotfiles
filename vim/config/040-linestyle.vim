" Toggle between normal and relative line numbering
function! ToggleNumberStyle ()
  if &number
    set relativenumber
  else
    set number
  endif
endf

" Toggle between absolute and relative line numbers
nnoremap <silent> <Leader>ln :call ToggleNumberStyle()<cr>
