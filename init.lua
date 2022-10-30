
require("plugins")
require("colors")
require("config")
require("mappings")
require("statusline")
require("diagnostics")


-- config minimap.nvim
local g = vim.g
g.minimap_width = 10
g.minimap_auto_start_win_enter = 1
g.minimap_highlight_range = 1
g.minimap_highlight_search = 1

vim.o.hidden = true
require('nvim-terminal').setup({
    window = {
        -- Do `:h :botright` for more information
        -- NOTE: width or height may not be applied in some "pos"
        position = 'botright',

        -- Do `:h split` for more information
        split = 'sp',

        -- Height of the terminal
        height = 15,
    },

    -- keymap to disable all the default keymaps
    disable_default_keymaps = false,

    -- keymap to toggle open and close terminal window
    toggle_keymap = '<C-t>',

    -- increase the window height by when you hit the keymap
    window_height_change_amount = 2,

    -- increase the window width by when you hit the keymap
    window_width_change_amount = 2,

    terminals = {
        -- keymaps to open nth terminal
        {keymap = '<leader>1'},
        {keymap = '<leader>2'},
        {keymap = '<leader>3'},
        {keymap = '<leader>4'},
        {keymap = '<leader>5'},
    }
})


-- add treesitter
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "go", "lua", "javascript", "bash", "html", "css" },
  auto_install = true,
  highlight = {
    enable = true,
  },
}

-- add nvim-tree
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    -- hide_root_folder = true,
    adaptive_size = true,
    mappings = {
      list = {
        -- keybindings for the pane
        { key = "o", action = "vsplit" },
        { key = "O", action = "split" },
        { key = "t", action = "tabnew" },
        { key = "<C-t>", action = "" },
      },
    },
  },
  git = {
    ignore = false,
  },
  diagnostics = {
    enable = true,
  },
  renderer = {
    indent_markers = {
      enable = true,
      inline_arrows = true,
      icons = {
        corner = "└",
        edge = "│",
        item = "├",
        none = " ",
        },
    }
  }
})

-- add nvim-cmp
local cmp = require'cmp'
cmp.setup({
  snippet = {
    expand = function(args)
      require'luasnip'.lsp_expand(args.body)
    end
  },
      mapping = cmp.mapping.preset.insert({
        -- edit mappings, some bugs found
        ['<C-f>'] = cmp.mapping.select_next_item(),
        ['<C-d>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
        ['<C-D>'] = cmp.mapping.scroll_docs(-4),
        ['<C-F>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
      }),
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = "luasnip" },
      }),
})

-- Setup cmp-nvim whithin lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

--Enable (broadcasting) snippet capability for completion
capabilities.textDocument.completion.completionItem.snippetSupport = true

require'lspconfig'.cssls.setup {
  capabilities = capabilities,
}

-- add lua syntax highlighting
require'lspconfig'.sumneko_lua.setup {
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}


-- add golang syntax highlight
require'lspconfig'.gopls.setup {
  capabilities = capabilities,
  cmd = {"gopls", "serve"},
  filetypes = {"go", "gomod"},
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
    },
  },
}

-- add ts-js-tsx lsp
require'lspconfig'.tsserver.setup {
  capabilities = capabilities,
}


