return {
  "folke/snacks.nvim",
  opts = {
    explorer = {
      replace_netrw = true,
    },

    picker = {
      sources = {
        explorer = {
          follow_file = true,
          hidden = true,
          ignored = false,
        },
      },
    },
  },
}
