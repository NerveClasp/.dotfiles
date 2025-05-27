-- require("luasnip.session.snippet_collection").clear_snippets "svelte"

local ls = require "luasnip"
local s, i, t = ls.s, ls.insert_node, ls.text_node

local fmt = require("luasnip.extras.fmt").fmt

ls.add_snippets("svelte", {
  s(
    "ssc",
    fmt(
      [[
      <script lang="ts">
        {}
      </script>{}]],
      { i(1), i(0) }
    )
  ),
  s(
    "sts",
    fmt(
      [[
      <script lang="ts">
        {}
      </script>
      
        {}
      
      <style lang="scss">
        {}
      </style>]],
      { i(1), i(2), i(0) }
    )
  ),
})
