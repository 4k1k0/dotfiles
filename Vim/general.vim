" <!-- [3] General
"
" Goodbye vi
set nocompatible
set history=1000
set noswapfile
set nobackup

" Modify indenting settings
"
set autoindent
set expandtab
set shiftwidth=4
set softtabstop=4
set autoread
filetype on

" Some programming languages work better when only 2 spaces padding is used.
"
autocmd FileType html,css,sass,scss,javascript,typescript setlocal sw=2 sts=2
autocmd FileType json setlocal sw=2 sts=2
autocmd FileType ruby,eruby setlocal sw=2 sts=2
autocmd FileType yaml setlocal sw=2 sts=2

" Other options
"
set encoding=utf-8
set backspace=indent,eol,start
set hidden
set colorcolumn=80
set laststatus=2
set noshowmode
inoremap { {}<Esc>i
inoremap ( ()<Esc>i
inoremap [ []<Esc>i

" Number line, switch between relative and absolute.
"
set relativenumber
nmap <F5> :set relativenumber! number!<CR>
imap <F5> <ESC>:set relativenumber! number!<CR>a

" I don't remember what this does lol
augroup auto_checktime
  autocmd!
  autocmd FocusGained,BufEnter,CursorHold * silent! checktime
augroup end

"
" --> [3] General
