
-- init.lua
-- Neovim configuration entry point

-- Load general settings first
require("settings")

-- Load plugins (lazy.nvim will handle installation)
require("plugins")

-- Load key mappings
require("keymaps")

-- Load LSP configuration
require("lsp")

-- Load autocommands
require("autocmds")

-- Load NERDTree functions
require("nerdtree")

-- Load theme settings
require("mytheme")

