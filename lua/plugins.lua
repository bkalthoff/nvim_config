-- plugins.lua

-- Install lazy.nvim if not already installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- Disable luarocks to avoid warnings
  rocks = {
    enabled = false,
  },
  -- Packer manages itself
  {
    "wbthomason/packer.nvim",
    lazy = true, -- Don't load this plugin
  },

  -- Core utilities
  {
    "nvim-lua/plenary.nvim",
    lazy = true,
  },

  -- Telescope - fuzzy finder
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup({
        defaults = {
          file_ignore_patterns = { "node_modules", ".git" },
          prompt_prefix = "  ",
          selection_caret = "  ",
          layout_strategy = "horizontal",
          layout_config = {
            horizontal = {
              width = 0.8,
              height = 0.8,
            },
          },
          winblend = 0,
          border = {},
          borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
        },
      })
    end,
  },

  -- Themes
  {
    "olimorris/onedarkpro.nvim",
    priority = 1000, -- Load this first
    config = function()
      vim.cmd.colorscheme("onedark")
    end,
  },

  {
    "Mofiqul/vscode.nvim",
    priority = 1000,
    config = function()
      local c = require('vscode.colors').get_colors()
      require('vscode').setup({
        transparent = true,
        italic_comments = true,
        disable_nvimtree_bg = true,
        color_overrides = {
          vscLineNumber = '#FFFFFF',
        },
        group_overrides = {
          Cursor = { fg=c.vscDarkBlue, bg=c.vscLightGreen, bold=true },
        }
      })
      require('vscode').load()
    end,
  },

  -- Status line
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = {
          theme = "auto",
        },
      })
    end,
  },

  -- Treesitter - syntax highlighting (temporarily disabled due to download issues)
  -- {
  --   "nvim-treesitter/nvim-treesitter",
  --   build = ":TSUpdate",
  --   config = function()
  --     require("nvim-treesitter.configs").setup({
  --       ensure_installed = { "lua", "vim", "vimdoc", "query", "javascript", "typescript", "python", "bash" },
  --       sync_install = false,
  --       auto_install = true,
  --       highlight = {
  --         enable = true,
  --         additional_vim_regex_highlighting = false,
  --       },
  --     })
  --   end,
  -- },

  -- File explorer
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("nvim-tree").setup({
        sort_by = "case_sensitive",
        view = {
          width = 30,
          side = "left",
        },
        renderer = {
          group_empty = true,
        },
        filters = {
          dotfiles = false,
        },
        git = {
          enable = true,
          ignore = false,
        },
        actions = {
          open_file = {
            window_picker = {
              enable = false,
            },
          },
        },
      })
    end,
  },

  -- Terminal
  {
    "voldikss/vim-floaterm",
    cmd = { "FloatermNew", "FloatermToggle" },
    config = function()
      vim.g.floaterm_width = 0.8
      vim.g.floaterm_height = 0.8
    end,
  },

  -- Comments
  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  },

  -- Refactoring
  {
    "ThePrimeagen/refactoring.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-treesitter/nvim-treesitter" },
    },
  },

  -- Auto pairs
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup({})
    end,
  },

  -- Harpoon - file navigation
  {
    "ThePrimeagen/harpoon",
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  -- Git
  {
    "f-person/git-blame.nvim",
    event = "BufRead",
  },

  {
    "lewis6991/gitsigns.nvim",
    event = "BufRead",
    config = function()
      require("gitsigns").setup()
    end,
  },

  {
    "ruanyl/vim-gh-line",
    event = "BufRead",
  },

  {
    "airblade/vim-gitgutter",
    event = "BufRead",
  },

  -- GitHub Copilot
  {
    "github/copilot.vim",
    event = "InsertEnter",
  },

  -- Utilities
  {
    "bronson/vim-trailing-whitespace",
    event = "BufWritePre",
  },

  {
    "lambdalisue/suda.vim",
    cmd = { "SudaWrite", "SudaRead" },
  },

  -- LSP and completion
  {
    "neovim/nvim-lspconfig",
    event = "BufRead",
  },

  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-buffer",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")
      
      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-k>"] = cmp.mapping.select_prev_item(),
          ["<C-j>"] = cmp.mapping.select_next_item(),
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
        }, {
          { name = "path" },
          { name = "buffer" },
        }),
      })
      
      luasnip.setup({
        history = true,
        delete_events = { "TextChanged", "InsertLeave" },
      })
    end,
  },

  {
    "hrsh7th/cmp-nvim-lsp",
    event = "InsertEnter",
  },

  {
    "hrsh7th/cmp-path",
    event = "InsertEnter",
  },

  {
    "hrsh7th/cmp-buffer",
    event = "InsertEnter",
  },

  {
    "L3MON4D3/LuaSnip",
    event = "InsertEnter",
  },

  {
    "saadparwaiz1/cmp_luasnip",
    event = "InsertEnter",
  },

  -- Mason for LSP server management
  {
    "mason-org/mason.nvim",
    cmd = "Mason",
    config = function()
      require("mason").setup()
    end,
  },

  -- Icons
  {
    "nvim-tree/nvim-web-devicons",
    lazy = true,
  },
})
