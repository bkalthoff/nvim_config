-- Which-key configuration - customize the leader key menu
return {
  {
    "folke/which-key.nvim",
    opts = {
      spec = {
        -- Custom labels for key groups
        { "<leader>s", desc = "Save file", mode = "n" },
        { "<leader>S", group = "search" },
        { "<leader>t", group = "terminal" },
      },
    },
  },
}

