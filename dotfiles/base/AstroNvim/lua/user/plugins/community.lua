return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.rust" },
  { import = "astrocommunity.colorscheme.nightfox-nvim", enabled = false },
  { import = "astrocommunity.colorscheme.kanagawa-nvim", enabled = true },
  { import = "astrocommunity.colorscheme.rose-pine" },
  { import = "astrocommunity.colorscheme.catppuccin" },
  { -- further customize the options set by the community
    "catppuccin",
    opts = {
      flavour = "mocha", -- latte, frappe, macchiato, mocha
      -- transparent_background = true,
      term_colors = false,
      no_italic = false, -- Force no italic
      no_bold = false, -- Force no bold
      no_underline = false, -- Force no underline
      -- compile = {
      --   enabled = false,
      --   path = vim.fn.stdpath("cache") .. "/catppuccin",
      -- },
      dim_inactive = {
        enabled = true,
        shade = "dark",
        percentage = 0.15,
      },
      styles = {
        comments = { "italic" },
        conditionals = { "bold" },
        loops = {},
        functions = { "italic" },
        keywords = { "italic" },
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = { "italic", "bold" },
        operators = {},
      },
      integrations = {
        -- For various plugins integrations see https://github.com/catppuccin/nvim#integrations
        indent_blankline = {
          enabled = true,
          colored_indent_levels = true,
        },
        neotree = {
          enabled = true,
          show_root = true, -- makes the root folder not transparent
          transparent_panel = false, -- make the panel transparent
        },
        native_lsp = {
          enabled = true,
          virtual_text = {
            errors = { "italic" },
            hints = { "italic" },
            warnings = { "italic" },
            information = { "italic" },
          },
          underlines = {
            errors = { "underline" },
            hints = { "underline" },
            warnings = { "underline" },
            information = { "underline" },
          },
        },
        ts_rainbow = true,
        telescope = true,
        gitsigns = true,
        nvimtree = true,
        treesitter_context = true,
        treesitter = true,
        which_key = true,
        -- fidget = true,
        sandwich = false,
        noice = true,
        mini = true,
        leap = true,
        markdown = true,
        neotest = true,
        cmp = true,
        overseer = true,
        lsp_trouble = true,
        ts_rainbow2 = true,
      },
      color_overrides = {},
      highlight_overrides = {},
    },
  },
  { import = "astrocommunity.completion.copilot-lua" },
  { -- further customize the options set by the community
    "copilot.lua",
    opts = {
      suggestion = {
        keymap = {
          accept = "<C-y>",
          -- accept = "<Tab>",
          accept_word = false,
          accept_line = false,
          next = "<C-.>",
          prev = "<C-,>",
          dismiss = "<C/>",
        },
      },
    },
  },
  -- { import = "astrocommunity.bars-and-lines.smartcolumn-nvim" },
  -- {
  --   "m4xshen/smartcolumn.nvim",
  --   opts = {
  --     colorcolumn = 80,
  --     disabled_filetypes = { "help" },
  --   },
  -- },
}
