return {
  -- add gruvbox
  -- {
  --   "ellisonleao/gruvbox.nvim",
  --   priority = 1000,
  --   config = function()
  --     require("gruvbox").setup({
  --       transparent_mode = true, -- background transparent
  --     })
  --
  --     vim.cmd("colorscheme gruvbox")
  --     vim.g.transparent_enabled = true
  --   end,
  -- },
  -- {
  --   "catppuccin/nvim",
  --   lazy = true,
  --   name = "catppuccin",
  --   config = function()
  --     require("catppuccin").setup({
  --       flavour = "mocha",
  --       background = {
  --         dark = "mocha",
  --       },
  --       transparent_background = true,
  --       float = {
  --         solid = true,
  --         transparent = true,
  --       },
  --     })
  --   end,
  -- },

  {
    "folke/tokyonight.nvim",
    lazy = false, -- load immediately
    config = function()
      require("tokyonight").setup({
        style = "night", -- "storm", "night", "day"
        transparent = true, -- enable transparent background
        terminal_colors = true, -- transparent for terminal too
        styles = {
          sidebars = "transparent", -- transparency for sidebar windows
          floats = "transparent", -- transparency for floating windows
        },
      })
      vim.cmd([[colorscheme tokyonight]])
      vim.g.transparent_enabled = true
    end,
  },
  -- {
  --   "folke/tokyonight.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   opts = {},
  --   config = function()
  --     require("tokyonight").setup({
  --       style = "night",
  --       transparent = true,
  --       on_highlights = function(hl, c)
  --         -- set telescope-bg transparent
  --         hl.TelescopeNormal = {
  --           fg = c.fg_dark,
  --         }
  --         hl.TelescopeBorder = {
  --           fg = c.bg_dark,
  --         }
  --       end,
  --     })
  --     vim.cmd([[colorscheme tokyonight]])
  --   end,
  -- },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight",
    },
  },
}
