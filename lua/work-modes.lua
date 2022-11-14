
local keymap_opts = {noremap = true, silent = true}

function Text_mode()
  vim.cmd('set wrap')
  vim.api.nvim_set_keymap('n', 'j', 'gj', keymap_opts)
  vim.api.nvim_set_keymap('n', 'k', 'gk', keymap_opts)
end

function Normal_mode()
  vim.cmd('set nowrap')
  vim.api.nvim_set_keymap('n', 'j', 'j', keymap_opts)
  vim.api.nvim_set_keymap('n', 'k', 'k', keymap_opts)
end
