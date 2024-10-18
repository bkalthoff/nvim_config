-- lsp.lua

-- Mason setup
require('mason').setup()
require('mason-lspconfig').setup({
  ensure_installed = {
    'clangd',    -- C/C++
    'pyright',   -- Python
    'vimls',     -- Vimscript
    'lua_ls',    -- Lua
    'bashls',    -- Bash
    'cmake',     -- CMake
  },
})

-- nvim-cmp setup
local cmp = require('cmp')
local luasnip = require('luasnip')

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  completion = {
    completeopt = 'menu,menuone,noselect',
  },
  mapping = {
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-CR>'] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
    ['<C-j>'] = cmp.mapping.select_next_item(),
    ['<C-k>'] = cmp.mapping.select_prev_item(),
    ['<CR>'] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = true }),
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  }, {
    { name = 'path' },
    { name = 'buffer' },
  }),
})

-- Autopairs setup
require('nvim-autopairs').setup({
  check_ts = true,
})

-- LSP settings
local on_attach = function(client, bufnr)
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.bo[bufnr].omnifunc = 'v:lua.vim.lsp.omnifunc'

  -- Key mappings
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<leader>a', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<leader>d', '<cmd>Telescope diagnostics<CR>', bufopts)
  vim.keymap.set('n', '<leader>l', [[y<Esc>oconsole.log('\x1b[33m' .. vim.fn.getreg('"') .. ' ->', ]] ..
    [[vim.fn.getreg('"') .. ', \x1b[0m');<Esc>]], bufopts)
end

local lspconfig = require('lspconfig')
local servers = {
  'clangd',    -- C/C++
  'pyright',   -- Python
  'vimls',     -- Vimscript
  'lua_ls',    -- Lua
  'bashls',    -- Bash
  'cmake',     -- CMake
  'gopls',     -- Go
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup({
    on_attach = on_attach,
    flags = { debounce_text_changes = 150 },
  })
end
