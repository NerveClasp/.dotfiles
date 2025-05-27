return {
  "neovim/nvim-lspconfig",
  ---@class PluginLspOpts
  opts = {
    ---@type lspconfig.options

    servers = {
      arduino_language_server = {
        cmd = {
          "arduino-language-server",
          "-cli-config",
          "/home/romka/.arduino15/arduino-cli.yaml",
          "-cli",
          "/usr/bin/arduino-cli",
          "-clangd",
          "/home/romka/.local/share/nvim/mason/bin/clangd",
          "-fqbn",
          "esp8266:esp8266:d1_mini_clone",
        },
      },
      graphql = {
        cmd = { "graphql-lsp", "server", "-m", "stream" },
        filetypes = { "graphql", "javascript", "javascriptreact", "typescript", "typescriptreact", "svelte" },
      },
    },
  },
}
