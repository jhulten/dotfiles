vmap <tab> >gv
vmap <s-tab> <gv

map <leader>t :CtrlP<CR>
map <leader>b :CtrlPBuffer<CR>
map <leader>d :execute 'NERDTreeToggle ' . getcwd()<CR>
map <leader>j :TagbarToggle<CR>

" Hold command to do the g for softwrap
vmap <D-j> gj
vmap <D-k> gk
vmap <D-4> g$
vmap <D-6> g^
vmap <D-0> g^
nmap <D-j> gj
nmap <D-k> gk
nmap <D-4> g$
nmap <D-6> g^
nmap <D-0> g^

nnoremap <silent> <Leader>/ :nohlsearch<CR>

nmap <silent> <leader>gs :Gstatus<cr>
nmap <silent> <leader>ge :Gedit<cr>
nmap <silent> <leader>gd :Gdiff<cr>
nmap <silent> <leader>gP :Git push<cr>
nmap <silent> <leader>gp :Git pull<cr>
let g:Gitv_OpenHorizontal = 1
nmap <silent> <leader>gv :Gitv<cr>
nmap <silent> <leader>gV :Gitv --all<cr>

" Don't use Ex mode, use Q for formatting
map Q gq

