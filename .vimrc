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
Plugin 'chriskempson/base16-vim'

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

" leader-d docstring
nnoremap <leader>d i"""<CR>"""<Esc>O

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

" Colors =====================================================================

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

