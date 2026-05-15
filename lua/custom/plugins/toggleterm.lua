-- [[ Terminal Management ]]
-- toggleterm.nvim - Better terminal integration with toggle functionality
-- See `:help toggleterm`

local function gh(repo)
  return 'https://github.com/' .. repo
end

vim.pack.add { gh 'akinsho/toggleterm.nvim' }

require('toggleterm').setup {
  -- Size can be a number or function which is passed the current terminal
  size = function(term)
    if term.direction == 'horizontal' then
      return 15
    elseif term.direction == 'vertical' then
      return vim.o.columns * 0.4
    end
  end,
  open_mapping = [[<c-\>]], -- Key binding to toggle terminal
  hide_numbers = true, -- Hide the number column in toggleterm buffers
  shade_terminals = true,
  shading_factor = 2, -- The degree by which to darken to terminal color
  start_in_insert = true,
  insert_mappings = true, -- Whether or not the open mapping applies in insert mode
  terminal_mappings = true, -- Whether or not the open mapping applies in the opened terminals
  persist_size = true,
  persist_mode = true, -- If set to true (default) the previous terminal mode will be remembered
  direction = 'float', -- 'vertical' | 'horizontal' | 'tab' | 'float'
  close_on_exit = true, -- Close the terminal window when the process exits
  shell = vim.o.shell, -- Change the default shell
  auto_scroll = true, -- Automatically scroll to the bottom on terminal output
  -- This field is only relevant if direction is set to 'float'
  float_opts = {
    border = 'curved', -- 'single' | 'double' | 'shadow' | 'curved' | ... other options supported by win open
    winblend = 0,
  },
}

-- Key mappings
-- Toggle terminal in different modes
vim.keymap.set('n', '<leader>tt', '<cmd>ToggleTerm<cr>', { desc = '[T]oggle [T]erminal' })
vim.keymap.set('n', '<leader>th', '<cmd>ToggleTerm direction=horizontal<cr>', { desc = '[T]erminal [H]orizontal' })
vim.keymap.set('n', '<leader>tv', '<cmd>ToggleTerm direction=vertical<cr>', { desc = '[T]erminal [V]ertical' })
vim.keymap.set('n', '<leader>tf', '<cmd>ToggleTerm direction=float<cr>', { desc = '[T]erminal [F]loat' })

-- Terminal mode keymaps for easier navigation
local function set_terminal_keymaps()
  local opts = { buffer = 0 }
  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
  vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
end

-- Automatically apply terminal keymaps when opening a terminal
vim.api.nvim_create_autocmd('TermOpen', {
  desc = 'Set terminal keymaps for toggleterm',
  group = vim.api.nvim_create_augroup('toggleterm-keymaps', { clear = true }),
  pattern = 'term://*toggleterm#*',
  callback = set_terminal_keymaps,
})
