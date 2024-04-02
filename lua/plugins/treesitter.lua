-- Customize Treesitter

---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    -- add more things to the ensure_installed table protecting against community packs modifying it
    opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
      "bash",
      "c",
      "cpp",
      "csv",
      "gitignore",
      "json",
      "lua",
      "markdown",
      "markdown_inline",
      "python",
      "regex",
      "rust",
      "sql",
      "toml",
      "vim",
      "yaml",
      -- add more arguments for adding more treesitter parsers
    })
  end,
}
