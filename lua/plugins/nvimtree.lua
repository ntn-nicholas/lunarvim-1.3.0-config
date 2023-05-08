-- local HEIGHT_RATIO = 0.8  -- You can change this
-- local WIDTH_RATIO = 0.5   -- You can change this too

-- Stage file from explorer
local lib = require("nvim-tree.lib")
local git_add = function()
  local node = lib.get_node_at_cursor()
  local gs = node.git_status

  -- If the file is untracked, unstaged or partially staged, we stage it
  if gs == "??" or gs == "MM" or gs == "AM" or gs == " M" then
    vim.cmd("silent !git add " .. node.absolute_path)

    -- If the file is staged, we unstage
  elseif gs == "M " or gs == "A " then
    vim.cmd("silent !git restore --staged " .. node.absolute_path)
  end

  lib.refresh_tree()
end

local setup = lvim.builtin.nvimtree.setup
setup.view.side = "left"
setup.renderer.icons.show.git = true
setup.renderer.highlight_git = true
setup.renderer.icons.glyphs.git = {
  unstaged = "•",
  staged = "✓",
  unmerged = "",
  renamed = "➜",
  untracked = "★",
  deleted = "",
  ignored = "",
  -- ignored = "◌",
}
setup.renderer.icons.git_placement = 'after'
-- setup.view.mappings.list = {
--   { key = "u",     action = "dir_up" },
--   { key = "<F2>",  action = "rename" },
--   { key = ' ',    action = "git_add", action_cb = git_add },
--   { key = '<Esc>', action = "close" }
-- }
-- setup.view.adaptive_size = true
-- setup.view.float = {
--   enable = true,
--   open_win_config = function()
--     local screen_w = vim.opt.columns:get()
--     local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
--     local window_w = screen_w * WIDTH_RATIO
--     local window_h = screen_h * HEIGHT_RATIO
--     local window_w_int = math.floor(window_w)
--     local window_h_int = math.floor(window_h)
--     local center_x = (screen_w - window_w) / 2
--     local center_y = ((vim.opt.lines:get() - window_h) / 2)
--     - vim.opt.cmdheight:get()
--     return {
--       border = 'rounded',
--       relative = 'editor',
--       row = center_y,
--       col = center_x,
--       width = window_w_int,
--       height = window_h_int,
--     }
--   end,
-- }
-- setup.view.width = function()
--   return math.floor(vim.opt.columns:get() * WIDTH_RATIO)
-- end
