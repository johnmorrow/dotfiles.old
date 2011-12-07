" ---------------------------------------------------------------------
"  Pathogen stuff
"
set nocompatible
call pathogen#infect()
filetype off
syntax on
filetype plugin indent on

" ---------------------------------------------------------------------
"  Colorscheme stuff
"
set background=light
set t_Co=256
let g:solarized_termtrans=1
let g:solarized_termcolors=256
let g:solarized_visibility="low"
colorscheme solarized
call togglebg#map("<F5>")

" ---------------------------------------------------------------------
"  Settings
"
set autoindent                    " Auto Indent
set backspace=indent,eol,start    " Intuitive backspacing.
set expandtab                     " Use spaces instead of tabs
set hidden                        " Handle multiple buffers better.
set hlsearch                      " Highlight matches.
set ignorecase                    " Case-insensitive searching.
set incsearch                     " Highlight matches as you type.
set laststatus=2                  " Show the status line all the time
set list                          " Show invisibles
set listchars=tab:▸\ ,eol:¬       " Set invisible characters
set nowrap                        " Turn off line wrapping.
set number                        " Show line numbers.
set ruler                         " Show cursor position.
set scrolloff=5                   " Show 3 lines of context around the cursor.
set shiftwidth=2                  " autoindent width
set showcmd                       " Display incomplete commands.
set showmatch                     " Highlight matching brackets
set showmode                      " Display the mode you're in.
set smartindent                   " Smart Indent
set smartcase                     " But case-sensitive if expression contains a capital letter.
set statusline=[%l,%v\ %P%M]\ %f\ %r%h%w\ (%{&ff})\ %{fugitive#statusline()}
set tabstop=2                     " Global tab width.
set visualbell                    " No beeping.
set wildmenu                      " Enhanced command line completion.
set wildmode=list:longest         " Complete files like a shell.

" ---------------------------------------------------------------------
"  Highlight text past 80 chars
"
highlight OverLength ctermbg=228 ctermfg=black
match OverLength /\%81v.\+/

" ---------------------------------------------------------------------
"  Mappings
"
let mapleader = "="

nmap <silent> <leader>rr :so $MYVIMRC<cr>
"
map <leader>t :NERDTreeToggle<cr>

" map <Leader>b :TMiniBufExplorer<cr>
" map <C-j> :MBEbp<cr>
" map <C-k> :MBEbn<cr>
" map <leader>1 :1b<cr>
" map <leader>2 :2b<cr>
" map <leader>3 :3b<cr>
" map <leader>4 :4b<cr>
" map <leader>5 :5b<cr>
" map <leader>6 :6b<cr>
" map <leader>7 :7b<cr>
" map <leader>8 :8b<cr>
" map <leader>9 :9b<cr>
"
" " Toggle line numbers and invisible chars
map <leader>n :set nonumber!<CR>:set nolist!<CR>
"
" " Paste mode toggle
map <leader>p :set invpaste<CR>
set pastetoggle=<leader>p
