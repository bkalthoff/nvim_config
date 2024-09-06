"""""" download plug.vim if not in path
if empty(glob($HOME . "/.local/share/nvim/site/autoload/plug.vim"))
	let cmd = 'curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

	execute "!" . cmd
endif

call plug#begin('~/.config/nvim/plugged')
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'olimorris/onedarkpro.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'preservim/nerdtree'
Plug 'voldikss/vim-floaterm'
Plug 'numToStr/Comment.nvim'
Plug 'ThePrimeagen/refactoring.nvim'

Plug 'windwp/nvim-autopairs'
Plug 'ThePrimeagen/harpoon'

Plug 'f-person/git-blame.nvim'
Plug 'lewis6991/gitsigns.nvim'

Plug 'ruanyl/vim-gh-line'
Plug 'github/copilot.vim'
Plug 'bronson/vim-trailing-whitespace'
" LSP and completion
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-buffer'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'airblade/vim-gitgutter'
Plug 'Mofiqul/vscode.nvim'
Plug 'lambdalisue/suda.vim'
call plug#end()

lua <<EOF
require('mytheme')
require('init')
EOF


let mapleader=" "
let maplocalleader=" "
set guicursor=
set relativenumber
set nohlsearch
set hidden
set noerrorbells
set tabstop=8
set shiftwidth=8
set smartindent
set nu
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set scrolloff=18
set isfname+=@-@
set cmdheight=1
set updatetime=50
set shortmess+=c
set clipboard=unnamedplus
set completeopt=menu,menuone,noselect
set splitbelow
set splitright
set cursorline
" set signcolumn=number
filetype on
filetype indent on
filetype plugin on
syntax on


" Telescope
nnoremap <leader>ff <cmd>lua require('telescope.builtin').grep_string({ find_command = {'rg', '--files', '--hidden', '-g', '!.git' }, search = vim.fn.input("Search for > ")})<CR>
nnoremap <leader>p <cmd>lua require('telescope.builtin').find_files({ find_command = {'rg', '--files', '--hidden', '-g', '!.git' }})<CR>
nnoremap <leader>fr <cmd>lua require('telescope.builtin').lsp_references({ on_complete = { function() vim.cmd"stopinsert" end }, })<CR>
nnoremap <leader>fc <cmd>lua require('telescope.builtin').find_files({ find_command = {'git', '--no-pager', 'diff', '--name-only' }})<CR>
nnoremap <leader>b <cmd>lua require('telescope.builtin').buffers()<CR>
" set esc to jk
inoremap jk <esc>

" set leader s to save
nnoremap <leader>s :w<CR>

" rebind copilot accept suggestion to <C-Tab>
let g:copilot_no_tab_map = v:true
inoremap <silent><script><expr> <C-h> copilot#Accept("\<CR>")

" Check if NERDTree is open or active
function! IsNERDTreeOpen()
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

function! CheckIfCurrentBufferIsFile()
  return strlen(expand('%')) > 0
endfunction

" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
function! SyncTree()
  if &modifiable && IsNERDTreeOpen() && CheckIfCurrentBufferIsFile() && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction

" Highlight currently open buffer in NERDTree
autocmd BufRead * call SyncTree()

function! ToggleTree()
  if CheckIfCurrentBufferIsFile()
    if IsNERDTreeOpen()
      NERDTreeClose
    else
      NERDTreeFind
    endif
  else
    NERDTree
  endif
endfunction

" open NERDTree with leader e
nnoremap <leader>e :call ToggleTree()<CR>

" Enable nvim-cmp and set up key mappings
" Initialize cmp
lua << EOF
  local cmp = require('cmp')
  cmp.setup({
    -- Enable LSP completion
    sources = {
      { name = 'nvim_lsp' },
      { name = 'path' },
      { name = 'buffer' },
      { name = 'luasnip' },
    },
    completion = {
      completeopt = 'menu,menuone,noselect',
    },
    mapping = {
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<CR>'] = cmp.mapping.confirm({
        behavior = cmp.ConfirmBehavior.Insert,
        select = true,
      }),
    },
    snippet = {
      expand = function(args)
        require('luasnip').lsp_expand(args.body)
      end,
    },
  })
EOF

" Set up autopairs (if you've installed the nvim-autopairs plugin)
lua << EOF
  local cmp = require('cmp')
  local autopairs = require('nvim-autopairs')

  cmp.setup.buffer({
    sources = {
      { name = 'nvim_lsp' },
      { name = 'path' },
      { name = 'buffer' },
    },
  })

  autopairs.setup({
    check_ts = true,
  })

  local keymap = {
    ['<CR>'] = autopairs.esc('<CR>'),
    ['<C-Space>'] = cmp.mapping.complete(),
  }

--  vim.keymap.set("n","gd", vim.lsp.buf.definition, bufopts)
--  vim.keymap.set("n","gD", "<cmd>vsp | lua vim.lsp.buf.definition()<CR>", bufopts)
--  vim.keymap.set("n","gt", vim.lsp.buf.type_definition, bufopts)
--  vim.keymap.set("n","K", vim.lsp.buf.hover, bufopts)
--  vim.keymap.set("n","<leader>r", vim.lsp.buf.rename, bufopts)
--  vim.keymap.set("n","<leader>a", vim.lsp.buf.code_action, bufopts)
  vim.keymap.set("n","<leader>d", "<cmd>Telescope diagnostics<cr>", bufopts)
  vim.keymap.set("n","<leader>l", "y<esc>oconsole.log('\\x1b[33m<c-r>\" ->', <c-r>\", '\\x1b[0m');<esc>", bufopts)
  cmp.setup({
    snippet = {
      expand = function(args)
        require('luasnip').lsp_expand(args.body)
      end,
    },
    mapping = {
      ['<C-CR>'] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
      ['<C-j>'] = function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        else
          fallback()
        end
      end,
      ['<C-k>'] = function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        else
          fallback()
	end
      end,
    },
  })

  function on_attach(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo.omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = bufnr }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set("n","<leader>r", vim.lsp.buf.rename, bufopts)
    vim.keymap.set("n","<leader>a", vim.lsp.buf.code_action, bufopts)
  end

  local servers = { 'clangd', 'pyright', 'vimls' }
  for _, lsp in ipairs(servers) do
    require('lspconfig')[lsp].setup({
      on_attach = on_attach,
      flags = {
	debounce_text_changes = 150,
      }
    })
  end

EOF

