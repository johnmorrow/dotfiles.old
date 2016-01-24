" ---------------------------------------------------------------------
" Initialise Vundle
" ---------------------------------------------------------------------
set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" ---------------------------------------------------------------------
" Plugins
" ---------------------------------------------------------------------
Plugin 'vim-scripts/summerfruit256.vim'
Plugin 'vim-scripts/256-jungle'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/nerdtree'
Plugin 'Shougo/unite.vim'
Plugin 'kien/ctrlp.vim'

" ---------------------------------------------------------------------
" Vundle done
" ---------------------------------------------------------------------
call vundle#end()

" ---------------------------------------------------------------------
" Configure plugins
" ---------------------------------------------------------------------

" colour schemes
syntax enable
set t_Co=256
if filereadable(expand("~/.terminal.light"))
    set background=light
    colorscheme summerfruit256
    highlight Normal ctermbg=none
    highlight NonText ctermfg=10 ctermbg=none
    highlight LineNr ctermfg=251 ctermbg=254
else
    set background=dark
    colorscheme 256-jungle
    highlight Normal ctermbg=none
    highlight NonText ctermfg=238 ctermbg=none
    highlight ColorColumn ctermbg=233
endif

" Airline statusline
let g:airline_powerline_fonts = 1
let g:airline_theme='powerlineish'

" NERDTree
map <leader>f :NERDTreeToggle<cr>

" Unite
let g:unite_source_history_yank_enable = 1
call unite#filters#matcher_default#use(['matcher_fuzzy'])
nnoremap <leader>y :<C-u>Unite -no-split -buffer-name=yank    history/yank<cr>
nnoremap <leader>b :<C-u>Unite -no-split -buffer-name=buffer  buffer<cr>

" Ctrl-P
let g:ctrlp_max_files=0

" ---------------------------------------------------------------------
"  Settings
" ---------------------------------------------------------------------
set autoindent                    " Auto Indent
set backspace=indent,eol,start    " Intuitive backspacing.
set colorcolumn=80                " Highlight column 80
set expandtab                     " Use spaces instead of tabs
set hidden                        " Handle multiple buffers better.
set hlsearch                      " Highlight matches.
set ignorecase                    " Case-insensitive searching.
set incsearch                     " Highlight matches as you type.
set laststatus=2                  " Show the status line all the time
set list                          " Show invisibles
set listchars=tab:▸\ ,eol:˜       " Set invisible characters
set nowrap                        " Turn off line wrapping.
set number                        " Show line numbers.
set relativenumber                " Show relative line numbers.
set ruler                         " Show cursor position.
set scrolloff=5                   " Show 3 lines of context around the cursor.
set shiftwidth=2                  " autoindent width
set showcmd                       " Display incomplete commands.
set showmatch                     " Highlight matching brackets
set showmode                      " Display the mode you're in.
set smartindent                   " Smart Indent
set smartcase                     " But case-sensitive if expression contains a capital letter.
set tabstop=2                     " Global tab width.
set visualbell                    " No beeping.
set wildmenu                      " Enhanced command line completion.
set wildmode=list:longest         " Complete files like a shell.

" ---------------------------------------------------------------------
"  Mappings
" ---------------------------------------------------------------------

let mapleader = "="

" Re-read vimrc
nmap <silent> <leader>rr :so $MYVIMRC<cr>

" Toggle line numbers and invisible chars
map <leader>n :set nonumber!<cr>:set nolist!<cr>: set norelativenumber!<cr>

" Paste mode toggle
map <leader>p :set invpaste<cr>

" Toggle relative line numbering
nnoremap <silent><leader>r :set relativenumber!<cr>

" Clear last search by hitting return
nnoremap <cr> :noh<cr><cr>

" ---------------------------------------------------------------------
"  4 spaces for python
"
au FileType python setlocal tabstop=4 expandtab shiftwidth=4 softtabstop=4

" ---------------------------------------------------------------------
"  Source local vim rc
"
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif
