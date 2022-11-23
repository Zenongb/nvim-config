
local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

keymap("n", "M", "m", opts)
-- nvim-terminal commands
vim.cmd("tnoremap <Esc> <C-\\><C-n>")
-- keymap("t", "<C-t>", ':lua NTGlobal["terminal"]:toggle()<cr>', opts)
-- nvim-tree commands
keymap("n", "<C-p>", ":NvimTreeFocus <CR>", opts)
keymap("n", "<C-P>", ":NvimTreeToggle <CR>", opts)

-- better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)
