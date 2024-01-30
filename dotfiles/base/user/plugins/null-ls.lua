return {
  "jose-elias-alvarez/null-ls.nvim",
  opts = function(_, opts)
    local null_ls = require "null-ls"
    opts.sources = {
      null_ls.builtins.formatting.stylua,
      null_ls.builtins.formatting.prettierd.with {
        condition = function(utils)
          return utils.root_has_file ".prettierrc"
            or utils.root_has_file ".prettierrc.json"
            or utils.root_has_file ".prettierrc.js"
            or utils.root_has_file ".prettierrc.cjs"
        end,
        filetypes = {
          "javascript",
          "vue",
          "typescript",
          "javascriptreact",
          "typescriptreact",
          "svelte",
        },
      },
      null_ls.builtins.formatting.stylelint.with {
        filetypes = {
          "svelte",
          "css",
          "scss",
        },
        condition = function(utils) return utils.root_has_file "stylelint.config.cjs" end,
      },
      null_ls.builtins.diagnostics.stylelint.with {
        filetypes = {
          "svelte",
          "css",
          "scss",
        },
        condition = function(utils) return utils.root_has_file "stylelint.config.cjs" end,
      },
      null_ls.builtins.diagnostics.shellcheck.with {
        args = { "--severity", "warning" },
      },
      null_ls.builtins.diagnostics.codespell.with {
        args = { "--check-filenames", "--ignore-words", "node_modules" },
        filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact", "svelte" },
      },
      null_ls.builtins.diagnostics.eslint_d.with {
        filetypes = {
          "javascript",
          "vue",
          "typescript",
          "javascriptreact",
          "typescriptreact",
          "svelte",
        },
        condition = function(utils)
          return utils.root_has_file ".eslintrc.js"
            or utils.root_has_file ".eslintrc.ts"
            or utils.root_has_file ".eslintrc.cjs" -- change file extension if you use something else
        end,
      },
      -- null_ls.builtins.formatting.black,
      -- null_ls.builtins.formatting.isort,
      -- null_ls.builtins.formatting.clang_format,
      -- null_ls.builtins.formatting.rustfmt,
      -- null_ls.builtins.formatting.shfmt.with {
      --   args = { "-i", "2" },
      -- },
      null_ls.builtins.diagnostics.luacheck,
      -- null_ls.builtins.diagnostics.flake8,
      -- null_ls.builtins.diagnostics.pylint,
      -- null_ls.builtins.diagnostics.mypy,
    }
    return opts
  end,
}
