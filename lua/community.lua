-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  -- example of importing a plugin, comment out to use it or add your own
  -- available plugins can be found at https://github.com/AstroNvim/astrocommunity

  -- Motion plugins
  -- :help nvim-surround.usage.
  { import = "astrocommunity.motion.nvim-surround" },

  -- Editor support
  -- Rainbow parens
  { import = "astrocommunity.editing-support.rainbow-delimiters-nvim" },
  { import = "astrocommunity.editing-support.nvim-regexplainer" },
  { import = "astrocommunity.editing-support.nvim-treesitter-context" },
  { import = "astrocommunity.editing-support.todo-comments-nvim" },
  {
    "folke/todo-comments.nvim",
    opts = {
      sign_priority = 5, -- higher sign display priority
    },
  },

  -- Markdown
  { import = "astrocommunity.markdown-and-latex.render-markdown-nvim" },

  -- Editing support
  { import = "astrocommunity.editing-support.bigfile-nvim" },
  { import = "astrocommunity.editing-support.suda-vim" },

  -- Diagnostics and debugging
  { import = "astrocommunity.diagnostics.trouble-nvim" },
  { import = "astrocommunity.debugging.nvim-dap-virtual-text" },

  -- Utilities
  { import = "astrocommunity.utility.lua-json5" },

  -- Color
  -- color picker and highlighter
  { import = "astrocommunity.color.ccc-nvim" },
  { import = "astrocommunity.color.tint-nvim" },
  { import = "astrocommunity.colorscheme.catppuccin", enabled = true },

  -- completion
  -- { import = "astrocommunity.completion.copilot-cmp" },

  -- System development packs
  { import = "astrocommunity.pack.bash" },
  { import = "astrocommunity.pack.cmake" },
  { import = "astrocommunity.pack.cpp" },
  { import = "astrocommunity.pack.docker" },
  { import = "astrocommunity.pack.json" },
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.markdown" },
  { import = "astrocommunity.test.neotest" },
  { import = "astrocommunity.pack.python.base" },
  { import = "astrocommunity.pack.python.basedpyright" },
  { import = "astrocommunity.pack.python.ruff" },
  { import = "astrocommunity.recipes.astrolsp-no-insert-inlay-hints" },

  -- Version Control
  { import = "astrocommunity.git.diffview-nvim" },
  { import = "astrocommunity.git.git-blame-nvim" },
}
