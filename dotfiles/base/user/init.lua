return {
  colorscheme = "catppuccin",
  lsp = {
    config = {
      arduino_language_server = function()
        return {
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
        }
      end,
    },
  },

  -- plugins = {
  -- },
}
