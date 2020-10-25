" <-- [5] Plugins Configuration
"
" NerdTree
"
map <Leader>n :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen=1
" enable line numbers
let NERDTreeShowLineNumbers=1
" make sure relative line numbers are used
autocmd FileType nerdtree setlocal relativenumber


" COC
"
nmap <Leader>gd <Plug>(coc-definition)
nmap <Leader>gr <Plug>(coc-references)
nnoremap <C-p> :GFiles<CR>

" Vim-closetag
"
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.html.erb,*.xml.erb,*.xml,*php"
"

" Ale
"
let g:ale_fix_on_save = 1
let g:ale_linters = {
\ 'javascript': ['standard'],
\ 'typescript': ['prettier'],
\ 'json': ['prettier']
\ }
let g:ale_fixers = {
\ '*': ['remove_trailing_lines', 'trim_whitespace'],
\ 'javascript': ['standard'],
\ 'typescript': ['prettier'],
\ 'json': ['prettier']
\ }

" Airline
"
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='gruvbox'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

" vim-commentary
"
map <Leader>c :Commentary<CR>

" Vim gutter
"
set updatetime=100
