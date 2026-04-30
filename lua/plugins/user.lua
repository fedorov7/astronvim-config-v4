---@type LazySpec
return {
  { "tpope/vim-abolish", lazy = false },
  { "fedorov7/vim-uefi", ft = { "c", "uefi", "uni", "vfr" } },
  {
    "fedorov7/ksslint",
    ft = { "c", "cpp" },
    init = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "c", "cpp" },
        callback = function(args)
          vim.keymap.set("n", "<F4>", function()
            require("lazy").load { plugins = { "ksslint" } }
            vim.cmd "call KssMacroReplace()"
          end, { buffer = args.buf, desc = "Run KSS macro replace" })
        end,
      })
    end,
  },
  { "mbbill/fencview", cmd = { "FencView", "FencAutoDetect", "FencManualEncoding" } },
}
