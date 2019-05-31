set nocompatible " off when a vimrc is found 

filetype on

" =============================================================================
" Plugins
" =============================================================================

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Dates
Plugin 'tpope/vim-speeddating'

" Bracket Surround
Plugin 'tpope/vim-surround'

" Color schemes
Plugin 'chriskempson/base16-vim'

" Tmux/vim pane navigation
Plugin 'christoomey/vim-tmux-navigator'

" Tag List
Plugin 'taglist.vim'

" Yaml syntax and indentation
Plugin 'mrk21/yaml-vim'

" Statusline
Plugin 'powerline/powerline'

" Fuzzy Finder
Plugin 'kien/ctrlp.vim'

" JS syntax highlighting and indentation
Plugin 'pangloss/vim-javascript'

" Jinja2 syntax highlighting
Plugin 'glench/vim-jinja2-syntax'

" Status for vim
Plugin 'bling/vim-airline'

" Keep Plugin commands between vundle#begin/end. 
call vundle#end()
filetype plugin indent on

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal

" =============================================================================
" Config
" =============================================================================


" Leader key shortcuts --------------------------------------------------------
" 
let mapleader=","

set backspace=2 " Backspace deletes like most programs in insert mode
set clipboard=unnamed " Normal copy & paste

set nobackup " Switch off automatic creation of backup files
set nowritebackup
set noswapfile

" Fuzzy find -------------------------------------------------------------------

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_use_caching = 1
let g:ctrlp_show_hidden = 0
let g:ctrlp_open_new_file = 'v'
"
" color highlighted tab
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*.pyc

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
"
" Use tabs for html
autocmd BufRead,BufNewFile *.htm,*.html setlocal noexpandtab

" Use jinja filetype for j2
augroup jinja_ft
  au!
  autocmd BufNewFile,BufRead *.j2 set filetype=jinja
augroup END

" Make space more useful
nnoremap <space> za
"
" Use the same symbols as TextMate for tabstops and EOLs
set list
set listchars=tab:▸\ ,eol:¬

set fillchars+=vert:│
hi StatusLine ctermbg=NONE ctermfg=NONE

" Fuzzy find. Search down into folders
set path+=**
set wildmenu

" Numbers
set number
set numberwidth=2

" Ignore certain pep rules
let g:pymode_lint_ignore = ["E501", "W",]

" Disable tmux navigator when zooming the Vim pane
let g:tmux_navigator_disable_when_zoomed = 1

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

"Surround code with braces
nnoremap <Leader>{} O{<Esc>ddj>>ddkP
vnoremap <Leader>{} <Esc>o{<Esc>ddgv>gvdp

" Easier navigation between splits
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Easier moving between tabs
noremap <Leader>n <Esc>:tabprevious<CR>
noremap <Leader>m <Esc>:tabnext<CR>

" Map sort function to a key
vnoremap <Leader>s :sort<CR>

" Easier moving blocks
vnoremap < <gv
vnoremap > >gv

" easier formatting of paragraphs
vnoremap Q gq
nnoremap Q gqap

" delete line in insert mode
inoremap <C-d> <Esc>ddi

" convert the current word to uppercase in normal mode
nnoremap <C-u> viw~e

" convert the current word to uppercase in insert mode
inoremap <C-u> <Esc>viwUea

" move lines up and down
" TODO: _ doesn't work on bottom line
" TODO: _ doesn't work on top line
noremap - ddp
noremap _ ddkP

" Edit dotfiles ---------------------------------------------------------------
"
" Vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Bash profile
nnoremap <leader>eb :vsplit ~/.bash_profile<cr>
nnoremap <leader>sb :source ~/.bash_profile<cr>


" strong moves
nnoremap H ^
nnoremap L $

" Use jk to escape in insert mode
inoremap jk <Esc> 
inoremap <Up> <nop>
inoremap <Down> <nop>
inoremap <Left> <nop>
inoremap <Right> <nop>

" Add comment
" TODO: comment out should work like a toggle
autocmd FileType javascript nnoremap <buffer> <localleader>c A  // <esc>
autocmd FileType python     nnoremap <buffer> <localleader>c A  # <esc>

autocmd FileType javascript nnoremap <buffer> <localleader>C I// <esc>
autocmd FileType python     nnoremap <buffer> <localleader>C I# <esc>

" Fill rest of line with characters ------------------------------------------

function! FillLine( str )
    " set tw to the desired total length
    let tw = &textwidth
    if tw==0 | let tw = 80 | endif
    " strip trailing spaces first
    .s/[[:space:]]*$//
    " calculate total number of 'str's to insert
    let reps = (tw - col("$")) / len(a:str)
    " insert them, if there's room, removing trailing spaces (though forcing
    " there to be one)
    if reps > 0
        .s/$/\=(' '.repeat(a:str, reps))/
    endif
endfunction
map <Leader>f= :call FillLine( '=' )<cr>
map <Leader>f- :call FillLine( '-' )<cr>

" ============================================================================
" Status line
" ============================================================================

let g:airline#extensions#tabline#enabled = 1

" ============================================================================
" Buffers
" ============================================================================

"Easy changing between buffers
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>

" Delete buffer
nnoremap <C-X> :bdelete<CR>

" ============================================================================
" Nvim Terminal
" ============================================================================

" Maps ESC to exit terminal's insert mode
if has('nvim')
  tnoremap <Esc> <C-\><C-n>
endif

if has('nvim')
  augroup neovim_terminal
    autocmd!
    " Enter Terminal-mode (insert) automatically
    autocmd TermOpen * startinsert
    " Disables number lines on terminal buffers
    autocmd TermOpen * :set nonumber norelativenumber
  augroup END
endif

" ============================================================================
" Colors
" ============================================================================

colorscheme base16-default-dark

" Make it obvious where 80 characters is
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

" Line number bar
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE
            \ guifg=DarkGrey guibg=NONE

" vsplit/split column
hi VertSplit ctermbg=NONE ctermfg=NONE
hi StatusLineNC ctermbg=bg ctermfg=fg

" Status bar
hi StatusLine ctermbg=bg ctermfg=NONE

" Cursor Line
hi CursorLine ctermbg=None

" Visual
hi Visual ctermbg=White ctermbg=DarkGrey

