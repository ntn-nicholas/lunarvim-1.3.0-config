vim.cmd[[
  let g:tmux_navigator_disable_when_zoomed = 1
  let g:tmux_navigator_no_mappings = 1

  noremap <silent> {Left-Mapping} :<C-U>TmuxNavigateLeft<cr>
  noremap <silent> {Down-Mapping} :<C-U>TmuxNavigateDown<cr>
  noremap <silent> {Up-Mapping} :<C-U>TmuxNavigateUp<cr>
  noremap <silent> {Right-Mapping} :<C-U>TmuxNavigateRight<cr>
]]

