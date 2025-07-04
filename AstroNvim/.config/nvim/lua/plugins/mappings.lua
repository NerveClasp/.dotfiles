-- if true then return {} end
local utils = require "astroui"
local get_icon = utils.get_icon
-- Mapping data with "desc" stored directly by vim.keymap.set().
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
local maps = { i = {}, n = {}, v = {}, t = {} }

maps.n["<leader>r"] = { "<cmd>LspRestart svelte<cr>", desc = "Restart Svelte LSP" }

maps.v["J"] = { ":m '>+1<CR>gv=gv", desc = "Move line down" }
maps.v["K"] = { ":m '<-2<CR>gv=gv", desc = "Move line up" }

maps.n["J"] = { "mzJ`z", desc = "Join lines" }
maps.n["<C-d>"] = { "<C-d>zz", desc = "Scroll down" }
maps.n["<C-u>"] = { "<C-u>zz", desc = "Scroll up" }
maps.n["n"] = { "nzzzv", desc = "Next search" }
maps.n["N"] = { "Nzzzv", desc = "Previous search" }

maps.v["<A-p>"] = { [["_dP]], desc = "Paste over" }

-- next greatest remap ever
maps.n["<leader>y"] = { [["+y]], desc = "Copy to clipboard" }
maps.v["<leader>y"] = { [["+y]], desc = "Copy to clipboard" }
maps.n["<leader>Y"] = { [["+Y]], desc = "Copy to clipboard" }

maps.n["<A-d>"] = { [["_d]], desc = "Delete" }
maps.v["<A-d>"] = { [["_d]], desc = "Delete" }

-- Terminal
maps.n["<c-_>"] = { "<cmd>3ToggleTerm direction=float<cr>", desc = "Toggle terminal" }
maps.t["<c-_>"] = maps.n["<c-_>"]
maps.n["<C-'>"] = maps.n["<c-_>"] -- requires terminal that supports binding <C-'>
maps.t["<C-'>"] = maps.n["<c-_>"] -- requires terminal that supports binding <C-'>
maps.n["<a-3>"] = maps.n["<c-_>"]
maps.t["<a-3>"] = maps.n["<c-_>"]

maps.n["<a-1>"] = { "<cmd>1ToggleTerm size=10 direction=horizontal<cr>", desc = "ToggleTerm horizontal split" }
maps.t["<a-1>"] = maps.n["<a-1>"]
maps.n["<a-2>"] = { "<cmd>2ToggleTerm size=80 direction=vertical<cr>", desc = "ToggleTerm vertical split" }
maps.t["<a-2>"] = maps.n["<a-2>"]

-- Search
maps.n["<leader>s"] = {
  desc = get_icon("Search", 2, true) .. "Search",
}
maps.n["<leader>st"] = { function() require("telescope.builtin").live_grep() end, desc = "Find words" }
maps.n["<leader>sT"] = {
  function()
    require("telescope.builtin").live_grep {
      additional_args = function(args) return vim.list_extend(args, { "--hidden", "--no-ignore" }) end,
    }
  end,
  desc = "Find text in all files",
}
maps.n["<leader>ss"] =
  { function() require("telescope.builtin").colorscheme { enable_preview = true } end, desc = "Find themes" }
maps.n["<leader>fs"] =
  { function() require("telescope.builtin").colorscheme { enable_preview = true } end, desc = "Find themes" }

maps.n["<leader>fa"] = {
  function()
    require("telescope.builtin").live_grep {
      additional_args = function(args) return vim.list_extend(args, { "--hidden", "--no-ignore" }) end,
    }
  end,
  desc = "Find text in all files",
}
maps.n["<leader>sf"] = { function() require("telescope.builtin").find_files() end, desc = "Find files" }
maps.n["<leader>sF"] = {
  function() require("telescope.builtin").find_files { hidden = true, no_ignore = true } end,
  desc = "Find all files",
}
-- View treesitter highlight groups
maps.n["<space>k"] = { ":TSHighlightCapturesUnderCursor<cr>", desc = "View Highlight Group" }
-- Easy splits
maps.n["\\"] = { "<cmd>split<cr>", desc = "Horizontal split" }
maps.n["|"] = { "<cmd>vsplit<cr>", desc = "Vertical split" }
-- Search highlight groups
maps.n["<space>sg"] = { "<cmd>Telescope highlights<cr>", desc = "Highlight groups" }

-- maps.n["<leader>z"] = { "<cmd>ZenMode<cr>", desc = "Zen Mode" }
maps.n["<C-s>"] = false

return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      mappings = maps,
    },
  },
  -- {
  --   "AstroNvim/astrolsp",
  --   ---@type AstroLSPOpts
  --   opts = {
  --     mappings = {
  --       n = {
  --         -- this mapping will only be set in buffers with an LSP attached
  --         K = {
  --           function() vim.lsp.buf.hover() end,
  --           desc = "Hover symbol details",
  --         },
  --         -- condition for only server with declaration capabilities
  --         gD = {
  --           function() vim.lsp.buf.declaration() end,
  --           desc = "Declaration of current symbol",
  --           cond = "textDocument/declaration",
  --         },
  --       },
  --     },
  --   },
  -- },
}
