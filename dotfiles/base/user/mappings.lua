local utils = require "astronvim.utils"
local get_icon = utils.get_icon
-- Mapping data with "desc" stored directly by vim.keymap.set().
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
local maps = { i = {}, n = {}, v = {}, t = {} }

-- Disable arrow keys
-- maps.n["<Left>"] = { "<nop>", desc = "Left" }
-- maps.n["<Right>"] = { "<nop>", desc = "Right" }
-- maps.n["<Up>"] = { "<nop>", desc = "Up" }
-- maps.n["<Down>"] = { "<nop>", desc = "Down" }
-- maps.n["<C-Left>"] = { "<nop>", desc = "Left" }
-- maps.n["<C-Right>"] = { "<nop>", desc = "Right" }
-- maps.n["<C-Up>"] = { "<nop>", desc = "Up" }
-- maps.n["<C-Down>"] = { "<nop>", desc = "Down" }
-- maps.n["<S-Left>"] = { "<nop>", desc = "Left" }
-- maps.n["<S-Right>"] = { "<nop>", desc = "Right" }
-- maps.n["<S-Up>"] = { "<nop>", desc = "Up" }
-- maps.n["<S-Down>"] = { "<nop>", desc = "Down" }
--
-- maps.i["<Left>"] = { "<nop>", desc = "Left" }
-- maps.i["<Right>"] = { "<nop>", desc = "Right" }
-- maps.i["<Up>"] = { "<nop>", desc = "Up" }
-- maps.i["<Down>"] = { "<nop>", desc = "Down" }
-- maps.i["<C-Left>"] = { "<nop>", desc = "Left" }
-- maps.i["<C-Right>"] = { "<nop>", desc = "Right" }
-- maps.i["<C-Up>"] = { "<nop>", desc = "Up" }
-- maps.i["<C-Down>"] = { "<nop>", desc = "Down" }
-- maps.i["<S-Left>"] = { "<nop>", desc = "Left" }
-- maps.i["<S-Right>"] = { "<nop>", desc = "Right" }
-- maps.i["<S-Up>"] = { "<nop>", desc = "Up" }
-- maps.i["<S-Down>"] = { "<nop>", desc = "Down" }
--
-- maps.v["<Left>"] = { "<nop>", desc = "Left" }
-- maps.v["<Right>"] = { "<nop>", desc = "Right" }
-- maps.v["<Up>"] = { "<nop>", desc = "Up" }
-- maps.v["<Down>"] = { "<nop>", desc = "Down" }
-- maps.v["<C-Left>"] = { "<nop>", desc = "Left" }
-- maps.v["<C-Right>"] = { "<nop>", desc = "Right" }
-- maps.v["<C-Up>"] = { "<nop>", desc = "Up" }
-- maps.v["<C-Down>"] = { "<nop>", desc = "Down" }
-- maps.v["<S-Left>"] = { "<nop>", desc = "Left" }
-- maps.v["<S-Right>"] = { "<nop>", desc = "Right" }
-- maps.v["<S-Up>"] = { "<nop>", desc = "Up" }
-- maps.v["<S-Down>"] = { "<nop>", desc = "Down" }

maps.n["<leader>x"] = { function() require("astronvim.utils.buffer").close() end, desc = "Close buffer" }
maps.n["<leader>X"] = { function() require("astronvim.utils.buffer").close(0, true) end, desc = "Force close buffer" }
-- Terminal
maps.n["<c-_>"] = { "<cmd>3ToggleTerm<cr>", desc = "Toggle terminal" }
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
  desc = get_icon("Search", 1, true) .. "Search",
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

maps.n["<leader>ft"] = { function() require("telescope.builtin").live_grep() end, desc = "Find words" }
maps.n["<leader>fT"] = {
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

maps.n["<leader>z"] = { "<cmd>ZenMode<cr>", desc = "Zen Mode" }

return maps
