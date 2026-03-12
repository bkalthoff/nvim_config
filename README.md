# My LazyVim Config

Personal Neovim configuration based on LazyVim.

## Installation

1. Clone this repo:
```bash
git clone <your-repo-url> ~/.config/lazyvim-test
```

2. Start Neovim:
```bash
NVIM_APPNAME=lazyvim-test nvim
```

LazyVim and all plugins will auto-install on first run.

## Key Customizations

- **Theme**: VSCode (transparent background)
- **Leader key**: Space
- **Save**: `<leader>s`
- **Search**: `<leader>S` prefix (moved from default `<leader>s`)
- **Copilot**: `<C-h>` to accept
- **Terminal splits**: `<leader>th` (horizontal), `<leader>tv` (vertical)
- **Escape**: `jk` in insert mode
- **Git blame**: Enabled by default
- **Inlay hints**: Disabled by default (toggle with `<leader>uh`)
- **Auto format**: Disabled (manual with `<leader>cf`)

## Updating

### Update LazyVim and plugins:
```vim
:Lazy update
```

### Update LazyVim core:
```vim
:LazyExtras
```

LazyVim updates itself as a plugin - your config files stay separate!

## Structure

```
.
├── lua/
│   ├── config/
│   │   ├── autocmds.lua      # Auto commands
│   │   ├── keymaps.lua       # Custom keybindings
│   │   ├── lazy.lua          # Lazy.nvim setup
│   │   └── options.lua       # Vim options
│   └── plugins/              # Plugin configurations
│       ├── copilot.lua
│       ├── themes.lua
│       ├── telescope.lua
│       ├── gitsigns.lua
│       └── ...
├── init.lua                  # Entry point
└── lazy-lock.json           # Plugin versions (gitignored)
```
