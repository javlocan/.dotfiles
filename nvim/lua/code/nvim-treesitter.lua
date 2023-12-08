return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
      "windwp/nvim-ts-autotag",
    },
    config = function()
      -- import nvim-treesitter plugin
      local treesitter = require("nvim-treesitter.configs")
      -- local context_commentstring = require("ts_context_commentstring")
      -- context_commentstring.setup({
      --   config = function()
      --     -- vim.g.skip_ts_context_commentstring_module = true
      --   end,
      -- })
      -- configure treesitter
      treesitter.setup({ -- enable syntax highlighting
        highlight = {
          additional_vim_regex_highlighting = false,
          enable = true,
        },
        auto_install = true,
        -- enable indentation
        indent = { enable = true },
        -- enable autotagging (w/ nvim-ts-autotag plugin)
        autotag = {
          enable = true,
        },
        -- ensure these language parsers are installed
        ensure_installed = {
          "json",
          "javascript",
          "typescript",
          "tsx",
          "yaml",
          "html",
          "css",
          "markdown",
          "markdown_inline",
          "graphql",
          "bash",
          "lua",
          "vim",
          "dockerfile",
          "gitignore",
          "query",
          "rust",
          "toml",
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<C-space>",
            node_incremental = "<C-space>",
            scope_incremental = false,
            node_decremental = "<bs>",
          },
        },
        rainbow = {
          enable = true,
          extended_mode = true,
          max_file_lines = nil,
        },
        -- enable nvim-ts-context-commentstring plugin for commenting tsx and jsx
        -- context_commentstring = {
        --   enable = true,
        --   enable_autocmd = false,
        -- },
      })
    end,
  },
}
