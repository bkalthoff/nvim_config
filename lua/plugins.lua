-- plugins.lua

local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    print("Installing packer.nvim...")
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd('packadd packer.nvim')
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use, use_rocks)
  -- Packer manages itself
  use 'wbthomason/packer.nvim'

  -- Plugins
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  use 'olimorris/onedarkpro.nvim'
  use 'nvim-lualine/lualine.nvim'
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
  use 'preservim/nerdtree'
  use 'voldikss/vim-floaterm'
  use 'numToStr/Comment.nvim'
  use 'ThePrimeagen/refactoring.nvim'
  use 'windwp/nvim-autopairs'
  use 'ThePrimeagen/harpoon'
  use 'f-person/git-blame.nvim'
  use 'lewis6991/gitsigns.nvim'
  use 'ruanyl/vim-gh-line'
  use 'github/copilot.vim'
  use 'bronson/vim-trailing-whitespace'
  -- LSP and completion
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-buffer'
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'
  use 'airblade/vim-gitgutter'
  use 'Mofiqul/vscode.nvim'
  use 'lambdalisue/suda.vim'

  -- Mason for LSP server management
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'


  -- Automatically set up configuration after cloning packer.nvim
  if packer_bootstrap then
    require('packer').sync()
  end
end)
