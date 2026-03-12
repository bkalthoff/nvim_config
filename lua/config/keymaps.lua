-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- ============================================================================
-- GENERAL MAPPINGS
-- ============================================================================

-- Map jk to escape in insert mode
vim.keymap.set("i", "jk", "<Esc>", { noremap = true })

-- Save file with <leader>s
vim.keymap.set("n", "<leader>s", ":w<CR>", { noremap = true, desc = "Save file" })

-- ============================================================================
-- TERMINAL MAPPINGS
-- ============================================================================

-- Open terminal in splits
vim.keymap.set("n", "<leader>th", function()
  vim.cmd("split")
  vim.cmd("terminal")
  vim.cmd("resize 15")
end, { noremap = true, desc = "Terminal horizontal split" })

vim.keymap.set("n", "<leader>tv", function()
  vim.cmd("vsplit")
  vim.cmd("terminal")
end, { noremap = true, desc = "Terminal vertical split" })

-- Exit terminal mode with Esc
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { noremap = true, desc = "Exit terminal mode" })

-- Note: Search keymaps moved from <leader>s to <leader>S in lua/plugins/telescope.lua
-- Note: Copilot keybinds are configured in lua/plugins/copilot.lua
-- Accept: <C-h>
-- Next suggestion: <M-]> (Alt+])
-- Previous suggestion: <M-[> (Alt+[)
-- Dismiss: <C-]>
-- Open panel: <M-CR> (Alt+Enter)
