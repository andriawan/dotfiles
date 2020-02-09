" basic vim setting
set number
set ruler
syntax on
set encoding=utf8
set nocompatible
set wildmenu

" ignore case sensitive
set ignorecase
set smartcase

" Enable highlighting of the current line
set cursorline

call plug#begin('~/.vim/plugged')

" Plugin via VimPlug

Plug 'preservim/nerdtree'
Plug 'altercation/vim-colors-solarized'
Plug 'junegunn/fzf'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Initialize plugin system end
call plug#end()

" color scheme
colorscheme delek

" NerdtTree config
let NERDTreeShowHidden=1

" vim airlines scheme
AirlineTheme ayu_dark

" maping keyboard for shortcut
m
