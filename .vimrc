set nocompatible " off when a vimrc is found 
filetype off

" =============================================================================
" Plugins
" =============================================================================

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" File system explorer
Plugin 'scrooloose/nerdtree'

" Yaml syntax and indentation
Plugin 'mrk21/yaml-vim'

" Org mode
Plugin 'jceb/vim-orgmode'

" Dates
Plugin 'tpope/vim-speeddating'

" Hyperlinking
Plugin 'utl.vim'

" Repeat
Plugin 'tpope/vim-repeat'

" Tag List
Plugin 'taglist.vim'

" Tag Bar
Plugin 'majutsushi/tagbar'

" Narrow Region
Plugin 'chrisbra/nrrwrgn'

" Syntax Range
Plugin 'SyntaxRange'

" Statusline
Plugin 'powerline/powerline'

" Fuzzy Finder
Plugin 'kien/ctrlp.vim'

" JS syntax highlighting and indentation
Plugin 'pangloss/vim-javascript'

" Folding
" Plugin 'btpht/python_editing'

" Bracket Surround
Plugin 'tpope/vim-surround'

" Tmux/vim pane navigation
Plugin 'christoomey/vim-tmux-navigator'

" Color schemes
Plugin 'flazz/vim-colorschemes'

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

nnoremap <Up> :echoe "Use k"<CR>set encoding=utf-8
let mapleader=","
set backspace=2 " Backspace deletes like most programs in insert mode
set clipboard=unnamed " Normal copy & paste

set nobackup " Switch off automatic creation of backup files
set nowritebackup
set noswapfile

set history=50 " Number of lines that are remembered
set ruler " Show the cursor position all the time
set showcmd " Displays incomplete commands at bottom right of window
set incsearch " Do incremental searching
set autowrite " Automatically :write before running commands

syntax on " Syntax highlighting
set tabstop=4
set shiftwidth=4
set expandtab

" Use the same symbols as TextMate for tabstops and EOLs
set list
set listchars=tab:▸\ ,eol:¬

" Make it obvious where 80 characters is
set cc=80
highlight ColorColumn ctermbg=8

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

if &diff
    colorscheme molokai
endif

"Surround code with braces
nmap <Leader>{} O{<Esc>ddj>>ddkP
vmap <Leader>{} <Esc>o{<Esc>ddgv>gvdp

" Easier navigation between splits
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Easier moving between tabs
map <Leader>n <Esc>:tabprevious<CR>
map <Leader>m <Esc>:tabnext<CR>

" Map sort function to a key
vnoremap <Leader>s :sort<CR>

" Easier moving blocks
vnoremap < <gv
vnoremap > >gv

" easier formatting of paragraphs
vmap Q gq
nmap Q gqap

