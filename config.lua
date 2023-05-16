-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny


------ MAIN SETTINGS ------
-- require 'lv-settings'
lvim.colorscheme = 'lunar'
lvim.transparent_window = true
lvim.leader = ';'

------ OPTIONS ------
require 'opts'

------ PLUGINS ------
require 'my_plugins'

------ KEYBINDS ------
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

-- Symbols-Outline setup
require("symbols-outline").setup()
lvim.keys.normal_mode["<leader>o"] = vim.cmd.SymbolsOutline

-- Setup Leap
require('leap').add_default_mappings()
vim.keymap.del({ 'x', 'o' }, 'x')
vim.keymap.del({ 'x', 'o' }, 'X')

-- Setup Undotree
lvim.keys.normal_mode["<leader>u"] = vim.cmd.UndotreeToggle

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


-- Optional LSP Stuff

-- -- make sure server will always be installed even if the server is in skipped_servers list
-- lvim.lsp.installer.setup.ensure_installed = {
--     "sumneko_lua",
--     "jsonls",
-- }
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


-- Add to WhichKey
lvim.builtin.which_key.mappings["u"] = { "<cmd>UndotreeToggle<cr>", "UndoTree" }
lvim.builtin.which_key.mappings["o"] = { "<cmd>SymbolsOutline<cr>", "Symbols Outline" }
lvim.builtin.which_key.mappings["r"] = { name = "Weird Replace thing" }
lvim.builtin.which_key.mappings["n"] = { name = "Explorer" }
lvim.builtin.which_key.mappings["h"] = {}
lvim.builtin.which_key.mappings["a"] = { name = "Select All" }
lvim.builtin.which_key.mappings["e"] = {}
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
-- lvim.builtin.which_key.mappings["t"] = {
--   name = "+Trouble",
--   r = { "<cmd>Trouble lsp_references<cr>", "References" },
--   f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
--   d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
--   q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
--   l = { "<cmd>Trouble loclist<cr>", "LocationList" },
--   w = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace Diagnostics" },
-- }
