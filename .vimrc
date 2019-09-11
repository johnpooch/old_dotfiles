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

" ----------------------------------------------------------------------------
" Tim Pope Plugins
" ----------------------------------------------------------------------------

" Dates
Plugin 'tpope/vim-speeddating'

" Bracket Surround
Plugin 'tpope/vim-surround'

" Comment stuff out
Plugin 'tpope/vim-commentary'

" Git wrapper
Plugin 'tpope/vim-fugitive'

" Disables search highlighting when you are done searching
Plugin 'romainl/vim-cool'

" Python indentation
Plugin 'hynek/vim-python-pep8-indent'

" Python folding
Plugin 'tmhedberg/simpylfold'

" " LISP
" Plugin 'neoclide/coc.nvim', {'branch': 'release'}

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

" Linting
Plugin 'w0rp/ale'

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
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|static\'

" change cursor and highlight bar when in insert mode
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif
autocmd InsertEnter * set cul
autocmd InsertLeave * set nocul

" color highlighted tab
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*.pyc

set history=50 " Number of lines that are remembered
set ruler " Show the cursor position all the time
set showcmd " Displays incomplete commands at bottom right of window
set incsearch " Do incremental searching
set autowrite " Automatically :write before running commands

syntax on " Syntax highlighting
autocmd BufNewFile,BufRead *.coveragerc set syntax=dosini
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab
"
" Use tabs for html and jinja2
autocmd BufRead,BufNewFile *.htm,*.html setlocal noexpandtab
autocmd BufRead,BufNewFile *.j2 setlocal noexpandtab

" Use jinja filetype for j2
augroup jinja_ft
  au!
  autocmd BufNewFile,BufRead *.j2 set filetype=jinja
augroup END

" Make space more useful
nnoremap <space> zA
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
set number          " Show line numbers
set relativenumber  " Use relative line numbers
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
nnoremap <leader>ev :vsplit ~/.vimrc<cr>
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

let tw = 79

" Fill rest of line with characters ------------------------------------------

function! FillLine( str )
    " set tw to the desired total length
    let tw = &textwidth
    if tw==0 | let tw = 79 | endif
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
" Ctags
" ============================================================================

nnoremap <leader>t :!ctags -R --exclude=node_modules -f ./tags $(python3 -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())")<CR>

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
" Spell
" ============================================================================

" augroup spelling
"   autocmd!
"   autocmd BufEnter,WinEnter,FileType python
"         \ set spell
" augroup END

set spelllang=en_us

" ============================================================================
" SignColumn
" ============================================================================

" SignColumn always appears
set signcolumn=yes

" ============================================================================
" Folds
" ============================================================================

let g:SimpylFold_fold_docstring = 0

set fillchars=fold:\  " Not trailing whitespace.

function! MyFoldText()
    let w = winwidth(0) - &foldcolumn - (&number ? 8 : 0)
    let line = getline(v:foldstart)
    let comment = substitute(line, '/\*\|\*/\|{{{\d\=', '', 'g')
    let txt = '' . comment
    return txt
endfunction

set foldtext=MyFoldText()

" ============================================================================
" Colors
" ============================================================================

colorscheme base16-default-dark
let base16colorspace=256  " Access colors present in 256 colorspace

augroup columnLimit
  autocmd!
  autocmd BufEnter,WinEnter,FileType python
        \ highlight CollumnLimit ctermbg=DarkGrey guibg=DarkGrey
  let collumnLimit = 80 " feel free to customize
  let pattern =
        \ '\%<' . (collumnLimit+1) . 'v.\%>' . collumnLimit . 'v'
  autocmd BufEnter,WinEnter,FileType python
        \ let w:m1=matchadd('CollumnLimit', pattern, -1)
augroup END

" Line number bar
highlight LineNr term=bold cterm=NONE ctermfg=DarkGray ctermbg=NONE gui=NONE
            \ guifg=DarkGrey guibg=NONE

" vsplit/split column
hi VertSplit ctermbg=NONE ctermfg=NONE
hi StatusLineNC ctermbg=bg ctermfg=fg

" Status bar
hi StatusLine ctermbg=bg ctermfg=white

" Cursor Line
hi CursorLine term=bold cterm=bold ctermbg=bg
hi CursorLineNr ctermbg=green ctermfg=black

" Visual
hi Visual ctermbg=White ctermbg=DarkGrey

" Todo
hi Todo ctermbg=White ctermbg=DarkGrey

" Search
hi Search cterm=NONE ctermfg=white ctermbg=DarkRed

" Folds
hi Folded ctermfg=blue ctermbg=none

" SignColumn
hi SignColumn ctermbg=none

" Autocomplete menu
hi Pmenu ctermbg=white ctermfg=black
hi PmenuSel ctermfg=black
