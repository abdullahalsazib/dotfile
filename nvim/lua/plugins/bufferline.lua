return {
  {
    "akinsho/bufferline.nvim",
    version = "",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("bufferline").setup({
        options = {
          mode = "buffers", -- buffers বা tabs
          numbers = "ordinal", -- 1,2,3 দেখাবে
          diagnostics = "nvim_lsp", -- LSP error/warning bufferline এ দেখাবে
          separator_style = "slant", -- "slant" | "padded_slant" | "thick" | "thin"
          show_buffer_close_icons = true,
          show_close_icon = false,
          always_show_bufferline = true,
        },
      })
    end,
  },
}
