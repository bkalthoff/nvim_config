-- settings.lua

-- Leader keys
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- General settings
vim.opt.guicursor = ''
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.hlsearch = false
vim.opt.hidden = true
vim.opt.errorbells = false
vim.opt.tabstop = 8
vim.opt.shiftwidth = 8
vim.opt.smartindent = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = vim.fn.expand('~/.vim/undodir')
vim.opt.undofile = true
vim.opt.incsearch = true
vim.opt.scrolloff = 18
vim.opt.isfname:append('@-@')
vim.opt.cmdheight = 1
vim.opt.updatetime = 50
vim.opt.shortmess:append('c')
vim.opt.clipboard = 'unnamedplus'
vim.opt.completeopt = 'menu,menuone,noselect'
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.cursorline = true
-- vim.opt.signcolumn = 'number'
vim.cmd('filetype plugin indent on')
vim.cmd('syntax on')

