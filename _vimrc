" turn off vi compatibility 
set nocompatible

" use pathogen to load everything in .vim/bundle
call pathogen#infect()

" color syntax highlightinh
syntax on

" load indent file based on file type
filetype plugin indent on

" colorscheme stuff
set background=light
set t_Co=256
let g:solarized_termtrans=1
let g:solarized_termcolors=256
let g:solarized_visibility="low"
colorscheme solarized
call togglebg#map("<F5>")
