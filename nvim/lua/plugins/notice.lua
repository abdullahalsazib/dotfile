return {
  {
    "folke/noice.nvim", -- the plugin itself
    event = "VeryLazy", -- lazy-load on very late event
    opts = {}, -- default options placeholder
    dependencies = {
      "MunifTanjim/nui.nvim", -- UI component library (required by noice)
      "rcarriga/nvim-notify", -- notification handler
    },
    config = function()
      require("noice").setup({
        lsp = {
          -- override markdown rendering so cmp and other plugins use Treesitter
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
          },
        },
        presets = {
          bottom_search = true, -- disables bottom cmdline for search
          command_palette = true, -- show cmdline & popupmenu together
          long_message_to_split = true, -- send long messages to split
          inc_rename = false, -- disables input dialog for inc-rename.nvim
          lsp_doc_border = true, -- add border for LSP hover/signature help
        },
      })
    end,
  },
}
