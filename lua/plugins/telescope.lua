-- Telescope configuration - remap search from <leader>s to <leader>S
local function telescope_find_command()
  if vim.fn.executable("rg") == 1 then
    return { "rg", "--files", "--color", "never", "-g", "!.git" }
  elseif vim.fn.executable("fd") == 1 then
    return { "fd", "--type", "f", "--color", "never", "-E", ".git" }
  elseif vim.fn.executable("fdfind") == 1 then
    return { "fdfind", "--type", "f", "--color", "never", "-E", ".git" }
  elseif vim.fn.executable("find") == 1 and vim.fn.has("win32") == 0 then
    return { "find", ".", "-type", "f", "-not", "-path", "*/.git/*" }
  elseif vim.fn.executable("where") == 1 then
    return { "where", "/r", ".", "*" }
  end
end

local function extend_unique(args, additions)
  for _, arg in ipairs(additions) do
    if not vim.tbl_contains(args, arg) then
      table.insert(args, arg)
    end
  end

  return args
end

return {
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      -- Disable all default <leader>s keymaps
      { "<leader>sg", false },
      { "<leader>sG", false },
      { "<leader>sw", false },
      { "<leader>sW", false },
      { "<leader>ss", false },
      { "<leader>sS", false },
      { "<leader>sb", false },
      { "<leader>sB", false },
      { "<leader>sc", false },
      { "<leader>sC", false },
      { "<leader>sd", false },
      { "<leader>sD", false },
      { "<leader>sh", false },
      { "<leader>sH", false },
      { "<leader>sm", false },
      { "<leader>sM", false },
      { "<leader>sr", false },
      { "<leader>sR", false },
      
      -- Disable scratch buffer on <leader>S
      { "<leader>S", false },

      -- Remap main search commands to <leader>S (capital S)
      {
        "<leader>Sg",
        function()
          require("telescope.builtin").live_grep({ cwd = LazyVim.root() })
        end,
        desc = "Grep (root dir)",
      },
      {
        "<leader>Sw",
        function()
          require("telescope.builtin").grep_string({ cwd = LazyVim.root() })
        end,
        desc = "Word (root dir)",
      },
      { "<leader>Ss", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Document symbols" },
      { "<leader>SS", "<cmd>Telescope lsp_workspace_symbols<cr>", desc = "Workspace symbols" },
      { "<leader>Sb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
      { "<leader>Sc", "<cmd>Telescope command_history<cr>", desc = "Command History" },
      { "<leader>Sh", "<cmd>Telescope help_tags<cr>", desc = "Help Pages" },
      { "<leader>Sm", "<cmd>Telescope marks<cr>", desc = "Jump to Mark" },
      { "<leader>Sr", "<cmd>Telescope oldfiles<cr>", desc = "Recent files" },
    },
    opts = function(_, opts)
      opts = opts or {}
      opts.defaults = opts.defaults or {}
      opts.pickers = opts.pickers or {}

      local vimgrep_arguments = vim.deepcopy(
        opts.defaults.vimgrep_arguments or require("telescope.config").values.vimgrep_arguments
      )
      opts.defaults.vimgrep_arguments = extend_unique(vimgrep_arguments, {
        "--hidden",
        "--no-ignore",
        "--glob=!.git",
      })

      opts.pickers.find_files = vim.tbl_deep_extend("force", opts.pickers.find_files or {}, {
        find_command = telescope_find_command,
        hidden = true,
        no_ignore = true,
      })

      return opts
    end,
  },
}
