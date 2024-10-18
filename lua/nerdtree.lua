
-- nerdtree.lua

local M = {}

function M.is_nerdtree_open()
  local nerdtree_bufname = vim.g.NERDTreeBufName
  if nerdtree_bufname then
    return vim.fn.bufwinnr(nerdtree_bufname) ~= -1
  end
  return false
end

function M.check_if_current_buffer_is_file()
  return vim.fn.expand('%'):len() > 0
end

function M.sync_tree()
  if vim.bo.modifiable and M.is_nerdtree_open() and M.check_if_current_buffer_is_file() and not vim.wo.diff then
    vim.cmd('NERDTreeFind')
    vim.cmd('wincmd p')
  end
end

function M.toggle_tree()
  if M.check_if_current_buffer_is_file() then
    if M.is_nerdtree_open() then
      vim.cmd('NERDTreeClose')
    else
      vim.cmd('NERDTreeFind')
    end
  else
    vim.cmd('NERDTree')
  end
end

-- Map toggle function to <leader>e
vim.api.nvim_set_keymap('n', '<leader>e', ':lua require("nerdtree").toggle_tree()<CR>', {noremap = true, silent = true})

return M
