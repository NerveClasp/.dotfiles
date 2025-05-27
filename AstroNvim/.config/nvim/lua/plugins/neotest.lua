-- https://github.com/ThePrimeagen/init.lua/blob/master/lua/theprimeagen/lazy/neotest.lua
return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      "marilari88/neotest-vitest",
      -- "nvim-neotest/neotest-plenary",
      -- "nvim-neotest/neotest-go",
      -- "mrcjkb/rustaceanvim",
    },
    keys = {
      { "<leader>lt", function() require("neotest").run.run() end, desc = "Run Neotest" },
    },
    config = function()
      local neotest = require "neotest"
      ---@diagnostic disable: missing-fields
      neotest.setup {
        adapters = {
          require "neotest-vitest",
          -- require "neotest-go",
          -- require "rustaceanvim",
          -- require("neotest-plenary").setup {
          -- this is my standard location for minimal vim rc
          -- in all my projects
          -- min_init = "./scripts/tests/minimal.vim",
          -- },
        },
      }

      -- vim.keymap.set("n", "<leader>lt", function() neotest.run.run() end)
    end,
  },
}
