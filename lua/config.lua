local o = vim.o
local wo = vim.wo
local bo = vim.bo

-- global options

vim.g.mapleader = ";"
o.termguicolors = true
o.swapfile = false
o.dir = '/tmp'
o.smartcase = true
o.laststatus = 2
o.hlsearch = true
o.incsearch = true
o.ignorecase = true
o.scrolloff = 8
-- ... snip ... 

-- window-local options
wo.number = true
wo.relativenumber = true
wo.wrap = false
wo.colorcolumn = '80'

-- tab options

o.expandtab = true
o.shiftwidth = 2
o.tabstop = 2

function Tablength()
  local ft = vim.b.filetype
  local length = 2
  if ft == "python"  then
    length = 4
  end
  bo.tabstop = length
  bo.shiftwidth = length
end

vim.api.nvim_exec(
[[
  augroup Tablength
    au!
    au BufAdd, BufEnter * call v:lua.Tablength()
  augroup END
]], false)
