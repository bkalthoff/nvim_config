
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

-- nvim-tree keymaps
vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeFindFile<CR>", { noremap = true, silent = true, desc = "Find current file in explorer" })
vim.keymap.set("n", "<leader>et", "<cmd>NvimTreeToggle<CR>", { noremap = true, silent = true, desc = "Toggle file explorer" })
vim.keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { noremap = true, silent = true, desc = "Collapse file explorer" })
vim.keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { noremap = true, silent = true, desc = "Refresh file explorer" })

-- Window navigation
vim.keymap.set("n", "<leader>h", "<C-w>h", { noremap = true, desc = "Move to left window" })
vim.keymap.set("n", "<leader>j", "<C-w>j", { noremap = true, desc = "Move to window below" })
vim.keymap.set("n", "<leader>k", "<C-w>k", { noremap = true, desc = "Move to window above" })
vim.keymap.set("n", "<leader>l", "<C-w>l", { noremap = true, desc = "Move to right window" })

-- Window management
vim.keymap.set("n", "<leader>wv", "<C-w>v", { noremap = true, desc = "Split window vertically" })
vim.keymap.set("n", "<leader>ws", "<C-w>s", { noremap = true, desc = "Split window horizontally" })
vim.keymap.set("n", "<leader>wc", "<C-w>c", { noremap = true, desc = "Close current window" })
vim.keymap.set("n", "<leader>wo", "<C-w>o", { noremap = true, desc = "Make window only" })

-- Git keymaps (simplified)
vim.keymap.set("n", "<leader>gg", "<cmd>Git<CR>", { noremap = true, desc = "Open Git status" })
vim.keymap.set("n", "<leader>gx", "<cmd>Gdiffsplit<CR>", { noremap = true, desc = "Git diff split" })

-- Terminal keymaps
vim.keymap.set("n", "<leader>tt", "<cmd>FloatermToggle<CR>", { noremap = true, silent = true, desc = "Toggle terminal" })
vim.keymap.set("n", "<leader>tf", "<cmd>FloatermNew<CR>", { noremap = true, silent = true, desc = "New floating terminal" })
vim.keymap.set("n", "<leader>th", "<cmd>FloatermNew --height=0.3 --width=0.8 --wintype=split --position=botright<CR>", { noremap = true, silent = true, desc = "New horizontal terminal" })
vim.keymap.set("n", "<leader>tv", "<cmd>FloatermNew --height=0.8 --width=0.3 --wintype=vsplit --position=rightbot<CR>", { noremap = true, silent = true, desc = "New vertical terminal" })
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { noremap = true, desc = "Exit terminal mode" })

-- Copilot configuration
vim.g.copilot_no_tab_map = true
vim.keymap.set("i", "<C-h>", 'copilot#Accept("<CR>")', { noremap = true, silent = true, expr = true })
