
-- keymaps.lua
-- Global key mappings

local opts = { noremap = true, silent = true }

-- Telescope mappings
vim.keymap.set("n", "<leader>ff", function()
  require("telescope.builtin").grep_string({ search = vim.fn.input("Search for > ") })
end, opts)

vim.keymap.set("n", "<leader>p", "<cmd>Telescope find_files<CR>", opts)
vim.keymap.set("n", "<leader>fr", "<cmd>Telescope lsp_references<CR>", opts)
vim.keymap.set("n", "<leader>fc", "<cmd>Telescope git_files<CR>", opts)
vim.keymap.set("n", "<leader>b", "<cmd>Telescope buffers<CR>", opts)

-- General mappings
vim.keymap.set("i", "jk", "<Esc>", { noremap = true })
vim.keymap.set("n", "<leader>s", ":w<CR>", { noremap = true })

-- Copilot configuration
vim.g.copilot_no_tab_map = true
vim.keymap.set("i", "<C-h>", 'copilot#Accept("<CR>")', { noremap = true, silent = true, expr = true })
