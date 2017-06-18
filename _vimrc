" ---------------------------------------------------------------------
" Initialise Vundle
" ---------------------------------------------------------------------
set nocompatible              " be iMproved, required
filetype off                  " required
filetype plugin on
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" ---------------------------------------------------------------------
" Plugins
" ---------------------------------------------------------------------
Plugin 'vim-scripts/summerfruit256.vim'
Plugin 'vim-scripts/256-jungle'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdtree'
Plugin 'Shougo/unite.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'fatih/vim-go'
Plugin 'tomasr/molokai'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'rhysd/vim-clang-format'
Plugin 'albertorestifo/github.vim'

" ---------------------------------------------------------------------
" Vundle done
" ---------------------------------------------------------------------
call vundle#end()
filetype plugin indent on

" ---------------------------------------------------------------------
" Configure plugins
" ---------------------------------------------------------------------
let mapleader = "="

" colour schemes
syntax enable
set t_Co=256
if filereadable(expand("~/.terminal.light"))
    set background=light
    colorscheme github
    highlight ColorColumn ctermbg=253
    highlight Normal ctermbg=none
else
    set background=dark
    colorscheme molokai
    highlight NonText ctermfg=238 ctermbg=none
    highlight ColorColumn ctermbg=233
    highlight Directory ctermfg=11 ctermbg=none
    highlight LineNr ctermfg=237 ctermbg=233
    highlight SpecialKey ctermfg=237 ctermbg=none
    highlight Comment ctermfg=246 ctermbg=none
    highlight MatchParen ctermfg=white ctermbg=236
    highlight Normal ctermbg=none
endif

" Airline statusline
let g:airline_powerline_fonts = 1
if filereadable(expand("~/.terminal.light"))
    let g:airline_theme='silver'
else
    let g:airline_theme='serene'
endif
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''

" Tab stuff
set hidden
nmap <leader>t :enew<cr>
nmap <leader>] :bnext<CR>
nmap <leader>[ :bprevious<CR>
nmap <leader>T :bp <BAR> bd #<CR>

" NERDTree
map <leader>f :NERDTreeToggle<cr>
let NERDTreeShowLineNumbers=0
let NERDTreeShowHidden=1
let NERDTreeIgnore = ['\.o$', '\.swp', '.dirstamp', '.deps']

" Unite
let g:unite_source_history_yank_enable = 1
call unite#filters#matcher_default#use(['matcher_fuzzy'])
nnoremap <leader>y :<C-u>Unite -no-split -buffer-name=yank    history/yank<cr>
nnoremap <leader>b :<C-u>Unite -no-split -buffer-name=buffer  buffer<cr>

" Ctrl-P
let g:ctrlp_max_files=0

" Vim Go
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

"Clang format

let g:clang_format#code_style = "google"
let g:clang_format#style_options = {
            \ "UseTab" : "Never",
            \ "Standard" : "C++11"}

" map to <Leader>cf in C++ code
autocmd FileType c,cpp,h nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,h vnoremap <buffer><Leader>cf :ClangFormat<CR>
nmap <Leader>C :ClangFormatAutoToggle<CR>
autocmd FileType c,h,cpp ClangFormatAutoEnable

" ---------------------------------------------------------------------
"  Settings
" ---------------------------------------------------------------------
set autoindent                    " Auto Indent
set backspace=indent,eol,start    " Intuitive backspacing.
set colorcolumn=80                " Highlight column 80
set expandtab                     " Use spaces instead of tabs
set fillchars+=vert:│,fold:─      " Nicer split char
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

" buffer navigation
nnoremap <silent> <F2> :bp<cr>
nnoremap <silent> <F3> :bn<cr>
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9

" Re-read vimrc
nmap <silent> <leader>R :so $MYVIMRC<cr>

" Toggle line numbers and invisible chars
map <leader>n :set nonumber!<cr>:set nolist!<cr>: set norelativenumber!<cr>

" Toggle relative line numbering
nnoremap <leader>N :set relativenumber!<cr>

" Paste mode toggle
map <leader>p :set invpaste<cr>

" Clear last search by hitting return
nnoremap <cr> :noh<cr><cr>

" Splitting
" window
nmap <leader>swh :topleft vnew<CR>
nmap <leader>swl :botright vnew<CR>
nmap <leader>swk :topleft new<CR>
nmap <leader>swj :botright new<CR>
" buffer
nmap <leader>sh  :leftabove vnew<CR>
nmap <leader>sl  :rightbelow vnew<CR>
nmap <leader>sk  :leftabove new<CR>
nmap <leader>sj  :rightbelow new<CR>

" 4 spaces for python
au FileType python setlocal tabstop=4 expandtab shiftwidth=4 softtabstop=4

" 2 spaces for C
au FileType cpp,c,h setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2

" tabs for go
au FileType go setlocal tabstop=2
au FileType go setlocal noexpandtab

" edit binary files
augroup Binary
  au!
  au BufReadPre  *.bin let &bin=1
  au BufReadPost *.bin if &bin | %!xxd
  au BufReadPost *.bin set ft=xxd | endif
  au BufWritePre *.bin if &bin | %!xxd -r
  au BufWritePre *.bin endif
  au BufWritePost *.bin if &bin | %!xxd
  au BufWritePost *.bin set nomod | endif
augroup END

" Source local vim rc
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif

" Enable mouse
" set mouse=a
