-- Luasnip snippet jumping
lvim.keys.insert_mode['<c-.>'] = ":lua require'luasnip'.jump(1)<cr>"

-- Keeps target word on center while searching
lvim.keys.normal_mode["n"] = "nzzzv"
lvim.keys.normal_mode["N"] = "Nzzzv"

-- Allows using jk and kj as alternative Esc
lvim.keys.insert_mode["jk"] = '<Esc><Esc>'
lvim.keys.insert_mode["kj"] = '<Esc><Esc>'

-- move the cursor without leaving insert mode
lvim.keys.insert_mode["<A-h>"] = "<Left>"
lvim.keys.insert_mode["<A-l>"] = "<Right>"

-- Runs a file
lvim.keys.normal_mode["<F8>"] = function()
  local filetype = vim.bo.filetype
  if filetype == 'c' or filetype == 'cpp' then
    vim.cmd('make %< CFLAGS="-g -Wall"')
  else
    print(filetype, "cannot be compiled.")
  end
end
lvim.keys.normal_mode["<F10>"] = function()
  local filetype = vim.bo.filetype
  if filetype == 'c' or filetype == 'cpp' then
    vim.cmd('make %< CFLAGS="-g -Wall" && ./%<')
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


-- Debugger shortcuts
lvim.keys.normal_mode["<F5>"] = "<CMD>DapStepInto<CR>"
lvim.keys.normal_mode["<F6>"] = "<CMD>DapStepOver<CR>"

-- Change tab
lvim.keys.normal_mode["<M-l>"] = ':bn<CR>'
lvim.keys.normal_mode["<M-h>"] = ':bN<CR>'
