-- require("luasnip.session.snippet_collection").clear_snippets "javascript"
-- require("luasnip.session.snippet_collection").clear_snippets "typescript"

local ls = require "luasnip"

local s = ls.snippet
local i = ls.insert_node
local extras = require "luasnip.extras"
local rep = extras.rep

local fmt = require("luasnip.extras.fmt").fmt

local snips = {
  s("clog", fmt("console.log(`{}`, {});{}", { rep(1), i(1), i(0) })),
  s("oclog", fmt("console.log(`{}`, {{{}}});{}", { rep(1), i(1), i(0) })),
}
ls.add_snippets("javascript", snips)
ls.add_snippets("typescript", snips)
ls.add_snippets("svelte", snips)
