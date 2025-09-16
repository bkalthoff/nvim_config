-- plugins.lua
-- Neovim plugin configuration using lazy.nvim

-- Install lazy.nvim if not already installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- Disable luarocks to avoid warnings
  rocks = {
    enabled = false,
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
          layout_strategy = "vertical",
          layout_config = {
            vertical = { width = 0.8, height = 0.8 },
          },
          sorting_strategy = "ascending",
          prompt_prefix = "  ",
          selection_caret = "  ",
        },
        pickers = {
          lsp_definitions = {
            show_line = true,
            fname_width = 50,
            path_display = { "smart" },
          },
          lsp_references = {
            show_line = true,
            fname_width = 50,
            path_display = { "smart" },
          },
          lsp_implementations = {
            show_line = true,
            fname_width = 50,
            path_display = { "smart" },
          },
          lsp_type_definitions = {
            show_line = true,
            fname_width = 50,
            path_display = { "smart" },
          },
        },
      })
    end,
  },

  -- Theme
  {
    "Mofiqul/vscode.nvim",
    priority = 1000,
    config = function()
      local c = require("vscode.colors").get_colors()
      require("vscode").setup({
        transparent = true,
        italic_comments = true,
        disable_nvimtree_bg = true,
        color_overrides = {
          vscLineNumber = "#FFFFFF",
        },
        group_overrides = {
          Cursor = { fg = c.vscDarkBlue, bg = c.vscLightGreen, bold = true },
        },
      })
      require("vscode").load()
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

  -- Treesitter - syntax highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "lua",
          "vim",
          "vimdoc",
          "query",
          "javascript",
          "typescript",
          "python",
          "bash",
          "json",
          "yaml",
          "markdown",
        },
        sync_install = false,
        auto_install = true,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
      })
    end,
  },

  -- File explorer
  {
    "preservim/nerdtree",
    cmd = { "NERDTree", "NERDTreeToggle", "NERDTreeFind" },
    init = function()
      vim.g.NERDTreeShowHidden = 1
      vim.g.NERDTreeIgnore = { ".git", "node_modules", ".DS_Store" }
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
      require("gitsigns").setup({
        signs = {
          add = { text = "▎", hl = "GitSignsAdd", numhl = "GitSignsAdd" },
          change = { text = "▎", hl = "GitSignsChange", numhl = "GitSignsChange" },
          delete = { text = "▁", hl = "GitSignsDelete", numhl = "GitSignsDelete" },
          topdelete = { text = "▔", hl = "GitSignsDelete", numhl = "GitSignsDelete" },
          changedelete = { text = "▎", hl = "GitSignsChange", numhl = "GitSignsChange" },
          untracked = { text = "▎", hl = "GitSignsAdd", numhl = "GitSignsAdd" },
        },
        signcolumn = true,
        numhl = false,  -- Only highlight line numbers, not the whole line
        linehl = false, -- Don't highlight the whole line
        word_diff = false,
        watch_gitdir = {
          interval = 1000,
          follow_files = true,
        },
        attach_to_untracked = true,
        current_line_blame = false, -- Keep blame off by default
        current_line_blame_opts = {
          virt_text = true,
          virt_text_pos = "eol",
          delay = 1000,
          ignore_whitespace = false,
        },
        sign_priority = 6,
        update_debounce = 100,
        status_formatter = nil,
        max_file_length = 40000,
        preview_config = {
          border = "single",
          style = "minimal",
          relative = "cursor",
          row = 0,
          col = 1,
        },
      })
    end,
  },

  {
    "ruanyl/vim-gh-line",
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

  -- Auto-detect indentation
  {
    "tpope/vim-sleuth",
    event = "BufRead",
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
        completion = {
          completeopt = "menu,menuone,noinsert",
        },
      })

      luasnip.setup({
        history = true,
        delete_events = { "TextChanged", "InsertLeave" },
      })
    end,
  },

  -- Mason for LSP server management
  {
    "williamboman/mason.nvim",
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