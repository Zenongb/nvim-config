C = {}
-- color palette from https://colorpalettes.net/color-palette-4524/

C.blue = "Blue"
C.red = "Red"
C.yellow = "Yellow"
C.white = "White"
C.black = "Black"
C.background = "#131613"
C.backgroundlight = "#1d221d"
C.base = "#30352E"
C.primary = "#455442"
C.secondary = "#6F5E3C"
C.lightfont = "#B4B198"
C.darkfont = "#889687"

C.thumb = "#cdc898"

C.statementfont = "#ADBF32"
C.typefont = "#4b7b42"

vim.api.nvim_exec(table.concat({
  -- cmp menu 
  string.format("hi PmenuSbar guibg=%s\n", C.backgroundlight),
  string.format("hi PmenuThumb guibg=%s\n", C.thumb),
  string.format("hi Pmenu guibg=%s guifg=%s\n", C.base, C.lightfont),
  string.format("hi PmenuSel guibg=%s guifg=%s\n", C.primary, C.white),
  -- edit syntax formats
  string.format("hi Visual guibg=%s\n", C.backgroundlight),
  string.format("hi Type guifg=%s\n", C.typefont),
  string.format("hi Statement guifg=%s\n", C.statementfont),
  -- edit signs
  string.format("hi DiagnosticSignErr guibg=%s guifg=%s\n", C.backgroundlight, C.red),
  string.format("hi DiagnosticSignWarn guibg=%s guifg=%s\n", C.backgroundlight, C.yellow),
  string.format("hi DiagnosticSignHint guibg=%s \n", C.backgroundlight),
  string.format("hi DiagnosticSignInfo guibg=%s guifg=%s\n", C.backgroundlight, C.blue),
  string.format("hi SignColumn guibg=%s\n", C.backgroundlight),
  -- edit nvim-tree hi
  string.format("hi NvimTreeRootFolder guifg=%s\n", C.lightfont),
  string.format("hi EndOfBuffer guifg=%s\n", C.primary),
  string.format("hi Normal guibg=%s guifg=%s\n", C.background, C.white),
  string.format("hi StatuslineFile guibg=%s guifg=%s\n", C.primary, C.black),
  string.format("hi StatuslineFileCorner guifg=%s guibg=%s\n", C.primary, C.base),
  string.format("hi StatuslineBody guibg=%s guifg=%s\n", C.base, C.lightfont),
  string.format("hi VertSplit	guifg=%s guibg=%s\n", C.base, C.lightfont),
  string.format("hi ColorColumn  guibg=%s\n", C.backgroundlight),
  -- keybinding window
  string.format("hi KeybindsMode guifg=%s guibg=%s\n", C.black, C.base),
}), false)

