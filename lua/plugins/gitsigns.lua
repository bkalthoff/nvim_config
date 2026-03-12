-- Git blame configuration (using f-person/git-blame.nvim like your old config)
return {
  -- Disable gitsigns blame (we'll use git-blame.nvim instead)
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      current_line_blame = false,
    },
  },

  -- Add git-blame.nvim (your old plugin)
  {
    "f-person/git-blame.nvim",
    event = "BufRead",
    opts = {
      enabled = true,
      date_format = "%Y-%m-%d %H:%M",
    },
  },
}

