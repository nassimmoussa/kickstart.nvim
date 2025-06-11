return { -- Useful plugin to show you pending keybinds.
  "folke/which-key.nvim",
  event = "VimEnter", -- Sets the loading event to 'VimEnter'
  opts = {
    -- delay between pressing a key and opening which-key (milliseconds)
    -- this setting is independent of vim.o.timeoutlen
    delay = 0,
    icons = {
      -- set icon mappings to true if you have a Nerd Font
      mappings = true,
      -- If you are using a Nerd Font: set icons.keys to an empty table which will use the
      -- default which-key.nvim defined Nerd Font icons, otherwise define a string table
      keys = {},
    },

    -- Document existing key chains
    spec = {
      { "<leader>s", group = "[S]earch" },
      { "<leader>t", group = "[T]oggle" },
      { "<leader>g", group = "git" },
      { "<leader>h", group = "Git [H]unk", mode = { "n", "v" } },
      { "[", group = "prev" },
      { "]", group = "next" },
      { "<leader>u", group = "ui", icon = { icon = "󰙵 ", color = "cyan" } },
      {
        "<leader>b",
        group = "buffer",
        expand = function() return require("which-key.extras").expand.buf() end,
      },
      {
        "<leader>w",
        group = "windows",
        proxy = "<c-w>",
        expand = function() return require("which-key.extras").expand.win() end,
      },
    },
  },
}
