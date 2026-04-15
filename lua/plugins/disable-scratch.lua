-- Snacks configuration - disable scratch buffer mappings and include hidden/ignored files in search
return {
  {
    "folke/snacks.nvim",
    keys = {
      { "<leader>S", false },
      { "<leader>fS", false },
    },
    opts = function(_, opts)
      return vim.tbl_deep_extend("force", opts or {}, {
        picker = {
          sources = {
            files = {
              hidden = true,
              ignored = true,
            },
            grep = {
              hidden = true,
              ignored = true,
            },
            grep_word = {
              hidden = true,
              ignored = true,
            },
          },
        },
      })
    end,
  },
}

