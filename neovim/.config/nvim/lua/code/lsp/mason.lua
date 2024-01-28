return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    -- import mason
    -- import mason-lspconfig
    local mason = require("mason")

    local mason_lspconfig = require("mason-lspconfig")

    local mason_tool_installer = require("mason-tool-installer")

    -- enable mason and configure icons
    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    local servers = {
      -- front end bs
      "tsserver",
      "html",
      "cssls",
      "tailwindcss",
      "lua_ls",
      "graphql",
      -- real shit
      "rust_analyzer",
      "bashls",
      "kotlin_language_server",
    }

    mason_lspconfig.setup({
      -- tbl_keys returns keys from a table
      ensure_installed = servers,
      -- auto-install configured servers (with lspconfig)
      automatic_installation = true, -- not the same as ensure_installed
    })

    mason_tool_installer.setup({
      ensure_installed = {
        "prettier", -- prettier formatter
        "eslint_d", -- js linter
        "stylua", -- lua formatter
        "shellcheck",
        "beautysh",
        "ktlint",
      },
    })
  end,
}
