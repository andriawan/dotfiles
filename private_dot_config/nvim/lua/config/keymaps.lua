-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Single <Esc> exits terminal mode in buffer (non-floating) terminals only.
-- Floating terminals (lazygit, toggleterm float, etc.) keep their own <Esc> handling.
vim.keymap.set("t", "<Esc><Esc>", function()
  if vim.api.nvim_win_get_config(0).relative == "" then
    return vim.api.nvim_replace_termcodes("<C-\\><C-n>", true, false, true)
  end
  return vim.api.nvim_replace_termcodes("<Esc>", true, false, true)
end, { expr = true, desc = "Exit Terminal Mode (buffer terminals)" })

vim.api.nvim_create_autocmd("FileType", {
  pattern = "java",
  callback = function()
    -- Core Navigation Mappings
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Java: Go to Definition", buffer = true })
    vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "Java: Go to References", buffer = true })
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "Java: Go to Implementation", buffer = true })
    vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Java: Hover Documentation", buffer = true })
    vim.keymap.set("n", "gs", vim.lsp.buf.document_symbol, { desc = "LSP: List Document Symbols", buffer = true })
  end,
})

vim.keymap.set("n", "<C-p>", "<leader>fr", { remap = true })
vim.keymap.set("n", "<C-S-o>", "<leader>ss", { remap = true })
vim.keymap.set("n", "<C-2>", ":enew | terminal<CR>", { desc = "Open terminal in new buffer" })
vim.keymap.set("n", "<c-n>", ":enew<cr>", { desc = "new empty buffer" })
vim.keymap.set("t", "<C-w>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

vim.keymap.set("n", "<leader>tn", function()
  vim.cmd("tabnew | terminal")
end, { desc = "Open Terminal (New Tab)" })

vim.keymap.set("n", "<leader>rd", function()
  vim.cmd("tabnew | terminal npm run dev")
end, { desc = "Run npm run dev" })

-- Replaces your current mapping but injects "direction=float" dynamically
vim.keymap.set("n", "<C-\\>", function()
  local count = vim.v.count > 0 and vim.v.count or 1
  vim.cmd(count .. "ToggleTerm direction=float")
end, { desc = "Toggle Floating Terminal with Count" })

-- Terminal Mode fallback to exit cleanly
vim.keymap.set("t", "<C-\\>", "<C-\\><C-n><Cmd>ToggleTerm<CR>", { desc = "Toggle Floating Terminal" })

-- Normal Mode: Press <leader>tn to create a named floating terminal
vim.keymap.set("n", "<leader>tn", function()
  vim.ui.input({ prompt = "Terminal Name: " }, function(name)
    if not name or name == "" then
      return
    end

    -- Find the next available terminal ID so you don't overwrite existing ones
    local next_id = 1
    while vim.fn.bufexists("toggleterm#" .. next_id) == 1 do
      next_id = next_id + 1
    end

    -- Spawns the next terminal ID as a float with your custom name
    vim.cmd(string.format('%dToggleTerm direction=horizontal name="%s"', next_id, name))
  end)
end, { desc = "create named float terminal" })

-- terminal mode: standard toggle-to-close handler for named terminals
vim.keymap.set("t", "<c-\\>", function()
  local id = vim.b.toggle_number or 1
  vim.cmd(id .. "toggleterm")
end, { desc = "close current floating terminal" })

-- normal mode: press <leader>ts to view and pick from active terminals
vim.keymap.set("n", "<leader>ts", "<cmd>TermSelect<cr>", { desc = "select active terminal" })
