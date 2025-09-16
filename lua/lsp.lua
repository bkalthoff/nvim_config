-- lsp.lua
-- LSP configuration and keybindings

-- Add Mason bin directory to PATH
local mason_bin = vim.fn.expand("~/.local/share/nvim/mason/bin")
if not vim.tbl_contains(vim.split(vim.env.PATH, ":"), mason_bin) then
  vim.env.PATH = mason_bin .. ":" .. vim.env.PATH
end

-- LSP on_attach function
local on_attach = function(client, bufnr)
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"

  -- LSP key mappings
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
  vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", bufopts)
  vim.keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", bufopts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
  vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, bufopts)
  vim.keymap.set("n", "<leader>a", vim.lsp.buf.code_action, bufopts)
  vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", bufopts)
  vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", bufopts)
  vim.keymap.set("n", "<leader>d", "<cmd>Telescope diagnostics<CR>", bufopts)
  -- <leader>l is now used for window navigation
end

local lspconfig = require("lspconfig")

-- LSP servers to configure
local servers = {
  "lua_ls",    -- Lua
  "pyright",   -- Python
  "bashls",    -- Bash
  "clangd",    -- C/C++
  "cmake",     -- CMake
  "vimls",     -- Vimscript
}

-- Get capabilities from nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
local cmp_nvim_lsp = require("cmp_nvim_lsp")
capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

-- Configure each LSP server
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup({
    on_attach = on_attach,
    flags = { debounce_text_changes = 150 },
    capabilities = capabilities,
  })
end
