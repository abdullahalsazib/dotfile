return {
  {
    "tribela/vim-transparent",
    lazy = false, -- load immediately
    config = function()
      vim.g.transparent_enabled = true
    end,
  },
}
