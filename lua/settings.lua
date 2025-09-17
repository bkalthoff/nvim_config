-- settings.lua
-- General Neovim settings

-- Leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- General settings
vim.opt.guicursor = ""
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.hlsearch = false
vim.opt.hidden = true
vim.opt.errorbells = false
-- Default indentation (vim-sleuth will auto-detect and override)
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.smarttab = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = vim.fn.expand("~/.vim/undodir")
vim.opt.undofile = true
vim.opt.incsearch = true
vim.opt.scrolloff = 8
vim.opt.isfname:append("@-@")
vim.opt.cmdheight = 1
vim.opt.updatetime = 50
vim.opt.shortmess:append("c")
vim.opt.clipboard = "unnamedplus"
vim.opt.completeopt = "menu,menuone,noselect"
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.cursorline = true
vim.opt.signcolumn = "yes"
vim.opt.wrap = false
vim.opt.termguicolors = true

-- Enable filetype detection
vim.cmd("filetype plugin indent on")
vim.cmd("syntax on")

-- Ensure backspace is bound separately from C-h
vim.keymap.set("i", "<BS>", "<BS>", { noremap = true })

