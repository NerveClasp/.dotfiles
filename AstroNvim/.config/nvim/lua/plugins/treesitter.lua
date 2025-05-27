-- Customize Treesitter

---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    -- add more things to the ensure_installed table protecting against community packs modifying it
    opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
      "lua",
      "vim",
      "arduino",
      "bash",
      "c",
      "cpp",
      "css",
      "dockerfile",
      "fish",
      "git_config",
      "gitignore",
      "go",
      "gomod",
      "graphql",
      "html",
      "javascript",
      "json",
      "jsonc",
      "markdown",
      "markdown_inline",
      "rust",
      "scss",
      "svelte",
      "toml",
      "tsx",
      "typescript",
      "vimdoc",
      "yaml",
      -- add more arguments for adding more treesitter parsers
    })
  end,
}
