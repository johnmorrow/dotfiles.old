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
"  Rename tabs to show tab# and # of viewports
"
function! MyTabLine()
    let s = ''
    let wn = ''
    let t = tabpagenr()
    let i = 1
    while i <= tabpagenr('$')
        let buflist = tabpagebuflist(i)
        let winnr = tabpagewinnr(i)
        let s .= '%' . i . 'T'
        let s .= (i == t ? '%1*' : '%2*')
        let s .= ' '
        let wn = tabpagewinnr(i,'$')
        let s .= (i== t ? '%#TabNumSel#' : '%#TabNum#')
        let s .= i
        if tabpagewinnr(i,'$') > 1
            let s .= '.'
            let s .= (i== t ? '%#TabWinNumSel#' : '%#TabWinNum#')
            let s .= (tabpagewinnr(i,'$') > 1 ? wn : '')
        end
        let s .= ' %*'
        let s .= (i == t ? '%#TabLineSel#' : '%#TabLine#')
        let bufnr = buflist[winnr - 1]
        let file = bufname(bufnr)
        let buftype = getbufvar(bufnr, 'buftype')
        if buftype == 'nofile'
            if file =~ '\/.'
                let file = substitute(file, '.*\/\ze.', '', '')
            endif
        else
            let file = fnamemodify(file, ':p:t')
        endif
        if file == ''
            let file = '[No Name]'
        endif
        let s .= file
        let s .= (i == t ? '%m' : '')
        let i = i + 1
    endwhile
    let s .= '%T%#TabLineFill#%='
    return s
endfunction

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
set showtabline=2                 " Always show tab line
set smartindent                   " Smart Indent
set smartcase                     " But case-sensitive if expression contains a capital letter.
set statusline=[%l,%v\ %P%M]\ %f\ %r%h%w\ (%{&ff})\ %{fugitive#statusline()}
set tabline=%!MyTabLine()         " custom function for tabline
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
map <leader>t <plug>NERDTreeTabsToggle<cr>

" Toggle line numbers and invisible chars
map <leader>n :set nonumber!<CR>:set nolist!<CR>
"
" Paste mode toggle
map <leader>p :set invpaste<CR>
set pastetoggle=<leader>p

" tab mappings
nmap Z :tabprev<CR>
nmap X :tabnext<CR>
nmap <leader>1 1gt
nmap <leader>2 2gt
nmap <leader>3 3gt
nmap <leader>4 4gt
nmap <leader>5 5gt
nmap <leader>6 6gt
nmap <leader>7 7gt
nmap <leader>8 8gt
nmap <leader>9 9gt
