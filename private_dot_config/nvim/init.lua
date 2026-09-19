-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "http", "rest" },
  callback = function()
    -- Map <C-CR> (Ctrl + Enter) to run the request under the cursor
    vim.keymap.set("n", "<C-CR>", function()
      require("kulala").run()
    end, { buffer = true, desc = "Kulala: Send request" })
  end,
})

-- Shell scripts: <C-CR> (Ctrl + Enter) runs the line under the cursor in a terminal
local shell_term = { buf = nil, cwd = nil, origin = nil }

-- <C-`> (Ctrl + `) hides the terminal window and returns to the buffer we came from
local function hide_terminal()
  local win = vim.api.nvim_get_current_win()
  if vim.api.nvim_get_current_buf() ~= shell_term.buf then
    return
  end

  local target = shell_term.origin
  if not (target and vim.api.nvim_win_is_valid(target) and target ~= win) then
    vim.cmd("wincmd p")
    target = vim.api.nvim_get_current_win()
  end

  if target == win then
    return -- last window left, nothing to switch back to
  end

  vim.api.nvim_set_current_win(target)
  pcall(vim.api.nvim_win_close, win, false)
end

local function shell_terminal()
  local job = shell_term.buf and vim.api.nvim_buf_is_valid(shell_term.buf) and vim.b[shell_term.buf].terminal_job_id

  -- reuse the terminal as long as its shell is still alive
  if job and vim.fn.jobwait({ job }, 0)[1] == -1 then
    return shell_term.buf
  end

  vim.cmd("botright 15split")
  vim.cmd("terminal")
  shell_term.buf = vim.api.nvim_get_current_buf()
  shell_term.cwd = vim.fn.getcwd()
  vim.bo[shell_term.buf].bufhidden = "hide"
  vim.keymap.set("t", "<C-`>", hide_terminal, { buffer = shell_term.buf, desc = "Hide terminal, back to buffer" })
  vim.keymap.set("n", "<C-`>", hide_terminal, { buffer = shell_term.buf, desc = "Hide terminal, back to buffer" })
  return shell_term.buf
end

local function run_current_line()
  local cmd = vim.trim(vim.api.nvim_get_current_line())
  if cmd == "" or vim.startswith(cmd, "#") then
    vim.notify("No command to run on this line", vim.log.levels.WARN)
    return
  end

  local dir = vim.fn.expand("%:p:h")
  local origin = vim.api.nvim_get_current_win()
  local buf = shell_terminal()
  local win = vim.fn.bufwinid(buf)

  if win == -1 then
    vim.cmd("botright 15split")
    vim.api.nvim_win_set_buf(0, buf)
    win = vim.api.nvim_get_current_win()
  end

  local chan = vim.b[buf].terminal_job_id
  if dir ~= shell_term.cwd then
    vim.fn.chansend(chan, "cd " .. vim.fn.shellescape(dir) .. "\n")
    shell_term.cwd = dir
  end
  vim.fn.chansend(chan, cmd .. "\n")

  -- focus the terminal and start terminal-mode so it is ready for input
  shell_term.origin = origin
  vim.api.nvim_set_current_win(win)
  vim.cmd("startinsert")
end

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "sh", "bash", "zsh" },
  callback = function()
    vim.keymap.set("n", "<C-CR>", run_current_line, {
      buffer = true,
      desc = "Run line under cursor in terminal",
    })
  end,
})
