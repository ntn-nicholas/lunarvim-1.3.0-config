-- Disable tmux navigator when zooming the Vim pane
vim.g.tmux_navigator_disable_when_zoomed = 1
vim.g.tmux_navigator_no_mappings = 1

-- Bind normal keys manually
lvim.keys.normal_mode["<C-h>"] = "<cmd>TmuxNavigateLeft<cr>"
lvim.keys.normal_mode["<C-j>"] = "<cmd>TmuxNavigateDown<cr>"
lvim.keys.normal_mode["<C-k>"] = "<cmd>TmuxNavigateUp<cr>"
lvim.keys.normal_mode["<C-l>"] = "<cmd>TmuxNavigateRight<cr>"
