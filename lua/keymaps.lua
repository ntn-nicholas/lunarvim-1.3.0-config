local function map(mode, lhs, rhs)
  vim.api.nvim_set_keymap(mode, lhs, rhs, {
    noremap = true, silent = true
  })
end

-- Luasnip snippet jumping
lvim.keys.insert_mode['<c-.>'] = ":lua require'luasnip'.jump(1)<cr>"

-- ;n for explorer
lvim.keys.normal_mode["<leader>n"] = ":NvimTreeToggle<CR>"

-- Keeps target word on center while searching
lvim.keys.normal_mode["n"] = "nzzzv"
lvim.keys.normal_mode["N"] = "Nzzzv"

-- Special paste which retains clipboard
map("x", "<leader>p", [["_dP]])

-- Replace the word that cursor is on
lvim.keys.normal_mode["<leader>r"] = [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]]

-- Allows using jk and kj as alternative Esc
lvim.keys.insert_mode["jk"] = '<Esc><Esc>'
lvim.keys.insert_mode["kj"] = '<Esc><Esc>'

lvim.keys.normal_mode["<c-w>t"] = '<c-w>ji'

lvim.keys.normal_mode["tn"] = ':tabnew<Enter>'
-- -- Creates a new terminal
-- lvim.keys.normal_mode["tt"] = '<c-w>s<c-w>5-<c-w><c-j>:term<enter>i'
-- --
-- -- Escapes from terminal mode
-- map("t", "<C-w>", '<c-\\><c-n><c-w>')
-- map("t", "<Esc>", '<c-\\><c-n>')

-- move the cursor without leaving insert mode
lvim.keys.insert_mode["<A-h>"] = "<Left>"
lvim.keys.insert_mode["<A-l>"] = "<Right>"

-- Runs a file
lvim.keys.normal_mode["<F8>c"] = ':make %< && ./%<<CR>'
lvim.keys.normal_mode["<F8>r"] = ':w<cr><c-w>s<c-w>5+<c-w><c-j>:term<enter>icargo run<CR>'
lvim.keys.normal_mode["<F8>p"] = ':w<CR>:!python3.9 %<CR>'
lvim.keys.normal_mode["<F10>"] = function()
  local filetype = vim.bo.filetype
  if filetype == 'c' or filetype == 'cpp' then
    vim.cmd('make %<')
  elseif filetype == 'rust' then
    vim.cmd('write')
    vim.cmd('!cargo run')
  elseif filetype == 'python' then
    print("Hello world")
    vim.cmd('write')
    vim.cmd('!python3.9 %')
  else
    print(filetype, "cannot be run.")
  end
end

-- Select all
lvim.keys.normal_mode["<leader>a"] = 'gg^vG$'

-- Change tab
lvim.keys.normal_mode["<M-l>"] = ':bn<CR>'
lvim.keys.normal_mode["<M-h>"] = ':bN<CR>'

-- Zen mode
lvim.keys.normal_mode["<F3>"] = ':AirlineToggle<CR>:set linebreak<CR>'
