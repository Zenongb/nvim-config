local api = vim.api
Help_win_id = 0


local function get_keymaps()
  local types = {'n', 'v', 'i', 'V'}
  local mode = '%#KeybindsMode# '
  local keyStrTable = {}

  for _,t in pairs(types) do
    local keymaps = api.nvim_get_keymap(t)
    for _, v in ipairs(keymaps) do
      local data = string.format("%s%s%s %s %s", mode, v.mode, mode, v.lhs, v.rhs)
      table.insert(keyStrTable, data)
    end
  end
  return keyStrTable
end


function Float_window()
  if Help_win_id ~= 0 then
    api.nvim_win_close(Help_win_id, true)
    Help_win_id = 0
    return
  end
  local width = 40
  local height = 30
  local ui = api.nvim_list_uis()[1]
  local buf = api.nvim_create_buf(true, true)
  local win_opts = {
    relative = 'editor',
    border = 'single',
    width = width,
    height = height,
    col = ui.width / 2 - width / 2,
    row = ui.height / 2 - height / 2,
    anchor = 'NW',
    style = 'minimal',
    noautocmd = true
  }
  local title = string.format('%s Keybinded Mappings %s', string.rep('-',width / 2 - 10), string.rep('-',width / 2 - 10))
  local keys = get_keymaps()
  api.nvim_buf_set_lines(buf, 0, 0, false, {title})
  api.nvim_buf_set_lines(buf, 1, -1, false, keys)
  local win = vim.api.nvim_open_win(buf, 1, win_opts)
  Help_win_id = win
end

vim.api.nvim_set_keymap('n', '¿', ':lua Float_window()<CR>', {noremap = true})
