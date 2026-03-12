return {
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
          -- Dim the tab/indent characters (make them less white)
          Whitespace = { fg = "#3e4451" }, -- Dimmed gray
          NonText = { fg = "#3e4451" }, -- Dimmed gray
          SpecialKey = { fg = "#3e4451" }, -- Dimmed gray
        },
      })
    end,
  },

  -- Configure LazyVim to load vscode theme by default
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "vscode",
    },
  },
}
