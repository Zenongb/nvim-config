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
