set nocompatible              " be iMproved, required
filetype off                  " required

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


" vim plug
call plug#begin('~/.vim/plugged')
     Plug 'junegunn/vim-plug'
     Plug 'scrooloose/nerdcommenter'
     Plug 'Rigellute/rigel'
     Plug 'vim-airline/vim-airline'
call plug#end()

" set UTF-8 encoding
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8

" disable vi compatibility (emulation of old bugs)
set nocompatible

" use indentation of previous line
set autoindent

" use intelligent indentation for C
set smartindent

" configure tabwidth and insert spaces instead of tabs
set tabstop=4        " tab width is 4 spaces
set shiftwidth=4     " indent also with 4 spaces
set expandtab        " expand tabs to spaces

" turn syntax highlighting on
"set t_Co=256
syntax on
set termguicolors   " enable 24bit true color
colorscheme rigel

" turn line numbers on
set number
:nmap <C-N><C-N> :set invnumber<CR>

" highlight matching braces
set showmatch

" intelligent comments
set comments=sl:/*,mb:\ *,elx:\ */

map <F8> :w <CR> :!gcc -std=c11 -pedantic -Wall  -g3 -L/home/dom/git/libeconf/lib/.libs -leconf -I/home/dom/git/libeconf/include % -o %< <CR>
