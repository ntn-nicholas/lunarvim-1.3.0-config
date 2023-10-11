-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny


------ MAIN SETTINGS ------
lvim.colorscheme = 'catppuccin-macchiato'
lvim.transparent_window = true
lvim.leader = ';'

------ OPTIONS ------
require 'opts'

------ PLUGINS ------
require 'my_plugins'

----- KEYBINDS ------
require 'keymaps'



-- WSL clipboard support
vim.cmd([[
    let s:clip='/mnt/c/Windows/System32/clip.exe'
    if executable(s:clip)
        augroup WSLYank
            autocmd!
            autocmd TextYankPost * if v:event.operator ==# 'y' | call system('cat |' . s:clip, @0) | endif
        augroup END
    endif
]])

-- Setup Leap
require('leap').add_default_mappings()
vim.keymap.del({ 'x', 'o' }, 'x')
vim.keymap.del({ 'x', 'o' }, 'X')

-- Setup Harpoon
require 'harpoon'
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

lvim.keys.normal_mode['<leader>mf'] = mark.add_file
lvim.keys.normal_mode['<M-m>'] = ui.toggle_quick_menu

lvim.keys.normal_mode['<leader>m1'] = function() ui.nav_file(1) end
lvim.keys.normal_mode['<leader>m2'] = function() ui.nav_file(2) end
lvim.keys.normal_mode['<leader>m3'] = function() ui.nav_file(3) end
lvim.keys.normal_mode['<leader>m4'] = function() ui.nav_file(4) end

lvim.keys.normal_mode['<c-.>'] = function() require'luasnip'.jump(-1) end
lvim.keys.normal_mode['<c-/>'] = function() require'luasnip'.jump(1) end

-- Setup catppuccin
require("catppuccin").setup({
    integrations = {
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
        leap = true,
        lsp_trouble = true,
        which_key = true
    }
})


-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
local _, actions = pcall(require, "telescope.actions")
lvim.builtin.telescope.defaults.mappings = {
    -- for input mode
    i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-n>"] = actions.cycle_history_next,
        ["<C-p>"] = actions.cycle_history_prev,
    },
    -- for normal mode
    n = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
    },
}


------ PLUGIN OPTIONS ------
require 'plugins/treesitter'
require 'plugins/nvimtree'
require 'plugins/whichkey'
require 'plugins/tmuxnav'


-- LSP Stuff
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "jdtls", "clangd", "rust_analyzer" })

-- make sure server will always be installed even if the server is in skipped_servers list
lvim.lsp.installer.setup.ensure_installed = {
    "jdtls",
    "sqlls",
    "jsonls",
    "pyright",
}

-- -- change UI setting of `LspInstallInfo`
-- -- see <https://github.com/williamboman/nvim-lsp-installer#default-configuration>
-- lvim.lsp.installer.setup.ui.check_outdated_servers_on_open = false
-- lvim.lsp.installer.setup.ui.border = "rounded"
-- lvim.lsp.installer.setup.ui.keymaps = {
--     uninstall_server = "d",
--     toggle_server_expand = "o",
-- }

-- ---@usage disable automatic installation of servers
-- lvim.lsp.installer.setup.automatic_installation = false


-- Formatter
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
    -- { command = "black", filetypes = { "python" } },
    {
        -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
        command = "prettier",
        ---@usage arguments to pass to the formatter
        -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
        extra_args = { "--print-with", "100" },
        ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
        filetypes = { "typescript", "typescriptreact" },
    },
}

-- -- set additional linters
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   { command = "flake8", filetypes = { "python" } },
--   {
--     -- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--     command = "shellcheck",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--severity", "warning" },
--   },
--   {
--     command = "codespell",
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "javascript", "python" },
--   },
-- }

-- Setup Vim anyfold
-- vim.cmd([[
-- augroup anyfold
--     autocmd!
--     autocmd Filetype java,python,lua AnyFoldActivate
-- augroup END

-- " disable anyfold for large files
-- let g:LargeFile = 1000000 " file is large if size greater than 1MB
-- autocmd BufReadPre,BufRead * let f=getfsize(expand("<afile>")) | if f > g:LargeFile || f == -2 | call LargeFile() | endif
-- function LargeFile()
--     augroup anyfold
--         autocmd! " remove AnyFoldActivate
--         autocmd Filetype java,python,lua setlocal foldmethod=indent " fall bacbk to indent folding
--     augroup END
-- endfunction

-- let g:anyfold_identify_comments=2 " more rigor to identify comments"
-- let g:anyfold_fold_comments=1 " fold comments by default"
-- let g:anyfold_comments=['comment','string','external','include']
-- ]])

-- local opt = vim.opt
-- opt.foldmethod = "expr"
-- opt.foldexpr = "nvim_treesitter#foldexpr()"
