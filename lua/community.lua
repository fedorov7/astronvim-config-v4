return {
  -- TODO: Remove branch v4 on release
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
  { import = "astrocommunity.editing-support.todo-comments-nvim" },
  {
    "folke/todo-comments.nvim",
    opts = {
      sign_priority = 5, -- higher sign display priority
    },
  },

  -- lsp
  { import = "astrocommunity.lsp.lsp-signature-nvim" },

  -- color
  -- color picker and highlighter
  { import = "astrocommunity.color.ccc-nvim" },
  { import = "astrocommunity.color.tint-nvim" },
  { import = "astrocommunity.colorscheme.catppuccin", enabled = true },

  -- Packs
  { import = "astrocommunity.pack.bash" },
  { import = "astrocommunity.pack.cmake" },
  { import = "astrocommunity.pack.cpp" },
  { import = "astrocommunity.pack.docker" },
  { import = "astrocommunity.pack.json" },
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.markdown" },
  { import = "astrocommunity.pack.python" },
  { import = "astrocommunity.pack.rust" },
  { import = "astrocommunity.pack.harper" },

  -- Version Control
  { import = "astrocommunity.git.diffview-nvim" },
  { import = "astrocommunity.git.git-blame-nvim" },
}
