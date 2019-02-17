
nnoremap <Up> :echoe "Use k"<CR>set encoding=utf-8

set backspace=2   " Backspace deletes like most programs in insert mode

set nobackup " Switch off automatic creation of backup files
set nowritebackup
set noswapfile

set history=50 " Number of lines that are remembered
set ruler " Show the cursor position all the time
set showcmd " Displays incomplete commands at bottom right of window
set incsearch " Do incremental searching
set autowrite " Automatically :write before running commands

syntax on " Syntax highlighting
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab

" Make it obvious where 80 characters is
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

" Numbers
set number
set numberwidth=2

" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
set wildmode=list:longest,list:full
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<Tab>"
    else
        return "\<C-p>"
    endif
endfunction
inoremap <Tab> <C-r>=InsertTabWrapper()<CR>
inoremap <S-Tab> <C-n>

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

