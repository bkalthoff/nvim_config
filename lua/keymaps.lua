
-- keymaps.lua

local map = vim.api.nvim_set_keymap
local default_opts = {noremap = true, silent = true}

-- Telescope mappings
map('n', '<leader>ff', [[<cmd>lua require('telescope.builtin').grep_string({search = vim.fn.input("Search for > ")})<CR>]], default_opts)
map('n', '<leader>p', [[<cmd>lua require('telescope.builtin').find_files()<CR>]], default_opts)
map('n', '<leader>fr', [[<cmd>lua require('telescope.builtin').lsp_references()<CR>]], default_opts)
map('n', '<leader>fc', [[<cmd>lua require('telescope.builtin').git_files()<CR>]], default_opts)
map('n', '<leader>b', [[<cmd>lua require('telescope.builtin').buffers()<CR>]], default_opts)

-- Set 'jk' to escape in insert mode
map('i', 'jk', '<Esc>', {noremap = true})

-- Leader + s to save
map('n', '<leader>s', ':w<CR>', {noremap = true})

-- Rebind Copilot accept suggestion to <C-h>
vim.g.copilot_no_tab_map = true
map('i', '<C-h>', 'copilot#Accept("<CR>")', {noremap = true, silent = true, expr = true})
