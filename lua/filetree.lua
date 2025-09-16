
-- filetree.lua
-- File tree utilities and functions using nvim-tree.lua

local M = {}

function M.is_tree_open()
  local nvim_tree = require("nvim-tree")
  return nvim_tree.get_tree_state().visible
end

function M.check_if_current_buffer_is_file()
  return vim.fn.expand('%'):len() > 0
end

function M.sync_tree()
  if M.check_if_current_buffer_is_file() and not vim.wo.diff then
    require("nvim-tree.api").tree.find_file()
  end
end

function M.toggle_tree()
  require("nvim-tree.api").tree.toggle()
end

function M.find_file()
  require("nvim-tree.api").tree.find_file()
end

-- Keymaps are defined in keymaps.lua to avoid conflicts

return M
