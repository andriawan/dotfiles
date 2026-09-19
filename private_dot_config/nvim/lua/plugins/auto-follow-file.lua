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
          ignored = true,
        },
        files = {
          hidden = true, -- tampilin dotfiles kayak .env, .gitignore
          ignored = true, -- tampilin file yang di-gitignore juga
        },
      },
    },
  },
}
