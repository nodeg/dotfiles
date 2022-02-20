set nocompatible              " be iMproved, required
filetype off                  " required

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" vim plug
call plug#begin('~/.vim/plugged')
     Plug 'junegunn/vim-plug'                         " plugin manager
     Plug 'junegunn/gv.vim'                           " git commit browser
     Plug 'junegunn/goyo.vim'                         " distraction-free writing
     Plug 'junegunn/limelight.vim'                    " dims all paragraphs except the one
     Plug 'dracula/vim'                               " color theme
     Plug 'luochen1990/rainbow'                       " colored brackets
     Plug 'ap/vim-css-color'                          " displays a preview of colors with CSS
     Plug 'itchyny/lightline.vim'                     " status bar
     Plug 'edkolev/tmuxline.vim'                      " tmux statusline like lightline
     Plug 'airblade/vim-gitgutter'                    " visualize git changes
     Plug 'tpope/vim-fugitive'                        " git stuff
     Plug 'tpope/vim-surround'                        " delete, change and add surroundings
     Plug 'tpope/vim-vinegar'                         " enhance vim`s netrw`
     Plug 'tpope/vim-commentary'                      " comment functions
     Plug 'jceb/vim-orgmode'                          " text outlining and task management
     Plug 'cohama/lexima.vim'                         " auto close parentheses
     Plug 'godlygeek/tabular'                         " line up text
     Plug 'ntpeters/vim-better-whitespace'            " better whitespace highlighting
     Plug 'nathanaelkane/vim-indent-guides'           " visually displaying indent levels
     "Plug 'sheerun/vim-polyglot'                      " language packs
     Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
     Plug 'RRethy/vim-illuminate'                     " highlights word under the cursor
     Plug 'hashivim/vim-terraform'                    " Terraform related plugin
     Plug 'ajouellette/sway-vim-syntax'               " sway config syntax highlighting
     Plug 'tmux-plugins/vim-tmux'                     " tmux config file support
call plug#end()

" Kitty background fix
let &t_ut=''

" tmuxline
let g:tmuxline_powerline_separators = 0

" Lightline
let g:lightline#bufferline#show_number  = 1
let g:lightline#bufferline#shorten_path = 0
let g:lightline#bufferline#unicode_symbols = 1
let g:lightline#bufferline#unnamed = '[No Name]'
let g:lightline#trailing_whitespace#indicator = '•'

" enable highlighting and stripping whitespace on save by default
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1
let g:better_whitespace_ctermcolor='red'

"set to 0 if you want to enable it later via :RainbowToggle
let g:rainbow_active = 1

" Goyo/limelight
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

"""" Lightline
let g:lightline = {
      \   'colorscheme': 'dracula',
      \   'active': {
      \     'left': [ [ 'mode' ], [ 'pwd' ], [ 'fugitive' ] ],
      \     'right': [ [ 'lineinfo' ], [ 'fileinfo' ] ],
      \   },
      \   'inactive': {
      \     'left': [ [ 'pwd' ] ],
      \     'right': [ [ 'lineinfo' ], [ 'fileinfo' ] ],
      \   },
      \   'tabline': {
      \     'left': [ [ 'buffers' ] ],
      \     'right': [ [ 'close' ] ],
      \   },
      \   'separator': { 'left': '', 'right': '' },
      \   'subseparator': { 'left': '', 'right': '' },
      \   'component': {
      \     'lineinfo': '%l:%-v',
      \   },
      \   'component_function': {
      \     'pwd': 'LightlineWorkingDirectory',
      \     'fileinfo': 'LightlineFileinfo',
      \   },
      \ }

" lightline components
function! LightlineFileinfo()
  if winwidth(0) < 90
    return ''
  endif

  let encoding = &fenc !=# "" ? &fenc : &enc
  let format = &ff
  let type = &ft !=# "" ? &ft : "no ft"
  return type . ' | ' . format . ' | ' . encoding
endfunction

function! LightlineWorkingDirectory()
  return &ft =~ 'help\|qf' ? '' : fnamemodify(getcwd(), ":~:.")
endfunction

let g:tmuxline_preset = {
      \'a'    : '#{prefix_highlight} #S',
      \'c'    : ['#(whoami)', '#(uptime | cut -d " " -f 1,2,3)'],
      \'win'  : ['#I', '#W'],
      \'cwin' : ['#I', '#W', '#F'],
      \'x'    : '#(date)',
      \'y'    : ['%R', '%a', '%Y'],
      \'z'    : '#H'}


set laststatus=2

" key mappings

nnoremap <F12> :Goyo<CR>

" turn line numbers on
set number
:nmap <C-N><C-N> :set invnumber<CR>

" toggle spell check
nnoremap <silent> <F11> :set spell!<cr>
inoremap <silent> <F11> <C-O>:set spell!<cr>
" map <F8> :w <CR> :!gcc -std=c11 -pedantic -Wall -Werror -g3 % -o %< <CR>

" copy paste to clipboard
nnoremap <C-y> "+y
vnoremap <C-y> "+y
nnoremap <C-p> "+p
vnoremap <C-p> "+p

" configuration

" set UTF-8 encoding
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8

" turn of swap files
set noswapfile
set nobackup
set nowritebackup
set nowb

" search
set incsearch       " Find the next match as we type the search
set hlsearch        " Highlight searches by default
set ignorecase      " Ignore case when searching...
set smartcase       " ...unless we type a capital

" Indentation
set autoindent " use indentation of previous line
set smartindent " use intelligent indentation for C
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=black ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=black ctermbg=4

" configure tabwidth and insert spaces instead of tabs
set tabstop=4        " tab width is 4 spaces
set shiftwidth=4     " indent also with 4 spaces
set expandtab        " expand tabs to spaces

" turn syntax highlighting on
syntax enable
set termguicolors   " enable 24bit true color
colorscheme dracula
set background=dark
highlight Comment cterm=italic gui=italic

" highlight matching braces
set showmatch

" intelligent comments
set comments=sl:/*,mb:\ *,elx:\ */

" highlight current line
set cursorline

" highlight current column
set cursorcolumn

" turn mode of since the statusbar shows it already
set noshowmode

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" spell languages
set spelllang=en,de

" Let Vim jump to the last position when  reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
