-- statusline config


local modes = {
  ["n"] = "NORMAL",
  ["no"] = "NORMAL",
  ["v"] = "VISUAL",
  ["V"] = "VISUAL LINE",
  ["b"] = "VISUAL BLOCK",
  ["s"] = "SELECT",
  ["S"] = "SELECT LINE",
  ["b"] = "SELECT BLOCK",
  ["i"] = "INSERT",
  ["ic"] = "INSERT",
  ["R"] = "REPLACE",
  ["Rv"] = "VISUAL REPLACE",
  ["c"] = "COMMAND",
  ["cv"] = "VIM EX",
  ["ce"] = "EX",
  ["r"] = "PROMPT",
  ["rm"] = "MOAR",
  ["r?"] = "CONFIRM",
  ["!"] = "SHELL",
  ["t"] = "TERMINAL",
}

local function mode()
  local current_mode = vim.api.nvim_get_mode().mode
  return string.format(" %s ", modes[current_mode]):upper()
end


local function filepath()
  local fpath = vim.fn.fnamemodify(vim.fn.expand "%", ":.")
  if fpath == "" or fpath == "." then
    fpath = " "
  end
  return string.format(" %%<%s %%m ", string.sub(fpath, -36))
end

local function filetype()
  return string.format(" %s ", vim.bo.filetype)
end


local function lineinfo()
  if vim.bo.filetype == "alpha" then
    return ""
  end
  return " %P %l:%c"
end

local function lsp()
  local count = {}
  local levels = {
    errors = "Error",
    warnings = "Warn",
    info = "Info",
    hints = "Hint",
  }

  for k, level in pairs(levels) do
    count[k] = vim.tbl_count(vim.diagnostic.get(0, { severity = level }))
  end

  local errors = ""
  local warnings = ""
  local hints = ""
  local info = ""

  if count["errors"] ~= 0 then
    errors = "  " .. count["errors"]
  end
  if count["warnings"] ~= 0 then
    warnings = "  " .. count["warnings"]
  end
  if count["hints"] ~= 0 then
    hints = "  " .. count["hints"]
  end
  if count["info"] ~= 0 then
    info = "  " .. count["info"]
  end

  return errors .. warnings .. hints .. info
end

local function devicon()
  local ft = vim.bo.ft
  return require("nvim-web-devicons").get_icon_by_filetype(ft, { default = true })
end

-- let's build the actual statusline

Statusline = {}

-- function Statusline.init(self)
--   self.ft = vim.bo.filetype
-- end

function Statusline.active()
  return table.concat {
    "%#StatuslineFile#",
    filepath(),
    "%#StatuslineFile#",
    "%#StatuslineFileCorner#",
    "▛",
    "%#StatuslineFileCorner#",
    "%#StatuslineBody#",
    "%=",
    mode(),
    "%=",
    devicon(),
    filetype(),
    lsp(),
    lineinfo(),
  }
end

function Statusline.inactive()
  return table.concat {
    "%#StatuslineFile#",
    " %f %m ",
    "%#StatuslineFile#",
    "%#StatuslineFileCorner#",
    "▛",
    "%#StatuslineFileCorner#",
    "%#StatuslineBody#",
    "%=",
	  lineinfo(),
  }
end

function Statusline.short()
  return "%#StatuslineBody#NvimTree"
end


vim.api.nvim_exec([[
  augroup Statusline
    au!
    au WinEnter,BufEnter * setlocal statusline=%!v:lua.Statusline.active()
    au WinLeave,BufLeave * setlocal statusline=%!v:lua.Statusline.inactive()
    au WinEnter,BufEnter,FileType,WinLeave,BufLeave NvimTree_1 setlocal statusline=%!v:lua.Statusline.short()
  augroup END
]], false)

