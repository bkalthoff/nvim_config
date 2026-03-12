-- Telescope configuration - remap search from <leader>s to <leader>S
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
      { "<leader>Sg", "<cmd>Telescope live_grep<cr>", desc = "Grep (root dir)" },
      { "<leader>Sw", "<cmd>Telescope grep_string<cr>", desc = "Word (root dir)" },
      { "<leader>Ss", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Document symbols" },
      { "<leader>SS", "<cmd>Telescope lsp_workspace_symbols<cr>", desc = "Workspace symbols" },
      { "<leader>Sb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
      { "<leader>Sc", "<cmd>Telescope command_history<cr>", desc = "Command History" },
      { "<leader>Sh", "<cmd>Telescope help_tags<cr>", desc = "Help Pages" },
      { "<leader>Sm", "<cmd>Telescope marks<cr>", desc = "Jump to Mark" },
      { "<leader>Sr", "<cmd>Telescope oldfiles<cr>", desc = "Recent files" },
    },
  },
}


