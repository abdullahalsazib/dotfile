-- return {
--   "ibhagwan/fzf-lua",
--   -- optional for icon support
--   dependencies = { "nvim-tree/nvim-web-devicons" },
--   -- or if using mini.icons/mini.nvim
--   -- dependencies = { "echasnovski/mini.icons" },
--   opts = {},
--   config = function()
--     require("fzf-lua").setup({ "fzf-vim" })
--   end,
-- }

return {
  {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" }, -- optional icons
    config = function()
      require("fzf-lua").setup({
        winopts = {
          height = 0.85, -- floating window height
          width = 0.8, -- floating window width
          row = 0.5, -- center vertically
          col = 0.5, -- center horizontally
          border = "rounded", -- rounded border
          preview = {
            border = "rounded",
          },
        },
        keymap = {
          fzf = {
            ["ctrl-n"] = "toggle-all", -- example keybinding
          },
        },
        files = {
          prompt = "Files ❯ ",
          git_icons = true,
        },
        grep = {
          prompt = "Grep ❯ ",
          multiprocess = true,
        },
      })
    end,
  },
}
