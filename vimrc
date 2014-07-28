execute pathogen#infect()
syntax on
filetype plugin indent on

set nocompatible
set encoding=utf8

syntax enable
set background=dark
colorscheme solarized

noremap <leader>y "*y
noremap <leader>yy "*Y

" Preserve indentation while pasting text from the OS X clipboard
noremap <leader>p :set paste<CR>:put  *<CR>:set nopaste<CR>

" Powerline
set rtp+="/usr/local/lib/python2.7/site-packages/powerline/bindings/vim/"
set laststatus=2

python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup
