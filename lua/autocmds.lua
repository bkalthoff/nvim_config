
-- autocmds.lua

-- Sync NERDTree with the current buffer
vim.api.nvim_create_autocmd('BufRead', {
  pattern = '*',
  callback = function()
    require('nerdtree').sync_tree()
  end,
})
