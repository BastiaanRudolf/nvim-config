return {
  {
    -- Package manager for lsps
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },

  {
    -- This module configures languages through mason
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed={
          -- Lua
          "lua_ls",

          -- SQL
          "sqlls",

          -- Python
          "pylsp",
          "ruff",
          
          -- JavaScript
          "tsserver",

          -- Vue
          "volar",
          "vuels",

          -- YAML
          "yamlls",
        }
      })
    end
  },
  {
    -- This module makes nvim communicate with lsps
    "neovim/nvim-lspconfig",
    opts = {
      diagnostics = {
        virtual_text = false,
        signs = false,
      },
    },
    config = function()
      local lspconfig = require("lspconfig")
      -- Setup languages
      lspconfig.lua_ls.setup({})
      lspconfig.sqlls.setup({})
      lspconfig.pylsp.setup({})
      lspconfig.ruff.setup({})
      lspconfig.volar.setup({})
      lspconfig.vuels.setup({})
      lspconfig.yamlls.setup({})
      lspconfig.tsserver.setup({})

      -- Keymap
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
      vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})
    end
  }
}
