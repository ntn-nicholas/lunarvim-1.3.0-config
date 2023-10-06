lvim.plugins = {

  -------------------- VISUAL EFFECTS -----------------------------------

  -- Themes
  'tomasiser/vim-code-dark',
  'marko-cerovac/material.nvim',
  'sainnhe/sonokai',
  'catppuccin/nvim', -- Comes in four flavors

  -- Line folding (doesn't really work yet)
  'pseewald/vim-anyfold',

  -- Show function nesting on top of page
  {
    "romgrk/nvim-treesitter-context",
    config = function()
      require("treesitter-context").setup{
        enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
        throttle = true, -- Throttles plugin updates (may improve performance)
        max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
        patterns = { -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
          -- For all filetypes
          -- Note that setting an entry here replaces all other patterns for this entry.
          -- By setting the 'default' entry below, you can control which nodes you want to
          -- appear in the context window.
          default = {
            'class',
            'function',
            'method',
          },
        },
      }
    end
  },

  -- Smooth scrolling
  {
    "karb94/neoscroll.nvim",
    event = "WinScrolled",
    config = function()
      require('neoscroll').setup({
        -- All these keys will be mapped to their corresponding default scrolling animation
        mappings = {'<C-u>', '<C-d>', '<C-b>', '<C-f>',
          '<C-y>', '<C-e>', 'zt', 'zz', 'zb'},
        hide_cursor = true,          -- Hide cursor while scrolling
        stop_eof = true,             -- Stop at <EOF> when scrolling downwards
        use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
        respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
        cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
        easing_function = nil,        -- Default easing function
        pre_hook = nil,              -- Function to run before the scrolling animation starts
        post_hook = nil,              -- Function to run after the scrolling animation ends
      })
    end
  },

  -- Replaces color column with a line character for smaller/cleaner line
  {
    'lukas-reineke/virt-column.nvim',
    config = function()
      require("virt-column").setup()
    end
  },

  -- Sidebar minimap
  -- {
  --   'wfxr/minimap.vim',
  --   event = "BufRead",
  --   build = "cargo install --locked code-minimap",
  --   cmd = {"Minimap", "MinimapClose", "MinimapToggle", "MinimapRefresh", "MinimapUpdateHighlight"},
  --   config = function ()
  --     vim.cmd ("let g:minimap_width = 7")
  --     vim.cmd ("let g:minimap_auto_start = 1")
  --     vim.cmd ("let g:minimap_auto_start_win_enter = 1")
  --     vim.cmd ("let g:minimap_git_colors = 1")
  --   end,
  -- },


  -------------------- EDITOR UTILITIES ---------------------------------

  -- Introduces vim surround motion (e.g. cs]" changes surrounding [] to "")
  'tpope/vim-surround',
  -- Replicate more complex vim motions with .
  'tpope/vim-repeat',
  -- Leap motions with s and S
  'ggandor/leap.nvim',
  -- Adjust shiftwidth automatically to buffer defaults
  'tpope/vim-sleuth',

  -- Use git in vim command (unfavored compared to lazygit) (:G)
  {
    "tpope/vim-fugitive",
    cmd = {
      "G",
      "Git",
      "Gdiffsplit",
      "Gread",
      "Gwrite",
      "Ggrep",
      "GMove",
      "GDelete",
      "GBrowse",
      "GRemove",
      "GRename",
      "Glgrep",
      "Gedit"
    },
    ft = {"fugitive"}
  },

  -- Git diff tool (Call with :DiffviewOpen [git rev] [options])
  'sindrets/diffview.nvim',

  -- TMUX plugin for seamless navigation with Ctrl-[hjkl]
  'christoomey/vim-tmux-navigator',

  -- Automatically save on exit insert mode
  {
    "Pocco81/auto-save.nvim",
    config = function()
      require("auto-save").setup()
    end,
  },

  -- Peek a line using :{number}
  {
    "nacro90/numb.nvim",
    event = "BufRead",
    config = function()
      require("numb").setup {
        show_numbers = true, -- Enable 'number' for the window while peeking
        show_cursorline = true, -- Enable 'cursorline' for the window while peeking
      }
    end,
  },

  -- Restores cursor to where we quit a file last
  {
    "ethanholz/nvim-lastplace",
    event = "BufRead",
    config = function()
      require("nvim-lastplace").setup({
        lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
        lastplace_ignore_filetype = {
          "gitcommit", "gitrebase", "svn", "hgcommit",
        },
        lastplace_open_folds = true,
      })
    end,
  },

  -- Preview window for goto (gp ... )
  {
    "rmagatti/goto-preview",
    config = function()
      require('goto-preview').setup {
        width = 120; -- Width of the floating window
        height = 25; -- Height of the floating window
        default_mappings = true; -- Bind default mappings
        debug = false; -- Print debug information
        opacity = nil; -- 0-100 opacity level of the floating window where 100 is fully transparent.
        post_open_hook = nil -- A function taking two arguments, a buffer and a window to be ran as a hook.
        -- You can use "default_mappings = true" setup option
        -- Or explicitly set keybindings
        -- vim.cmd("nnoremap gpd <cmd>lua require('goto-preview').goto_preview_definition()<CR>")
        -- vim.cmd("nnoremap gpi <cmd>lua require('goto-preview').goto_preview_implementation()<CR>")
        -- vim.cmd("nnoremap gP <cmd>lua require('goto-preview').close_all_win()<CR>")
      }
    end
  },

  -- Better quickfix window (;lq)
  {
    "kevinhwang91/nvim-bqf",
    event = { "BufRead", "BufNew" },
    config = function()
      require("bqf").setup({
        auto_enable = true,
        preview = {
          win_height = 12,
          win_vheight = 12,
          delay_syntax = 80,
          border_chars = { "┃", "┃", "━", "━", "┏", "┓", "┗", "┛", "█" },
        },
        func_map = {
          vsplit = "",
          ptogglemode = "z,",
          stoggleup = "",
        },
        filter = {
          fzf = {
            action_for = { ["ctrl-s"] = "split" },
            extra_opts = { "--bind", "ctrl-o:toggle-all", "--prompt", "> " },
          },
        },
      })
    end,
  },

  -- ChatGPT (Disabled bc of limited API usability)
  -- {
  --   "jackMort/ChatGPT.nvim",
  --   event = "VeryLazy",
  --   config = function()
  --     require("chatgpt").setup({
  --       api_key_cmd = "~/.config/lvim/api",
  --       popup_input = {
  --         submit = "<C-/>"
  --       }
  --     })
  --   end,
  --   dependencies = {
  --     "MunifTanjim/nui.nvim",
  --     "nvim-lua/plenary.nvim",
  --     "nvim-telescope/telescope.nvim"
  --   }
  -- },

  -- Backseater code with (:Backseat)
  {
    "james1236/backseat.nvim",
    config = function()
      require("backseat").setup({
        openai_model_id = 'gpt-3.5-turbo',
        -- language = 'english',
        -- split_threshold = 100,
        -- additional_instruction = "Respond snarkily", -- (GPT-3 will probably deny this request, but GPT-4 complies)
        highlight = {
            icon = '󰕾', -- ''
            group = 'LspReferenceText',
        }
      })
    end
  },

  -- Vim game for practicing vim motions (Go to new buffer and run :VimBeGood)
  'ThePrimeagen/vim-be-good',

  -- Hint when you type (<M-q> to toggle while typing)
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function()
      require"lsp_signature".setup({
        doc_lines = 0,
        floating_window = false,
        hint_enable = false,
        floating_window_off_y = function() -- adjust float windows y position. e.g. set to -2 can make floating window move up 2 lines
          local pumheight = vim.o.pumheight
          local winline = vim.fn.winline() -- line number in the window
          local winheight = vim.fn.winheight(0)

          -- window top
          if winline - 1 < pumheight then
            return pumheight
          end

          -- window bottom
          if winheight - winline < pumheight then
            return -pumheight
          end
          return 0
        end,
        toggle_key = '<M-q>',
        toggle_key_flip_floatwin_setting = true,
      })
    end,
  },

  -- Mark files for moving back and forth between different files with ;mf and ;m[1-4]. View harpoons with Alt-m
  {
    "ThePrimeagen/harpoon",
    config = function ()
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
    end
  },

  -- Vim Wakatime activity usage tracker
  'wakatime/vim-wakatime',


  -------------------- EXTRA PANELS -------------------------------------

  -- Vim troubleshooter for navigating to bugs (;T...) Config in config.lua
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle"
  },

  -- Undotree history (;u)
  'mbbill/undotree',

  -- Symbol outline tool (;o)
  {
    'simrat39/symbols-outline.nvim',
    config = function()
      require("symbols-outline").setup({ width = 20 })
    end
  },


  -------------------- LANGUAGE SPECIFIC PLUGINS ------------------------

  -- %% FRONTEND DEVELOPMENT %%

  -- Automatically close and rename HTML tags
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  -- Use emmet notation with Ctrl-y + ,
  'mattn/emmet-vim',

  -- %% PYTHON %%

  "ChristianChiarulli/swenv.nvim",
  "stevearc/dressing.nvim",
  "mfussenegger/nvim-dap-python",
  "nvim-neotest/neotest",
  "nvim-neotest/neotest-python",

  -- %% JAVA %%

  -- Java JDTLS
  {
    'mfussenegger/nvim-jdtls',
    event = "BufRead",
  },

  -- AWS S3 Edit
  { 'kiran94/s3edit.nvim', config = true, cmd = "S3Edit"},

  -- %% C/C++ %%

  -- Clangd extensions for LSP
  "p00f/clangd_extensions.nvim",
}
