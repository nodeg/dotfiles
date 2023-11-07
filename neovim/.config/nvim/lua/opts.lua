local opt = vim.opt

opt.incsearch = true      -- Find the next match as we type the search
opt.hlsearch = true       -- Highlight searches by default
opt.ignorecase = true     -- Ignore case when searching...
opt.smartcase = true      -- ...unless we type a capital
opt.autoindent = true     -- use indentation of previous line
opt.smartindent = true    -- use intelligent indentation for C
opt.tabstop = 2           -- tab width is 2 spaces
opt.shiftwidth = 2        -- indent also with 2 spaces
opt.expandtab = true      -- expand tabs to spaces
opt.relativenumber = true -- show relative line numbers
opt.number = true         -- shows absolute line number on cursor line (when relative number is on)
opt.wrap = false          -- disable line wrapping
opt.termguicolors = true  -- enable 24bit true color
opt.background = "dark"   -- colorschemes that can be light or dark will be made dark
opt.signcolumn = "yes"    -- show sign column so that text doesn't shift
opt.showmatch = true      -- highlight matching braces
opt.cursorline = true     -- highlight current line
opt.cursorcolumn = true   -- highlight current column
opt.updatetime = 50       -- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable delays and poor user experience.
opt.signcolumn = "yes"    -- Always show the signcolumn, otherwise it would shift the text each time
opt.splitright = true     -- split vertical window to the right
opt.splitbelow = true     -- split horizontal window to the bottom
opt.swapfile = false      -- turn off swapfile
opt.backup = false    -- turn off backup files
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position
