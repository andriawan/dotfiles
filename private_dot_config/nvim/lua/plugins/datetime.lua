return {
  "nvim-lualine/lualine.nvim",
  opts = function(_, opts)
    opts.sections.lualine_z = {
      function()
        return os.date("%d-%m-%Y %H:%M")
      end,
    }
    return opts
  end,
}
