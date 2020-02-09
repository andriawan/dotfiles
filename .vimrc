" basic vim setting
set number
set ruler
syntax on
set encoding=utf8
set nocompatible

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

" Initialize plugin system end
call plug#end()

" color scheme
colorscheme delek

" maping keyboard for shortcut
map <C-n> :NERDTree
