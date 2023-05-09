local HOME = os.getenv("HOME")

vim.opt.clipboard = ""
vim.opt.showmatch = true -- show matching
vim.opt.ignorecase = true -- case incsearch search
vim.opt.smartcase = true -- noignorecase selectively
vim.opt.smartindent = true -- testing if smartindent works
vim.opt.mouse = "a" -- middle-click paste
vim.opt.hlsearch = false -- highlight search
vim.opt.incsearch = true -- incremental search
vim.opt.completeopt = { "menuone", "noselect" }
vim.opt.tabstop = 4 -- number of columns occupied by tab
vim.opt.softtabstop = 4 -- see multiple spaces as tabstops so <BS> works
vim.opt.expandtab = true -- converts tab to whitespace
vim.opt.shiftwidth = 4 -- wifth for autoindentation
vim.opt.shiftround = true -- when shifting lines, round the indentation
vim.opt.autoread = true -- automatically update file if it is updated elsewhere
vim.opt.autowrite = true -- automatically saves file on normal mode
vim.opt.number = true
vim.opt.relativenumber = true -- add line numbers
-- get bash-like tab completions
vim.opt.wildmode = "list:longest"
vim.opt.cc = { 100, 120 } -- vim.opt.an 100/120 column border for good coding style
vim.opt.mouse = "a" -- enable mouse click
-- vim.opt.clipboard+=unnamedplus using system clipboard
vim.opt.list = true -- Display unprintable characters f12 - switches
-- Unprintable chars mapping
vim.opt.listchars = "tab:•\\ ,trail:•,extends:»,precedes:«"
vim.opt.cursorline = true -- highlight current cursorline
vim.opt.ttyfast = true -- Speed up scrolling in Vim
-- vim.opt.spell            -- enable spell check (may need to download language package)
vim.opt.swapfile = false -- disable creating swap file
-- Directory to store backup files.set
vim.opt.backupdir = HOME .. "/.cache/nvim"
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.undodir = HOME .. '/.nvim/nvim/undodir'
vim.opt.undofile = true
vim.opt.belloff = 'all' -- remove visual bell
vim.opt.titlestring = "%t" -- vim.opt.title of tab to title of file
vim.opt.title = true
vim.opt.laststatus = 2
-- vim.opt.wildmenu = true
vim.opt.scrolloff = 4 -- is one of my fav
vim.opt.sidescrolloff = 8
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
-- vim.g.ale_disable_lsp = 1
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 100
