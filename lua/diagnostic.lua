local border_color = 'Pmenu'
vim.diagnostic.config({
  virtual_text = false,
  float = {
    scope = 'line',
    header = 'Diagnostic:',
    border = {
      { "╔" , border_color },
      { "═" , border_color },
      { "╗" , border_color },
      { "║" , border_color },
      { "╝" , border_color },
      { "═" , border_color },
      { "╚" , border_color },
      { "║" , border_color },
    }
  }
})

vim.api.nvim_set_keymap('n', 'm', ':lua vim.diagnostic.open_float()<CR>', { noremap = true, silent = true})


-- set diagnostic icons
local o = vim.fn

o.sign_define("DiagnosticSignError", {
  text = " ",
  texthl = "DiagnosticSignErr"
})

o.sign_define("DiagnosticSignWarn", {
  text = " ",
  texthl = "DiagnosticSignWarn"
})

o.sign_define("DiagnosticSignHint", {
  text = " ",
  texthl = "DiagnosticSignHint"
})


o.sign_define("DiagnosticSignInfo", {
  text = " ",
  texthl = "DiagnosticSignInfo"
})
