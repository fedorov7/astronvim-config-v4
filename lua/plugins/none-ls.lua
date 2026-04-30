if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- Customize None-ls sources

---@type LazySpec
return {
  "nvimtools/none-ls.nvim",
  opts = function(_, opts)
    local null_ls = require "null-ls"

    -- Check supported formatters and linters
    -- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/formatting
    -- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
    opts.sources = {
      -- Set a formatter
      null_ls.builtins.formatting.stylua,
      null_ls.builtins.formatting.prettier,
      null_ls.builtins.formatting.cmake_format,
      null_ls.builtins.formatting.isort,
      null_ls.builtins.formatting.black.with {
        extra_args = {
          "--line-length",
          "79",
        },
      },
      null_ls.builtins.formatting.shfmt.with {
        extra_args = { "-i", "2" },
      },
    }
    return opts
  end,
}
