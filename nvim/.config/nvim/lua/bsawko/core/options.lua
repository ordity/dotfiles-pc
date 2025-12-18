vim.cmd("let g:netrw_liststyle = 3")

-- clean up the configs a little bit
local opt = vim.opt

-- row number settings
opt.relativenumber = true
opt.number = true

-- indent settings
opt.tabstop = 4 -- 4 spaces for tabs (prettier default)
opt.shiftwidth = 4 -- 4 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one

opt.wrap = false -- wrap lines

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- assumes case-sensitive for search when mixing cases

opt.cursorline = true

-- colorscheme settings
opt.termguicolors = false -- use terminal colors for GUI
opt.background = "dark" -- colorschemes that can be light or dark will be made dark
opt.signcolumn = "yes" -- show sign column so that text doesn't shift
opt.scrolloff = 8 -- scroll if you are 8 characters over the EoF
opt.isfname:append("@-@") -- add @-@ to the possible filenames

opt.colorcolumn = "100" -- add a colored background for 100th column

opt.updatetime = 50

-- backspace
opt.backspace = "indent,eol,start" -- backspace on indent, end of line or insert mode start position

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

-- turn off swapfile
opt.swapfile = false -- dont create swap files
opt.backup = false -- dont back up files
opt.undodir = os.getenv("HOME") .. "/.vim/undodir" -- set directory for undo file
opt.undofile = true -- use undo file

opt.hlsearch = true -- keep search highlighted
opt.incsearch = true -- incremental search
