-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 500, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics_mode = 3, -- diagnostic mode on start (0 = off, 1 = no signs/virtual text, 2 = no virtual text, 3 = on)
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        conceallevel = 1, -- enable conceal
        relativenumber = true, -- sets vim.opt.relativenumber
        number = true, -- Show line numbers
        undofile = true, -- Enable persistent undo (see also `:h undodir`)
        breakindent = true, -- Indent wrapped lines to match line start
        spell = false, -- sets vim.opt.spell
        signcolumn = "auto", -- sets vim.opt.signcolumn to auto
        wrap = true, -- sets vim.opt.wrap
        clipboard = "", -- Remove connection to the system clipboard
        splitbelow = true, -- Horizontal splits will be below
        splitright = true, -- Vertical splits will be to the right
        splitkeep = "screen", -- Reduce scroll during window
        fillchars = "eob: ", -- Don't show `~` outside of buffer
        backup = false, -- Don't store backup while overwriting the file
        writebackup = false, -- Don't store backup while overwriting the file
        incsearch = true, -- Show search results while typing
        listchars = {
          trail = "·",
          tab = "│→",
          -- eol = "⤶",
          extends = "⟩",
          precedes = "⟨",
          nbsp = "␣",
          -- space = '❤',
        },
        pumheight = 10, -- Make popup menu smaller
        showbreak = "↪",
        showtabline = (vim.t.bufs and #vim.t.bufs > 1) and 2 or 1,
        completeopt = "menuone,noinsert,noselect", -- Customize completions
        pumblend = 10, -- Make builtin completion menus slightly transparent
        winblend = 10, -- Make floating windows slightly transparent
        list = true, -- Show some helper symbols
      },
      g = { -- vim.g.<key>
        -- configure global vim variables (vim.g)
        -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
        gitblame_enabled = false, -- disable git blame by default
      },
    },
    autocmds = {
      auto_spell = {
        {
          event = "FileType",
          desc = "Enable wrap and spell for text like documents",
          pattern = { "gitcommit", "markdown", "text", "plaintex" },
          callback = function()
            vim.opt_local.wrap = true
            vim.opt_local.spell = true
          end,
        },
      },
      autohide_tabline = {
        {
          event = "User",
          desc = "Auto hide tabline",
          pattern = "AstroBufsUpdated",
          callback = function()
            local new_showtabline = #vim.t.bufs > 1 and 2 or 1
            if new_showtabline ~= vim.opt.showtabline:get() then vim.opt.showtabline = new_showtabline end
          end,
        },
      },
    },
    mappings = {
      n = {
        -- mappings seen under group name "Buffer"
        ["<Leader>bD"] = {
          function()
            require("astroui.status.heirline").buffer_picker(
              function(bufnr) require("astrocore.buffer").close(bufnr) end
            )
          end,
          desc = "Pick to close",
        },
        -- tables with just a `desc` key will be registered with which-key if it's installed
        -- this is useful for naming menus
        ["<Leader>b"] = { desc = "Buffers" },
        -- quick save
        ["<C-s>"] = { ":w!<cr>", desc = "Save File" }, -- change description but the same command
        -- paste system clipboard
        ["<C-p>"] = [["+gP]],
        -- Copy/paste with system clipboard
        ["gp"] = { '"+p', desc = "Paste from system clipboard" },
        ["gP"] = { '"+P', desc = "Paste from system clipboard" },
        -- file explorer toggle
        ["<F12>"] = { "<cmd>Neotree toggle<cr>", desc = "Toggle Explorer" },
        -- git-blame
        ["<leader>gg"] = { "<cmd>GitBlameToggle<cr>", desc = "Toggle git blame" },
        ["<leader>gx"] = { "<cmd>GitBlameCopyFileURL<cr>", desc = "Copy current line remote url to clipboard" },
      },
      v = {
        -- Search inside visually highlighted text. Use `silent = false` for it to
        -- make effect immediately.
        ["gy"] = { '"+y', desc = "Copy to system clipboard" },
        ["gp"] = { '"+p', desc = "Paste from system clipboard" },
        ["gP"] = { '"+P', desc = "Paste from system clipboard" },
        -- Search visually selected text (slightly better than builtins in Neovim>=0.8)
        ["*"] = { [[y/\V<C-R>=escape(@", '/\')<CR><CR>]] },
        ["#"] = { [[y?\V<C-R>=escape(@", '?\')<CR><CR>]] },
        -- copy to system clipboard
        ["<C-c>"] = [["+y]],
        -- cut to system clipboard
        ["<C-x>"] = [["+x]],
        -- range sort lines
        ["s"] = ":!sort<cr>",
      },
    },
  },
}
