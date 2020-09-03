set nocompatible              " be iMproved, required
filetype off                  " required

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" coc and ale copatibility
let g:ale_disable_lsp = 1

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
     Plug 'maximbaz/lightline-bufferline'             " bufferline functionality for lightline
     Plug 'maximbaz/lightline-trailing-whitespace'    " whitespaces shown in the status bar
     Plug 'maximbaz/lightline-ale'                    " status bar addon for ale
     Plug 'edkolev/tmuxline.vim'                      " tmux statusline like lightline
     Plug 'airblade/vim-gitgutter'                    " visualize git changes
     Plug 'rhysd/git-messenger.vim'                   " git commit messages
     Plug 'tpope/vim-fugitive'                        " git stuff
     Plug 'tpope/vim-surround'                        " delete, change and add surroundings
     Plug 'tpope/vim-vinegar'                         " enhance vim`s netrw`
     Plug 'tpope/vim-commentary'                      " comment functions
     Plug 'jceb/vim-orgmode'                          " text outlining and task management
     Plug 'dense-analysis/ale'                        " syntax checking plugin.
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
     Plug 'hashivim/vim-terraform'                    " Terraform related plugin
     Plug 'davidhalter/jedi-vim'                      " python stuff
     Plug 'tmux-plugins/vim-tmux'                     " tmux config file support
call plug#end()

" Kitty background fix
let &t_ut=''

" tmuxline
let g:tmuxline_powerline_separators = 0

" ALE
let g:ale_sign_error = "\uf05e"
let g:ale_sign_warning = "\uf071"
let g:ale_echo_msg_error_str = "\uf05e"
let g:ale_echo_msg_warning_str = "\uf071"
let g:ale_echo_msg_format = '[%linter%] %s'
" let g:ale_linters = {
" \   'javascript': ['eslint'],
" \   'python': ['pylint'],
" \}

" ALE lightline config
let g:lightline#ale#indicator_checking = "\uf110"
let g:lightline#ale#indicator_infos = "\uf129"
let g:lightline#ale#indicator_warnings = "\uf071"
let g:lightline#ale#indicator_errors = "\uf05e"

" Lightline
let g:lightline#bufferline#show_number  = 1
let g:lightline#bufferline#shorten_path = 0
let g:lightline#bufferline#unicode_symbols = 1
let g:lightline#bufferline#unnamed = '[No Name]'
let g:lightline#trailing_whitespace#indicator = '•'

" enable highlighting and stripping whitespace on save by default
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1

"set to 0 if you want to enable it later via :RainbowToggle
let g:rainbow_active = 1

" loading the devicons plugin
let g:webdevicons_enable = 1

" Terraform
let g:terraform_align=1
let g:terraform_fold_sections=1
let g:terraform_fmt_on_save=1

" Goyo/limelight
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" old lightline status bar
" let g:lightline = {
"       \ 'colorscheme': 'rigel',
"       \ 'component_function': {
"       \   'fugitive': 'FugitiveHead',
"       \   'cocstatus': 'coc#status',
"       \ },
"       \ }
" let g:lightline.component_expand = {
"       \  'linter_checking': 'lightline#ale#checking',
"       \  'linter_infos': 'lightline#ale#infos',
"       \  'linter_warnings': 'lightline#ale#warnings',
"       \  'linter_errors': 'lightline#ale#errors',
"       \  'linter_ok': 'lightline#ale#ok',
"       \ }
" let g:lightline.component_type = {
"       \     'linter_checking': 'right',
"       \     'linter_infos': 'right',
"       \     'linter_warnings': 'warning',
"       \     'linter_errors': 'error',
"       \     'linter_ok': 'right',
"       \ }
" let g:lightline.active = {
"       \   'left': [ [ 'mode', 'paste', 'readonly', 'fugitive', 'cocstatus', 'filename', 'modified' ] ],
"       \   'right': [ [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok' ] ]
"       \ }
"""" Lightline
let g:lightline = {
      \   'colorscheme': 'rigel',
      \   'active': {
      \     'left': [ [ 'mode' ], [ 'pwd' ], [ 'fugitive' ], [ 'cocstatus' ] ],
      \     'right': [ [ 'linter_checking', 'linter_errors', 'linter_warnings', 'trailing', 'lineinfo' ], [ 'fileinfo' ] ],
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
      \   'mode_map': {
      \     'n' : 'N',
      \     'i' : 'I',
      \     'R' : 'R',
      \     'v' : 'V',
      \     'V' : 'V-LINE',
      \     "\<C-v>": 'V-BLOCK',
      \     'c' : 'C',
      \     's' : 'S',
      \     'S' : 'S-LINE',
      \     "\<C-s>": 'S-BLOCK',
      \     't': '󰀣 ',
      \   },
      \   'component': {
      \     'lineinfo': '%l:%-v',
      \   },
      \   'component_expand': {
      \     'buffers': 'lightline#bufferline#buffers',
      \     'trailing': 'lightline#trailing_whitespace#component',
      \     'linter_checking': 'lightline#ale#checking',
      \     'linter_warnings': 'lightline#ale#warnings',
      \     'linter_errors': 'lightline#ale#errors',
      \   },
      \   'component_function': {
      \     'pwd': 'LightlineWorkingDirectory',
      \     'fileinfo': 'LightlineFileinfo',
      \   },
      \   'component_type': {
      \     'buffers': 'tabsel',
      \     'trailing': 'error',
      \     'linter_checking': 'left',
      \     'linter_warnings': 'warning',
      \     'linter_errors': 'error',
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

" Use autocmd to force lightline update.
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
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=black ctermbg=3
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
