
set nocompatible
set number
set showmode
set ruler
set showcmd
set showmatch
set laststatus=2
set statusline=[%{&fileencoding}][\%{&fileformat}]\ %F%m%r%=<%c:%l>
 
syntax on
set hlsearch
set smartindent
 
set expandtab
set ts=2 sw=2 sts=2
 
set hidden
 
" netrwは常にtree view
let g:netrw_liststyle = 3
" 'v'でファイルを開くときは右側に開く。(デフォルトが左側なので入れ替え)
let g:netrw_altv = 1
" 'o'でファイルを開くときは下側に開く。(デフォルトが上側なので入れ替え)
let g:netrw_alto = 1
 
"edit .vimrc
nnoremap <silent> <Space>ev  :<C-u>tabnew $MYVIMRC<CR>
nnoremap <silent> <Space>eg  :<C-u>tabnew $MYGVIMRC<CR>
"reload .vimrc
nnoremap <silent> <Space>rv :<C-u>source $MYVIMRC \| if has('gui_running') \| source $MYGVIMRC \| endif <CR>
nnoremap <silent> <Space>rg :<C-u>source $MYGVIMRC<CR>
 
au BufNewFile,BufRead *.rb set ts=2 sw=2 sts=0
au BufNewFile,BufRead *.js set ts=2 sw=2 sts=0
au BufNewFile,BufRead *.html set ts=2 sw=2 sts=0
au BufNewFile,BufRead *.css set ts=2 sw=2 sts=0
au BufNewFile,BufRead *.less set ts=2 sw=2 sts=0
au BufNewFile,BufRead *.scss set ts=2 sw=2 sts=0
  
