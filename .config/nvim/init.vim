colorscheme gruvbox

set rtp+=~/.fzf
set number
set scrolloff=5
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set nowrap
set omnifunc=syntaxcomplete#Complete
set completeopt=longest,menuone    

" switch between tabs without writing file
set hidden
nnoremap <C-n> :bnext<CR>
nnoremap <C-p> :bprev<CR>

" map pop up menu selection to tab
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" disable automatic comments
autocmd BufEnter * set formatoptions-=r formatoptions-=c formatoptions-=o

" start terminal in insert mode, disable line numbers
autocmd TermOpen term://* startinsert
autocmd TermOpen * setlocal nonumber norelativenumber

" highlight character in column 80 and 89 (pep8 79 and black 88 character limits) 
" autocmd BufEnter * required because gruvbox overrides ctermbg to gray
autocmd BufEnter * highlight ColorColumn ctermbg=DarkMagenta
autocmd BufEnter * call matchadd('ColorColumn', '\%80v.', 100) 
autocmd BufEnter * call matchadd('ColorColumn', '\%89v.', 100) 

" remove trailing whitespace when python file is written
autocmd BufWritePre *.py %s/\s\+$//e

inoremap jk <esc>

nnoremap <leader>w :update<CR>

nnoremap <F4> :w<cr> :term python '%'<cr>
nnoremap <F5> :w<cr> :term ipython -i '%'<cr>
nnoremap <F6> :w<cr> :term pudb '%'<cr> 
nnoremap <F7> :w<cr> :term flake8 '%'<cr>

" map F8 to run pydoc on current word
nnoremap <buffer> <F8> :<C-u>execute "term pydoc " . expand("<cword>")<CR>

" use deoplete
" let g:deoplete#enable_at_startup = 1
autocmd Filetype python call deoplete#enable()
autocmd Filetype haskell call deoplete#enable()
autocmd Filetype c call deoplete#enable()

" deactivate jedi-vim completion, only use other features
let g:jedi#completions_enabled = 0

" haskell-vim indentation
let g:haskell_indent_if = 4
let g:haskell_indent_case = 4
let g:haskell_indent_let = 4
let g:haskell_indent_where = 4
let g:haskell_indent_before_where = 2
let g:haskell_indent_after_bare_where = 2
let g:haskell_indent_do = 4
let g:haskell_indent_in = 4
let g:haskell_indent_guard = 4
