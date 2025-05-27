-- if true then return {} end

return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-emoji", -- add cmp source as dependency of cmp
    },
    opts = function(_, opts)
      local cmp = require "cmp"
      local ls = require "luasnip"

      cmp.config.formatting = {
        format = require("tailwindcss-colorizer-cmp").formatter,
      }

      opts.mapping["<C-y>"] = cmp.mapping.confirm { select = false } -- TJ made me do this
      -- Think of <c-l> as moving to the right of your snippet expansion.
      --  So if you have a snippet that's like:
      --  function $name($args)
      --    $body
      --  end
      --
      -- <c-l> will move you to the right of each of the expansion locations.
      -- <c-h> is similar, except moving you backwards.
      opts.mapping["<C-l>"] = cmp.mapping(function()
        if ls.expand_or_locally_jumpable() then ls.expand_or_jump() end
      end, { "i", "s" })
      opts.mapping["<C-h>"] = cmp.mapping(function()
        if ls.locally_jumpable(-1) then ls.jump(-1) end
      end, { "i", "s" })
      opts.mapping["<Tab>"] = nil
      opts.mapping["<S-Tab>"] = nil

      opts.sources = cmp.config.sources {
        { name = "nvim_lsp", priority = 1000 },
        { name = "luasnip", priority = 750 },
        { name = "buffer", priority = 500 },
        { name = "path", priority = 250 },
        { name = "emoji", priority = 700 }, -- add new source
      }
    end,
  },
}
