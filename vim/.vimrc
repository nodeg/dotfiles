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
     Plug 'Rigellute/rigel'                           " color theme
     Plug 'luochen1990/rainbow'                       " colored brackets
     Plug 'ap/vim-css-color'                          " displays a preview of colors with CSS
     Plug 'itchyny/lightline.vim'                     " status bar
     Plug 'airblade/vim-gitgutter'                    " visualize git changes
     Plug 'rhysd/git-messenger.vim'                   " git commit messages
     Plug 'tpope/vim-fugitive'                        " git stuff
     Plug 'tpope/vim-surround'                        " delete, change and add surroundings
     Plug 'tpope/vim-vinegar'                         " enhance vim`s netrw`
     Plug 'tpope/vim-commentary'                      " comment functions
     Plug 'jceb/vim-orgmode'                          " text outlining and task management
     Plug 'vim-syntastic/syntastic'                   " syntax checking plugin.
     Plug 'cohama/lexima.vim'                         " auto close parentheses
     Plug 'godlygeek/tabular'                         " line up text
     Plug 'ntpeters/vim-better-whitespace'            " better whitespace highlighting
     Plug 'yuezk/vim-js'                              " better js support
     Plug 'nathanaelkane/vim-indent-guides'           " visually displaying indent levels
     Plug 'neoclide/coc.nvim', {'branch': 'release'}  " smart like VCode
     Plug 'vim-utils/vim-man'                         " man pages in vim
     Plug 'sheerun/vim-polyglot'                      " language packs
     Plug 'ryanoasis/vim-devicons'                    " some nice icons
     Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
     Plug 'psliwka/vim-smoothie'                      " smooth scrolling
     Plug 'RRethy/vim-illuminate'                     " highlights word under the cursor
call plug#end()

" Kitty background fix
let &t_ut=''

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_check_on_wq = 0
let g:syntastic_error_symbol = 'E'
let g:syntastic_warning_symbol = 'W'
let g:syntastic_markdown_checkers = ['mdl']
let g:syntastic_python_checkers = ['flake8']
highlight link SyntasticErrorSign SignColumn
highlight link SyntasticWarningSign SignColumn
highlight link SyntasticStyleErrorSign SignColumn
highlight link SyntasticStyleWarningSign SignColumn

" enable highlighting and stripping whitespace on save by default
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1

"set to 0 if you want to enable it later via :RainbowToggle
let g:rainbow_active = 1

" Goyo/limelight
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" lightline status bar
Plug 'itchyny/lightline.vim'
    let g:lightline = {
        \ 'colorscheme': 'rigel',
        \ 'active': {
        \   'left': [ [ 'mode', 'paste' ],
        \             [ 'readonly', 'fugitive', 'cocstatus', 'filename', 'modified' ] ]
        \ },
        \ 'component_function': {
        \   'fugitive': 'FugitiveHead',
        \   'cocstatus': 'coc#status'
        \ },
        \ }

set laststatus=2

" Use auocmd to force lightline update.
autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

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

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

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
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=black    ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=black ctermbg=4

" configure tabwidth and insert spaces instead of tabs
set tabstop=4        " tab width is 4 spaces
set shiftwidth=4     " indent also with 4 spaces
set expandtab        " expand tabs to spaces

" turn syntax highlighting on
syntax enable
set termguicolors   " enable 24bit true color
colorscheme rigel
set background=dark

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
set spelllang=en

" Let Vim jump to the last position when  reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
