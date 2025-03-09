local builtin = require('telescope.builtin')

local function get_visual_selection()
  local s_start = vim.fn.getpos("'<")
  local s_end = vim.fn.getpos("'>")
  local curr_line = vim.api.nvim_buf_get_lines(0, s_end[2], false)
  local n_lines = math.abs(s_end[2] - s_start[2]) + 1
  local lines = vim.api.nvim_buf_get_lines(0, s_start[2] - 1, s_end[2], false)
  lines[1] = string.sub(lines[1], s_start[3], -1)
  if n_lines == 1 then
    lines[n_lines] = string.sub(lines[n_lines], 1, s_end[3] - s_start[3] + 1)
  else
    lines[n_lines] = string.sub(lines[n_lines], 1, s_end[3])
  end
  return table.concat(lines, '\n')
end

vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = 'Search Git Files' })
vim.keymap.set('n', '<leader>ps', function()
  builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
vim.keymap.set('n', '<C-S-f>', builtin.live_grep, { desc = 'Telescope live grep' })

vim.keymap.set('n', '<C-b>', builtin.buffers, { desc = 'List Vim Buffers' })

vim.keymap.set('n', '<C-S-i>', function()
  builtin.diagnostics({ bufnr = 0 })
end, {})

vim.keymap.set('v', '<C-S-f>', function()
  builtin.grep_string({ search = get_visual_selection() })
end, { desc = 'Telescope live grep' })
