-- See mbbill/undotree
lvim.builtin.which_key.mappings["u"] = { "<cmd>UndotreeToggle<cr>", "UndoTree" }

-- See simrat39/symbols-outline.nvim
lvim.builtin.which_key.mappings["o"] = { "<cmd>SymbolsOutline<cr>", "Symbols Outline" }

-- Replace the word that cursor is on
lvim.builtin.which_key.mappings["r"] = {
  [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
  "Replace All in File"
}

-- ;n for explorer
lvim.builtin.which_key.mappings["n"] = { ":NvimTreeToggle<CR>", "Explorer" }

-- Select all text in file
lvim.builtin.which_key.mappings["a"] = { "ggVG", "Select All" }

-- Toggle code folding (currently not working)
lvim.builtin.which_key.mappings["z"] = { "zA", "Toggle Fold" }

-- Look at all recent projects
lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }

-- See folke/trouble.nvim
lvim.builtin.which_key.mappings["t"] = {
  name = "+Trouble",
  r = { "<cmd>Trouble lsp_references<cr>", "References" },
  f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
  d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
  q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
  l = { "<cmd>Trouble loclist<cr>", "LocationList" },
  w = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace Diagnostics" },
}

-- Evaluate expression while in debugging mode
lvim.builtin.which_key.mappings["de"] = { "<cmd>lua require'dapui'.eval()<CR>", "Evaluate" }

-- Diffview keybinds
lvim.builtin.which_key.mappings["g"]["d"] = { "<cmd>DiffviewOpen<CR>", "Open Git Diff" }
lvim.builtin.which_key.mappings["gD"] = {
  function()
    inp = vim.fn.input("Pick a commit range: ", "HEAD")
    vim.cmd("DiffviewOpen " .. inp)
  end,
  "Open Git Diff with Range"
}
lvim.keys.normal_mode[";gH"] = ':DiffviewFileHistory '
lvim.keys.visual_mode[";gh"] = ':DiffviewFileHistory<CR>'
lvim.keys.visual_mode[";gH"] = ':DiffviewFileHistory '
lvim.builtin.which_key.mappings["gh"] = { "<cmd>DiffviewFileHistory %<CR>", "Git History" }
lvim.builtin.which_key.mappings["gq"] = { "<cmd>DiffviewClose<CR>", "Close Git Diff" }

-- Unbind unused whichkeys
lvim.builtin.which_key.mappings["h"] = {}
lvim.builtin.which_key.mappings["e"] = {}
