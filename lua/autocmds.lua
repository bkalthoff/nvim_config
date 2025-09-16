
-- autocmds.lua

-- Sync nvim-tree with the current buffer
vim.api.nvim_create_autocmd('BufRead', {
  pattern = '*',
  callback = function()
    require('filetree').sync_tree()
  end,
})

-- Auto-open nvim-tree on directory open
vim.api.nvim_create_autocmd({ "VimEnter" }, {
  callback = function(data)
    -- buffer is a directory
    local directory = vim.fn.isdirectory(data.file) == 1

    if not directory then
      return
    end

    -- change to the directory
    vim.cmd.cd(data.file)

    -- open the tree
    require("nvim-tree.api").tree.open()
  end,
})
