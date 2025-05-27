if true then return {} end
-- This plugin provides a way to manage package.json dependencies in Neovim.
-- It's kinda unstable, I'll keep it here for now.

return {
  "vuki656/package-info.nvim",
  config = function()
    require("package-info").setup {
      hide_up_to_date = true,
    }
  end,
}
