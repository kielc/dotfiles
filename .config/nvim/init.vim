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

" start terminal in insert mode, disable line numbers
autocmd TermOpen term://* startinsert
autocmd TermOpen * setlocal nonumber norelativenumber

" Highlight character in column 80 (pep8 79 character limit) 
" autocmd BufEnter *.* required because gruvbox overrides ctermbg to gray
autocmd BufEnter *.* highlight ColorColumn ctermbg=DarkMagenta
autocmd BufEnter *.* call matchadd('ColorColumn', '\%80v.', 100) 

" Remove trailing whitespace when python file is written
autocmd BufWritePre *.py %s/\s\+$//e

inoremap jk <esc>

nnoremap <leader>w :update<CR>

nnoremap <F4> :w<cr> :term python %<cr>
nnoremap <F5> :w<cr> :term ipython -i %<cr>
nnoremap <F6> :w<cr> :term pudb %<cr> 
nnoremap <F7> :w<cr> :term flake8 %<cr>

" Map D to run pydoc on current word
nnoremap <buffer> D :<C-u>execute "term pydoc " . expand("<cword>")<CR>

" Use deoplete
" let g:deoplete#enable_at_startup = 1
autocmd Filetype python call deoplete#enable()

" Deactivate jedi-vim completion, only use other features
let g:jedi#completions_enabled = 0
