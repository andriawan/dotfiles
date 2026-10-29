-- lua/plugins/lsp.lua
return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        phpactor = { mason = false },

        kotlin_language_server = { enabled = false },
        kmp_lsp = {
          enabled = true,
          mason = false, -- bukan paket Mason, jangan coba diinstall
          cmd = { "kmp-lsp" }, -- harus ada di PATH
          filetypes = { "kotlin" },
          root_markers = { "settings.gradle.kts", "settings.gradle", ".git" },
        },
      },
    },
  },
}
